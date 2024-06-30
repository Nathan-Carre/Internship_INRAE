# Liste des SRA_ID
sra_ids = [
    "SRR22952546", "SRR22952571", "SRR22952575", "SRR22952628", 
    "SRR22952780", "SRR22952854", "SRR22952557", "SRR22952573", 
    "SRR22952576", "SRR22952690", "SRR22952786", "SRR22952570", 
    "SRR22952574", "SRR22952578", "SRR22952701", "SRR22952853"
]

# Chemin de base
base_path = "/work/user/ncarre/Results/variant_calling/"

# Construire les lignes du fichier
lines = [f"{sra_id}\t{base_path}{sra_id}/{sra_id}.haplotypecaller.combined.g.vcf.gz" for sra_id in sra_ids]

# Nom du fichier de sortie
output_file = "VCF_diversity.sample_map"

# Écrire les lignes dans le fichier
with open(output_file, "w") as f:
    for line in lines:
        f.write(line + "\n")

print(f"Le fichier {output_file} a été créé avec succès.")

