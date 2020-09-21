
echo "Hello, World from main Bash script!"

THREADS=$1
echo "Number of threads: $THREADS"

export FREESURFER_HOME=/APPS/freesurfer
source $FREESURFER_HOME/SetUpFreeSurfer.sh
export SUBJECTS_DIR=/OUTPUTS

NAME="freesurfer_reconall_$(date +"%Y_%m_%d_%H%M%S")"

echo "running command: recon-all -i /INPUTS/t1.nii.gz -s $NAME -all -parallel -openmp $THREADS"
recon-all -i /INPUTS/t1.nii.gz -s $NAME -all -parallel -openmp $THREADS

