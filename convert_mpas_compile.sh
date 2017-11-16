#!/bin/sh -f
# J. Cipriani - 10/14/2016

# get Linux distribution 
distribution=`uname -r`
# for intel compilers ...
export fortran_flags="-O2 -free -DHAVE_NF90_INQ_VARIDS"

if [[ $distribution == "3.0.101-0.46.1_1.0502.8871-cray_ari_s" ]]; then

    module swap PrgEnv-cray PrgEnv-intel
    module load cray-netcdf
    module load cray-parallel-netcdf
    module load cray-hdf5
    module load craype-broadwell
    module load cray-mpich
    module load craype-hugepages16M

    # Path to libnetcdf.a
    export NETCDF=$NETCDF_DIR
    export LAPACK_PATH=${MKLROOT}/lib/intel64_lin
    export fortran_compiler=ftn

elif [[ $distribution == "2.6.32-279.14.1.el6.x86_64" ]]; then

    # Path to libnetcdf.a
    export NETCDF=/usr/local
    export LAPACK_PATH=/share/apps/intel/composer_xe_2016.0.0-109/compilers_and_libraries_2016.0.109/linux/mkl/lib/intel64_lin
    export fortran_compiler=ifort

fi


echo "*****************************************************************************************"
echo "Compiling the convert_mpas utility w/ ifort (for $distribution)"
echo "*****************************************************************************************"

make clean
make

exit
