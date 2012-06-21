#!/bin/bash
#$ -V                   # Inherit the submission environment
#$ -cwd                 # Start job in submission directory
#$ -j y                 # Combine stderr and stdout
#$ -o $JOB_NAME.o$JOB_ID # Name of the output file (eg. myMPI.oJobID)
#$ -pe 1way 16
#$ -q normal
#$ -l h_rt=24:00:00     # Run time (hh:mm:ss)
#$ -M $EMAIL
#$ -m be                # Email at Begin and End of job
#$ -P hpc
set -x

#$ -N nc.
for FQ in $(ls *.raw.fastq)
do
  $HOME/git/HTseq-toolbox/fastq/filter-nocall.py $FQ
done
