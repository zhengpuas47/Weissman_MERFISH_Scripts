#!/bin/bash
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -t 2-00:00:00
#SBATCH --mem 16000
#SBATCH --open-mode=append
#SBATCH --partition=weissman            # partition (queue) to use; 20 for shared, weissman for dedicated
#SBATCH --account=weissman              # this is necessary if partition is weissman
#SBATCH -o /lab/weissman_imaging/puzheng/slurm_reports/MERLin_Scheduler/%j.stdout
#SBATCH -e /lab/weissman_imaging/puzheng/slurm_reports/MERLin_Scheduler/%j.stdout

date +'Starting at %R.'

#choose_the_correct_conda
#. "/home/puzheng/miniconda3/bin/conda"
#export PATH="/home/puzheng/miniconda3/bin:$PATH"
#change_to_merlin_environment
#conda activate merlin_env

merlin -a 20230818-MF1_full.json \
		-o 20230818-MF1_msBrain_22bit.csv \
		-c MF1_codebook.csv \
		-m merscope01_microscope.json \
		-p 20230816_positions.txt \
		-e /lab/weissman_imaging/puzheng/MERFISH_data \
		-s /lab/weissman_imaging/puzheng/MERFISH_analysis \
		-k run_MF1_cellpose.json \
		-n 2 \
		--no_report True \
		20230816-ms-Asw016_MF1
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
