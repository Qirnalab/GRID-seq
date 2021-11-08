#! /bin/bash
Input=$1
Output=$2
fastx_collapser -Q 33 -i $Input -o $Output
