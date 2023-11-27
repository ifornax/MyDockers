
#!/bin/bash -p
#
# This will build the docker - copy and paste 
#
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
"--volume=\"/data3/nadeem/KATHPRFI_LBAND/RDB_FILES:/home/nadeem/KATHPRFI_LBAND/RDB_FILES:rw\" "\
"--volume=\"/data3/nadeem/KATHPRFI_LBAND/FLAG_FILES:/home/nadeem/KATHPRFI_LBAND/FLAG_FILES:rw\" "\
"--volume=\"/data3/nadeem/KATHPRFI_LBAND/OUT_ZARR:/home/nadeem/KATHPRFI_LBAND/OUT_ZARR:rw\" "\
"--volume=\"/data3/nadeem/KATHPRFI_LBAND/GOOD_FILES:/home/nadeem/KATHPRFI_LBAND/GOOD_FILES:rw\" "\
"--volume=\"/data3/nadeem/KATHPRFI_LBAND/BAD_FILES:/home/nadeem/KATHPRFI_LBAND/BAD_FILES:rw\" "\
"--volume=\"/tmp:${HOME}:rw\" "\
"-e HOME=\"${HOME}\" "\
"--user=`id -ur` "\
"--net=host "\
"-e QT_X11_NO_MITSHM=1 "\
"-e DISPLAY=${DISPLAY} "\
"--volume=\"${HOME}/.Xauthority:${HOME}/.Xauthority\" "\
"--volume=\"${HOME}/.Xdefaults:${HOME}/.Xdefaults\" "\


#
# This is what Isaac runs normally
#
#alias kathprfidocker="docker run ${DOCKER_OPTS} --name $DOCKER_NAME $DOCKER_NAME --vis /scratch2/isaac/rfi_data/subset/time2/min284 -f /scratch2#/isaac/rfi_data/3calImaging/flags/ -z /scratch2/isaac/rfi_data/subset/time2/min#284/min284.zarr -g /data/nadeem/MeerKAT/Testing/newfiles/gd_files.npy -b /data/#nadeem/MeerKAT/Testing/newfiles/bd_files.npy -n 1"

#- v : path to full rdb files
#- f  : path to flag files
#- z : path where you will save your zarr array, you need to give it the name of# the array also.
#- g : path where you will save your array of good files, you need to give it the# name of the array also.
#- b : path where you will save your  array of bad files, you need to give it the# name of the array also.

POL="HH" # pol under investigation
BAND="lband"
TXT="kathprfi_config_SCI_Imaging_L_2021-02-01_2021-02-28"
SCRIPT="$HOME/GitHub/kathprfi/script/kathprfi_script.py"
CFGFILE="$HOME/KATHPRFI_LBAND/RDB_FILES/${TXT}_${POL}.txt"

# These are for output

OUTZARR="$HOME/KATHPRFI_LBAND/OUT_ZARR/${BAND}_${POL}_.zarr"
GOODFILES="$HOME/KATHPRFI_LBAND/GOOD_FILES/good_files_${BAND}_${POL}_2021FebSci.npy"
BADFILES="$HOME/KATHPRFI_LBAND/BAD_FILES/bad_files_${BAND}_${POL}_2021FebSci.npy"

#export PYTHONPATH="${PYTHONPATH}:$HOME/GitHub/kathprfi/kathprfi"

#alias kathprfiLband="docker run ${DOCKER_OPTS} --name $DOCKER_NAME $DOCKER_NAME python3 $HOME/GitHub/kathprfi/script/kathprfi_script.py -c $HOME/rfi-chronicles/data/lband/KATHPRFI_Archive_copy/DSData/rfi_data/kathprfi_config_lband.txt -z $HOME/KATHPRFI_LBAND/OUT_ZARR/lband_.zarr -b $HOME/KATHPRFI_LBAND/BAD_FILES/bad_files_lband.npy -g $HOME/KATHPRFI_LBAND/GOOD_FILES/good_files_lband.npy"
#alias kathprfiLband="docker run ${DOCKER_OPTS} --name $DOCKER_NAME $DOCKER_NAME python3 $HOME/GitHub/kathprfi/script/kathprfi_script.py -c $HOME/KATHPRFI_LBAND/RDB_FILES/kathprfi_config_SCI_Imaging_L_2021-01-01_2021-01-31.txt -z $HOME/KATHPRFI_LBAND/OUT_ZARR/lband_HH_.zarr -b $HOME/KATHPRFI_LBAND/BAD_FILES/bad_files_lband_HV_2021JanSci.npy -g $HOME/KATHPRFI_LBAND/GOOD_FILES/good_files_lband_HV_2021JanSci.npy"

#alias kathprfiLband="docker run ${DOCKER_OPTS} --name $DOCKER_NAME $DOCKER_NAME python3 $SCRIPT -c $CFGFILE -z $OUTZARR -b $BADFILES -g $GOODFILES"
alias kathprfiband="docker run ${DOCKER_OPTS} --name $DOCKER_NAME $DOCKER_NAME python3 $SCRIPT -c $CFGFILE -z $OUTZARR -b $BADFILES -g $GOODFILES"
