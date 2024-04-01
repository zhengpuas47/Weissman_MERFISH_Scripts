#!/bin/bash
# Configuration values for SLURM job submission.
#SBATCH --job-name=generate_mosaic
#SBATCH --nodes=1 
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=16gb
#SBATCH --partition=20 
#SBATCH --output /lab/solexa_weissman/wcolgan/MERFISH_Processing/slurm_reports/generate_mosaic/%x_%j.out

source activate img-env
python ../../python_scripts/generate_mosaic.py \
    --n_fov 216 \
    --file_pattern {series}/Conv_zscan_{fov:03d}.dax \
    --downsample_factor 4 \
    --path /lab/weissman_imaging/wcolgan/MERFISH_Data/20240206-F168_antiEPCAM/ \
    --img_path /lab/weissman_imaging/puzheng/4T1Tumor/20240206-F168_antiEPCAM/ \
    --correction_path /lab/weissman_imaging/puzheng/Corrections/20230902-Merscope01_s30_n500/ \
