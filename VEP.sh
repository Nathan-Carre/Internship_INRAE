
module load bioinfo/Ensembl-VEP/110.1
vep -i homo_sapiens_GRCh38.vcf -o out.txt --verbose --cache --dir_cache=/usr/local/bioinfo/src/Ensembl-VEP/CACHEDIR --offline --cache_version=110
