#! /bin/bash
Input=$1
Output=$2
fastx_clipper -Q 33 -a AGATCGGAAGAGCACACGTCT -i $Input -o $Output
