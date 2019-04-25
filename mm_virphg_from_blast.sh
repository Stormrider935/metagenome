#!/bin/bash

Programm () {
  echo "Usage eg.: [ $0  -a [Path to your Blast Output_file.txt] ]" 1>&2
}

Sorting_Blast_result () {

# sort for e-value and singularize species with highest e-value_uniqe_entries
# awk: document with evalues smaller than 1.0E-99 --> very high sequence consensus
export LC_NUMERIC=en_US.utf-8
sort  -g  -k2,2 $Blast_result | sort -u -k4,4 | sort  -g  -k2,2 >Blast_result_final.txt
awk '$2<=1.0E-99 '  Blast_result_final.txt > cutoff_Blast_result_final.txt

}

# get information for input
while getopts ":a:" options; do
  case $options in

      a ) Blast_result=($OPTARG)
          Sorting_Blast_result
          ;;

      : ) Programm
          exit 1
            ;;
        esac
        done
