# SPMD-IR EuroMPI 2025 Artifact

This repository contains the **artifact** accompanying the paper:

> **"Extending the SPMD IR for RMA Models and Static Data Race Detection"**
> by *Semih Burak, Simon Schwitanski, Felix Tomski, Jens Domke, and Matthias Müller*
> Submitted at **EuroMPI 2025** ([https://eurompi.org/](https://eurompi.org/))

---

## 📁 Directory Structure

* **`llvm-project/`**
  Contains the patched LLVM 20 project, included as a Git submodule.

* **`spmd/`**
  Contains all source code related to the SPMD IR project itself, implemented as an MLIR dialect and analysis/transformation passes.

* **`evaluation-benchmark-suites/`**
  Contains the test programs used for evaluation:

  * Micro-benchmark suites: **MBB**, **RMARaceBench**
  * Proxy applications: **Stencil** (MPI and SHMEM versions), **MiniWeather**, and **TeaLeaf**

* **`evaluation-results/`**
  Contains output data and analysis results obtained from running the benchmarks within the Apptainer environment.

* **`reproducibility/`**
  Contains all files related to setting up and using the Apptainer-based experiment environment for reproducing our results.

---

## 🔁 Submodules

This repository includes Git submodules. After cloning, run the following command to initialize and fetch them:

```bash
git submodule update --init --recursive
```
