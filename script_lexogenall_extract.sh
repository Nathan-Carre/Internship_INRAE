#!/bin/bash
#SBATCH --ntasks=1                   
#SBATCH --cpus-per-task=4           
#SBATCH --mem=16G                    
#SBATCH --time=80:00:00     

# Liste des ID SRA
SRA_IDS=(
    SRR12638571
    SRR12638609
    SRR12638610
    SRR12638607
    SRR12638846
    SRR12638844
    SRR12638892
    SRR12638889
    SRR12638886
    SRR12638882
    SRR12638879
    SRR12638805
    SRR12638772
    SRR12638739
    SRR12638921
    SRR12638918
    SRR12638914
    SRR12638647
    SRR12638644
    SRR12638641
    SRR12638638
    SRR12638634
)

# Boucle pour chaque ID SRA
for SRA_ID in "${SRA_IDS[@]}"; do
    echo "Processing ${SRA_ID}..."
    
    # Télécharger le fichier SRA
    prefetch $SRA_ID
    
    # Convertir le fichier SRA en fichier FASTQ
    fasterq-dump $SRA_ID
    
    # Compresser le fichier FASTQ en .fastq.gz
    gzip ${SRA_ID}.fastq
    
    echo "${SRA_ID} processed and compressed."
done

echo "All SRA files have been processed and compressed."
