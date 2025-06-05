#!/usr/bin/env bash

(cd apptainer && apptainer build spmdir.sif Apptainer.spmdir.def)
(cd apptainer && apptainer build rmasanitizer.sif Apptainer.rmasanitizer.def)
(cd apptainer && apptainer build must.sif Apptainer.must.def)
(cd apptainer && apptainer build parcoach.sif Apptainer.parcoach.def)
