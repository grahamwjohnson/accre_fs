
echo "Hello, World from main Bash script!"

THREADS=$1
echo "Number of threads: $THREADS"

export FREESURFER_HOME=/APPS/freesurfer
source $FREESURFER_HOME/SetUpFreeSurfer.sh
export SUBJECTS_DIR=/OUTPUTS

echo "running command: recon-all -i /INPUTS/t1.nii.gz -s FS -all -parallel -openmp $THREADS"
recon-all -i /INPUTS/t1.nii.gz -s FS -all -parallel -openmp $THREADS

