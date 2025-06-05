//===- common.cpp - checking related utilities - Source -----------------*- C++ -*-===//
//
// This file is licensed under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
// SPDX-FileCopyrightText: 2025 Semih Burak, RWTH Aachen University
//
//===----------------------------------------------------------------------===//
//
// This implements miscellaneous functionality  useful for the checking passes
// and related components that do not fit into one component. 
//
//===----------------------------------------------------------------------===//

#include "common.h"
#include <optional>

//try out
// #include "spmd/SPMDOps.h"
// #include "llvm/Support/Debug.h"
#include "mlir/IR/BuiltinAttributes.h"

#include "common.h"

#define DEBUG_TYPE "common"

#define PATTERN "main"
#define DBGS() ::llvm::dbgs() << "[" DEBUG_TYPE ":" << PATTERN << "] "

namespace mlir::spmd {

// copied over from Diagnostics.cpp
std::optional<Location> findLocToShow(Location loc) {
  // if (!shouldShowLocFn)
  //   return loc;
  // if (!shouldShowLocFn(loc))
  //   return std::nullopt;

  // Recurse into the child locations of some of location types.
  return TypeSwitch<LocationAttr, std::optional<Location>>(loc)
      .Case([&](CallSiteLoc callLoc) -> std::optional<Location> {
        // We recurse into the callee of a call site, as the caller will be
        // emitted in a different note on the main diagnostic.
        return findLocToShow(callLoc.getCallee());
      })
      .Case([&](FileLineColLoc) -> std::optional<Location> { return loc; })
      .Case([&](FusedLoc fusedLoc) -> std::optional<Location> {
        // Fused location is unique in that we try to find a sub-location to
        // show, rather than the top-level location itself.
        for (Location childLoc : fusedLoc.getLocations())
          if (std::optional<Location> showableLoc = findLocToShow(childLoc))
            return showableLoc;
        return std::nullopt;
      })
      .Case([&](NameLoc nameLoc) -> std::optional<Location> {
        return findLocToShow(nameLoc.getChildLoc());
      })
      .Case([&](OpaqueLoc opaqueLoc) -> std::optional<Location> {
        // OpaqueLoc always falls back to a different source location.
        return findLocToShow(opaqueLoc.getFallbackLocation());
      })
      .Case([](UnknownLoc) -> std::optional<Location> {
        // Prefer not to show unknown locations.
        return std::nullopt;
      });
}

Location findLocToShowWrapper(Location loc) {
  // This function is used to find a location to show in the diagnostics.
  // It checks if the location should be shown and returns it if so.
  // Otherwise, it returns std::nullopt.
  return findLocToShow(loc).value_or(loc);
}

llvm::json::Object getLocationJson(Location loc) {
  if (auto fileLoc = dyn_cast<FileLineColLoc>(loc)) {
    std::string file = fileLoc.getFilename().str();

    llvm::SmallString<256> absPath(file);
    if (!llvm::sys::fs::real_path(file, absPath)) {
      file = absPath.str().str();
    }

    return llvm::json::Object{
        {"file", file},
        {"line", fileLoc.getLine()},
        {"column", fileLoc.getColumn()}
    };
  }

  return llvm::json::Object{
      {"file", "<unknown>"},
      {"line", 0},
      {"column", 0}
  };
}


std::string locToString(Location loc) {
  if (auto fileLoc = dyn_cast<FileLineColLoc>(loc))
    return (llvm::Twine(fileLoc.getFilename()) + ":" +
            llvm::Twine(fileLoc.getLine()) + ":" +
            llvm::Twine(fileLoc.getColumn())).str();
  return "<unknown location>";
}

} // namespace mlir::spmd