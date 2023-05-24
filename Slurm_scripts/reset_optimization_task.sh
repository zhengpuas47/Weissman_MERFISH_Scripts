#!/usr/bin/bash
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -t 10:00
#SBATCH --mem 1000
#SBATCH --open-mode=append
#SBATCH --partition=20            # partition (queue) to use; 20 for shared, weissman for dedicated
#SBATCH --account=wibrusers              # this is necessary if partition is weissman
#SBATCH -o /lab/weissman_imaging/puzheng/slurm_reports/MERLin_Jobs/%j.stdout
#SBATCH -e /lab/weissman_imaging/puzheng/slurm_reports/MERLin_Jobs/%j.stderr

date +'Starting at %R.'

DATA_FOLDER="$1"

echo 'Cleanup' $DATA_FOLDER

ls $DATA_FOLDER | grep Optimize | awk '{print "/" $1 "/tasks/task.json"}' | xargs -I {} -n 1 rm $DATA_FOLDER{}

date +'Finished at %R.'
