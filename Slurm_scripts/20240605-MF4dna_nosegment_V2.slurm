#!/bin/bash
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -t 2-00:00:00
#SBATCH --mem 16000
#SBATCH --open-mode=append
#SBATCH --partition=weissman            # partition (queue) to use; 20 for shared, weissman for dedicated
#SBATCH --account=weissman              # this is necessary if partition is weissman, for partition-20, use wibrusers
#SBATCH -o /lab/weissman_imaging/puzheng/slurm_reports/MERLin_Scheduler/%j.stdout
#SBATCH -e /lab/weissman_imaging/puzheng/slurm_reports/MERLin_Scheduler/%j.stdout

date +'Starting at %R.'

#choose_the_correct_conda
#. "/home/puzheng/miniconda3/bin/conda"
#export PATH="/home/puzheng/miniconda3/bin:$PATH"
#change_to_merlin_environment
source activate merlin_py310

merlin -a 20231226-MF4_noSegment.json \
		-o 20240605-MF4_16bit.csv \
		-c MF4dna_codebook.csv \
		-m merscope01_microscope.json \
		-p 20240605_positions.txt \
		-e /lab/weissman_imaging/puzheng/4T1Tumor \
		-s /lab/weissman_imaging/puzheng/MERFISH_analysis \
		-k run_MF4_cellpose.json \
		-n 2 \
		--no_report True \
		20240605-F319_depcTailVein_MF4dna_mcherry
#NOTES:
#analysis_parameter
#data_organization_file
#codebook_file
#miscrope_setting_file
#recorded_position_file
#Data_HOME
#ANALYSIS_HOME
#Snakemake_parameter
#number_of_cores
#other_options
#data_folder

date +'Finished at %R.'
