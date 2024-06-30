#!/bin/bash
#SBATCH --ntasks=1                   
#SBATCH --cpus-per-task=4           
#SBATCH --mem=16G                    
#SBATCH --time=24:00:00              

gzip -c 'SRR21691443_1.fastq'  > 'SRAfastqgz/SRR21691443_1.fastq.gz'  
gzip -c 'SRR21691443_2.fastq' >  'SRAfastqgz/SRR21691443_2.fastq.gz'  
gzip -c  'SRR21691444_1.fastq' >  'SRAfastqgz/SRR21691444_1.fastq.gz'  
gzip -c  'SRR21691444_2.fastq' > 'SRAfastqgz/SRR21691444_2.fastq.gz' 
gzip -c  'SRR21691445_1.fastq' >  'SRAfastqgz/SRR21691445_1.fastq.gz'  
gzip -c  'SRR21691445_2.fastq' >  'SRAfastqgz/SRR21691445_2.fastq.gz'  
gzip -c  'SRR21691446_1.fastq' >  'SRAfastqgz/SRR21691446_1.fastq.gz'  
gzip -c  'SRR21691446_2.fastq' >  'SRAfastqgz/SRR21691446_2.fastq.gz'  
gzip -c  'SRR21691447_1.fastq' >  'SRAfastqgz/SRR21691447_1.fastq.gz'  
gzip -c  'SRR21691447_2.fastq' >  'SRAfastqgz/SRR21691447_2.fastq.gz' 

