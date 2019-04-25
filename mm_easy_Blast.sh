#!/bin/bash

Programm () {
  echo "Usage eg.: [ $0  -a [Path to your query] -b [Path to your DB] -c [Name_of_your_outputfile.txt] ]" 1>&2
}
#BLASTn tabular output format 6
#Column headers:
#qseqid sseqid pident length mismatch gapopen qstart qend sstart send evalue bitscore

 #1. 	 qseqid 	 query (e.g., gene) sequence id
 #2. 	 sseqid 	 subject (e.g., reference genome) sequence id
 #3. 	 pident 	 percentage of identical matches
 #4. 	 length 	 alignment length
 #5. 	 mismatch 	 number of mismatches
 #6. 	 gapopen 	 number of gap openings
 #7. 	 qstart 	 start of alignment in query
 #8. 	 qend 	 end of alignment in query
 #9. 	 sstart 	 start of alignment in subject
 #10. 	 send 	 end of alignment in subject
 #11. 	 evalue 	 expect value
 #12. 	 bitscore 	 bit score
 #13. stitle      organism name full

Blast_Program () {

  blastn \
  -query $Blast_querry \
  -db $Path_to_DB \
  -out $Blast_Outputname \
  -outfmt "6 bitscore evalue qseqid sseqid stitle "
}

# get information for input
while getopts ":a:b:c:" options; do
  case $options in

      a ) Blast_querry=($OPTARG)
          Blast_Program
          ;;

      b ) Path_to_DB=($OPTARG)
          Blast_Program
          ;;

      c)  Blast_Outputname=($OPTARG)
          Blast_Program
          ;;

      : ) Programm
          exit 1
            ;;
        esac
        done
