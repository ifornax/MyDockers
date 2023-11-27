#!/bin/bash -p
#
# This will build the docker - copy and paste 
#
echo  "Starting..."
DOCKER_NAME="kathprfidocker"

# docker build -t $DOCKER_NAME . # uncomment and run in case dockerimage is not available

DOCKER_OPTS="-it "\
"--rm "\
"--volume=\"/etc/group:/etc/group:ro\" "\
"--volume=\"/etc/passwd:/etc/passwd:ro\" "\
"--volume=\"/etc/shadow:/etc/shadow:ro\" "\
"--volume=\"/etc/sudoers.d:/etc/sudoers.d:ro\" "\
"--volume=\"/:/host:rw\" "\
"--volume=\"/data3/nadeem/GitHub:/home/nadeem/GitHub:rw\" "\
"--volume=\"/data3/nadeem/rfi-chronicles:/home/nadeem/rfi-chronicles:rw\" "\
"--volume=\"/data3/nadeem/KATHPRFI/RDB_FILES:/home/nadeem/KATHPRFI/RDB_FILES:rw\" "\
"--volume=\"/data3/nadeem/KATHPRFI/FLAG_FILES:/home/nadeem/KATHPRFI/FLAG_FILES:rw\" "\
"--volume=\"/data3/nadeem/KATHPRFI/OUT_ZARR:/home/nadeem/KATHPRFI/OUT_ZARR:rw\" "\
"--volume=\"/data3/nadeem/KATHPRFI/GOOD_FILES:/home/nadeem/KATHPRFI/GOOD_FILES:rw\" "\
"--volume=\"/data3/nadeem/KATHPRFI/BAD_FILES:/home/nadeem/KATHPRFI/BAD_FILES:rw\" "\
"--volume=\"/tmp:${HOME}:rw\" "\
"-e HOME=\"${HOME}\" "\
"--user=`id -ur` "\
"--net=host "\
"-e QT_X11_NO_MITSHM=1 "\
"-e DISPLAY=${DISPLAY} "\
"--volume=\"${HOME}/.Xauthority:${HOME}/.Xauthority\" "\
"--volume=\"${HOME}/.Xdefaults:${HOME}/.Xdefaults\" "\

echo "Docker set..."
#
# This is what Isaac runs normally
#
#alias kathprfidocker="docker run ${DOCKER_OPTS} --name $DOCKER_NAME $DOCKER_NAME --vis /scratch2/isaac/rfi_data/subset/time2/min284 -f /scratch2#/isaac/rfi_data/3calImaging/flags/ -z /scratch2/isaac/rfi_data/subset/time2/min#284/min284.zarr -g /data/nadeem/MeerKAT/Testing/newfiles/gd_files.npy -b /data/#nadeem/MeerKAT/Testing/newfiles/bd_files.npy -n 1"

#- v : path to full rdb files
#- f  : path to flag files
#- z : path where you will save your zarr array, you need to give it the name of# the array also.
#- g : path where you will save your array of good files, you need to give it the# name of the array also.
#- b : path where you will save your  array of bad files, you need to give it the# name of the array also.

BAND="HV" # band under investigation

SCRIPT="$HOME/GitHub/kathprfi/script/kathprfi_script.py"
#CFGFILE="$HOME/KATHPRFI/RDB_FILES/kathprfi_config_SCI_Imaging_L_2021-01-01_2021-01-31.txt"
#CFGFILE="$HOME/KATHPRFI/RDB_FILES/kathprfi_config_SCI_Imaging_L_2021-10-01_2021-11-31.txt"
# Oct-Dec 2021 files
#CFGFILE="kathprfi_config_SCI_Imaging_4096_2021-10-01_2021-12-31.txt"
#CFGFILE="$HOME/KATHPRFI/RDB_FILES/kathprfi_config_SCI_Imaging_L_2021-12-31_2022-06-01_HH.txt"
#CFGFILE="$HOME/KATHPRFI/RDB_FILES/kathprfi_config_file_template_Sband.txt"
CFGFILE="$HOME/KATHPRFI/RDB_FILES/kathprfi_config_file_template_Sband_25Nov2022.txt"

# These are for output

OUTZARR="$HOME/KATHPRFI/OUT_ZARR/sband_${BAND}_.zarr"
GOODFILES="$HOME/KATHPRFI/GOOD_FILES/good_files_sband_${BAND}_2021NovSci.npy"
BADFILES="$HOME/KATHPRFI/BAD_FILES/bad_files_sband_${BAND}_2021NovSci.npy"

#export PYTHONPATH="${PYTHONPATH}:$HOME/GitHub/kathprfi/kathprfi"

echo "Running KATHPRFI now ..."
#alias kathprfiLband="docker run ${DOCKER_OPTS} --name $DOCKER_NAME $DOCKER_NAME python3 $HOME/GitHub/kathprfi/script/kathprfi_script.py -c $HOME/rfi-chronicles/data/lband/KATHPRFI_Archive_copy/DSData/rfi_data/kathprfi_config_lband.txt -z $HOME/KATHPRFI/OUT_ZARR/lband_.zarr -b $HOME/KATHPRFI/BAD_FILES/bad_files_lband.npy -g $HOME/KATHPRFI/GOOD_FILES/good_files_lband.npy"
#alias kathprfiLband="docker run ${DOCKER_OPTS} --name $DOCKER_NAME $DOCKER_NAME python3 $HOME/GitHub/kathprfi/script/kathprfi_script.py -c $HOME/KATHPRFI/RDB_FILES/kathprfi_config_SCI_Imaging_L_2021-01-01_2021-01-31.txt -z $HOME/KATHPRFI/OUT_ZARR/lband_HH_.zarr -b $HOME/KATHPRFI/BAD_FILES/bad_files_lband_HV_2021JanSci.npy -g $HOME/KATHPRFI/GOOD_FILES/good_files_lband_HV_2021JanSci.npy"
alias kathprfiSband="docker run ${DOCKER_OPTS} --name $DOCKER_NAME $DOCKER_NAME python3 $SCRIPT -c $CFGFILE -z $OUTZARR -b $BADFILES -g $GOODFILES"

echo "Type kathprfiSband to run the process..."
