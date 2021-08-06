#! /bin/bash
Reference=$1
Input=$2
Output=$3

bowtie -m 0 -p 8 $Reference $Input -S $Output
