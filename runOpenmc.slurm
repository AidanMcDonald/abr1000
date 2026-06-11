#!/bin/bash -e

#SBATCH -J openmc
#SBATCH --export=NONE
#SBATCH --partition=hbv4-1,hbv4-2
#SBATCH --output=openmc%j.out
#SBATCH --error=openmc%j.err
#SBATCH --time=1-00:00:00
#SBATCH --ntasks=176

#SBATCH --exclusive

echo -e "Slurm Job ID: $SLURM_JOB_ID \n"

module use /anfhome/apps/oneapi/modulefiles
module load mpi/openmpi
module load icc/2022.2.0
export SLURM_MPI_TYPE=none
export SLURM_EXPORT_ENV=ALL
echo "Start Time: $(date)"
echo ""

echo ":========== Start Job and System Information ==========:"
/anfhome/apps/prod/tools/joblogs/v1.0.0/linux/joblogs.x
echo ":=========== End Job and System Information ===========:"
echo ""

mpirun -n 2 openmc --threads 88

echo "End Time: $(date)"