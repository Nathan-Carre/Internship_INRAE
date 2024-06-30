#!/bin/bash
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=16G
#SBATCH --time=72:00:00

# Load the SRA Toolkit module
module load bioinfo/SRA-Toolkit/3.0.2

# Define an array of SRA IDs to process

declare -a SRA_IDS=(
SRR22952780
SRR22952578
SRR22952575
SRR22952576
SRR22952574
SRR22952573
SRR22952571
SRR22952570

SRR22952614
SRR22952612
SRR22952601
SRR22952598
SRR22952597
SRR22952592
SRR22952734
SRR22952732

SRR22952731
SRR22952730
SRR22952729
SRR22952728
SRR22952727
SRR22952726
SRR22952725
SRR22952724

SRR22952854
SRR22952853
SRR22952628
SRR22952786
SRR22952701
SRR22952690
SRR22952557
SRR22952546

SRR22952742
SRR22952741
SRR22952740
SRR22952739
SRR22952737
SRR22952736
SRR22952619
SRR22952618

SRR22952754
SRR22952753
SRR22952752
SRR22952751
SRR22952750
SRR22952748
SRR22952747
SRR22952746

)

# Directory to store the final zipped FASTQ files
output_dir="/work/user/ncarre/diversity/SRA_fastqzip"
mkdir -p "$output_dir"

# Main processing loop
for sra_id in "${SRA_IDS[@]}"; do
  echo "Processing $sra_id..."

  # Prefetch the SRA file
  prefetch "$sra_id" --max-size 100000000000
  
  # Define the path to the downloaded SRA file
  sra_file_path="/work/user/ncarre/diversity/${sra_id}/${sra_id}.sra"

  # Check if the SRA file was downloaded and exists in the expected directory
  if [[ -f "$sra_file_path" ]]; then
    # Convert SRA to FASTQ
    fasterq-dump "$sra_file_path" --split-files --threads 4 --outdir .

    # Compress the FASTQ files and then remove them
    for fastq_file in ${sra_id}*.fastq; do
      if [[ -f "$fastq_file" ]]; then
        gzip "$fastq_file"
        mv "${fastq_file}.gz" "$output_dir"
        # Remove the original FASTQ file after compression
        rm -f "$fastq_file"
      fi
    done

    # Remove the original SRA file to save space
    rm -f "$sra_file_path"
  else
    echo "Failed to download $sra_id or the file does not exist."
  fi
done

echo "Processing complete."
