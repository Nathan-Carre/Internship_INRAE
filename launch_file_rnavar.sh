#!/bin/bash
#SBATCH -J rnavar
#SBATCH -p workq
#SBATCH --mem=10G

module purge
#module load bioinfo/Nextflow/23.10.0
#module load devel/java/17.0.6
module load bioinfo/NextflowWorkflows/nfcore-Nextflow-v23.04.3

cd /work/user/kmeydan

nextflow run "/work/user/kmeydan/fork/rnavar" \
                                --outdir /work/user/kmeydan/Results -profile genotoul \
                                --input /work/user/kmeydan/diversity_reduced.csv \
                                -c /work/user/kmeydan/RNAVAR/sm_config.cfg \
                                --generate_gvcf \
                                -with-timeline -with-report -with-trace \
                                --fasta /work/user/kmeydan/RNAVAR/Data/GENOME/Bos_taurus.ARS-UCD1.3.dna.toplevel.fa \
                                --star_index /work/user/kmeydan/RNAVAR/Data/STARIndex \
                                --dict /work/user/kmeydan/RNAVAR/Data/GENOME/Bos_taurus.ARS-UCD1.3.dna.toplevel.dict \
                                --gtf /work/user/kmeydan/RNAVAR/Data/ANNOTATION/Bos_taurus.ARS-UCD1.3.111.gtf.gz\
                                --known_indels /work/user/kmeydan/RNAVAR/Data/VCF/bos_taurus_indels_sorted_clean.vcf.gz \
                                --known_indels_tbi /work/user/kmeydan/RNAVAR/Data/VCF/bos_taurus_indels_sorted_clean.vcf.gz.tbi \
                                --dbsnp  /work/user/kmeydan/RNAVAR/Data/VCF/bos_taurus_dbSNP_150.vcf.gz \
                                --dbsnp_tbi /work/user/kmeydan/RNAVAR/Data/VCF/bos_taurus_dbSNP_150.vcf.gz.tbi \
                                --skip_variantfiltration \
                                -resume