#!/bin/bash

#SBATCH --account=p_englot_group
#SBATCH --mail-user=graham.w.johnson@vanderbilt.edu
#SBATCH --mail-type=ALL
#SBATCH -J fs_reconall
#SBATCH --ntasks=4
#SBATCH --nodes=1
#SBATCH --time=05-00:00:00
#SBATCH --mem=8G
#SBATCH --nice=1000000000
#SBATCH -o /scratch/johnsgw2/projects/fs_accre/code/logs/%A_%a.out
#SBATCH -e /scratch/johnsgw2/projects/fs_accre/code/logs/%A_%a.err

#SBATCH --array=0-1

mapfile -t in_dirs < /scratch/johnsgw2/projects/fs_accre/code/input_dir_list.txt
mapfile -t out_dirs < /scratch/johnsgw2/projects/fs_accre/code/output_dir_list.txt

# first arg in main.sh is threads to use (MUST MATCH 'ntasks' above)
singularity exec -e --contain -B /tmp:/tmp -B ${in_dirs[$SLURM_ARRAY_TASK_ID]}:/INPUTS -B ${out_dirs[$SLURM_ARRAY_TASK_ID]}:/OUTPUTS /scratch/johnsgw2/projects/fs_accre/singularity/fs_accre_v1.1.simg bash /CODE/main.sh 4

