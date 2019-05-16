#!/bin/bash

Programm () {
  echo "Usage eg.: [ $0  -a [Path to your Blast Output_file.txt] ]" 1>&2
}

Sorting_Blast_result ()
{

# sort for e-value and singularize species with highest e-value_uniqe_entries
# awk: document with evalues smaller than 1.0E-99 --> very high sequence consensus

#nach e-value  sortieren
# -g sort alphanumerical
# -k2,2 2,2 means the sort key starts at column 2 and ends at column2, so col 2 only.
# schauen ob locale stimmt  (LC_ALL=C sor -g)
# sort -u  unique title of organism
# sort -r in umgekehrter reihenfolge

export LC_NUMERIC=en_US.utf-8
sort  -g  -k1,1 $Blast_result | awk '$1<=1.0E-150 '  > test1.txt
awk '$5>=10000 ' test1.txt | sort -g -r -k5,5 >test2.txt && rm test1.txt
printf "e-value\tbitscore\tqseqid\tsseqid\tlentght\tnident\tppos\tgaps\ttitle\n" > final_Blast_result.txt
cat test2.txt >> final_Blast_result.txt && rm test2.txt
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

# evalue bitscore qseqid sseqid length nident ppos gaps stitle
