# fs_accre
Run FreeSurfer's recon-all (https://surfer.nmr.mgh.harvard.edu/) on Vanderbilt's ACCRE using a singularity 3.4 image (https://sylabs.io/guides/3.4/user-guide/)

Need to add 'inputs' folder and 'outputs' folder to the project directory (see the .txt files in /code for input and output subdirectory setup)

The T1 image in each input subdirectory must be named 't1.nii.gz'

1) Build the singularity: singularity build <name>.simg recipe_fs_accre_v<x.x>.txt

2) singularity exec -e --contain -B /tmp:/tmp -B ~/PROJECTS/fs_accre/inputs/Spat35/:/INPUTS -B ~/PROJECTS/fs_accre/outputs/Spat35/:/OUTPUTS ~/PROJECTS/fs_accre/singularity/fs_accre_v1.1.simg bash /CODE/main.sh 8
