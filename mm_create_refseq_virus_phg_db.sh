#!/bin/bash

# annotations
wget ftp://ftp.ncbi.nlm.nih.gov/refseq/release/viral/viral.1.genomic.gbff.gz
gunzip viral.1.genomic.gbff.gz
wget ftp://ftp.ncbi.nlm.nih.gov/refseq/release/viral/viral.1.protein.gpff.gz
gunzip viral.1.protein.gpff.gz

# viral refseq genomic
wget ftp://ftp.ncbi.nlm.nih.gov/refseq/release/viral/viral.1.1.genomic.fna.gz
gunzip viral.1.1.genomic.fna.gz
makeblastdb -dbtype nucl \
        -parse_seqids \
        -in viral.1.1.genomic.fna \
        -out viral.1.1.genomic \
        -title 'Virus_refseq_genomic_db'

# viral refseq protein
wget ftp://ftp.ncbi.nlm.nih.gov/refseq/release/viral/viral.1.protein.faa.gz
gunzip viral.1.protein.faa.gz
makeblastdb -dbtype prot \
        -parse_seqids \
        -in viral.1.protein.faa \
        -out viral.1.protein \
-title 'Virus_refseq_protein_db'
