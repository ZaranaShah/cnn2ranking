#!/usr/bin/env sh

caffe train -solver basic_16to66/ot_16/solver_basic.prorotxt -weights basic_16to66/trained_base.caffemodel -gpu 0  2>&1 | tee basic_16to66/ot_16/logfile_ot_16.log
