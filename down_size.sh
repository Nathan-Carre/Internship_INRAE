#!/bin/bash
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=16G
#SBATCH --time=24:00:00

module load bioinfo/seqtk  # Charger le module seqtk si disponible sur le clust$

seqtk seq -A -f1 /work/user/kmeydan/SRA_fastq_zip/ERR883675_1.fastq.gz | head -n 400000 > /work/user/kmeydan/Sarek/downsized_ERR883675_1.$
seqtk seq -A -f1 /work/user/kmeydan/SRA_fastq_zip/ERR883675_2.fastq.gz | head -n 400000 > /work/user/kmeydan/Sarek/downsized_ERR883675_2.$
