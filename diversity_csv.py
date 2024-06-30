import pandas as pd

# List of SRA IDs provided by the user
sra_ids = [
    "SRR22952780", "SRR22952578", "SRR22952575", "SRR22952576", "SRR22952574",
    "SRR22952573", "SRR22952571", "SRR22952570", "SRR22952614", "SRR22952612",
    "SRR22952601", "SRR22952598", "SRR22952597", "SRR22952592", "SRR22952734",
    "SRR22952732", "SRR22952731", "SRR22952730", "SRR22952729", "SRR22952728",
    "SRR22952727", "SRR22952726", "SRR22952725", "SRR22952724", "SRR22952854",
    "SRR22952853", "SRR22952628", "SRR22952786", "SRR22952701", "SRR22952690",
    "SRR22952557", "SRR22952546", "SRR22952742", "SRR22952741", "SRR22952740",
    "SRR22952739", "SRR22952737", "SRR22952736", "SRR22952619", "SRR22952618",
    "SRR22952754", "SRR22952753", "SRR22952752", "SRR22952751", "SRR22952750",
    "SRR22952748", "SRR22952747", "SRR22952746"
]

# Base path for the files
base_path = '/work/user/ncarre/diversity/SRA_fastqzip/'

# Create a new dataframe with the required format
data = {
    'sample': sra_ids,
    'fastq_1': [f"{base_path}{sra_id}_1.fastq.gz" for sra_id in sra_ids],
    'fastq_2': [f"{base_path}{sra_id}_2.fastq.gz" for sra_id in sra_ids]
}

new_df = pd.DataFrame(data)

# Save the new dataframe to a CSV file
output_file = 'diversity_samples.csv'
new_df.to_csv(output_file, index=False)



