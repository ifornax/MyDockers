#!/bin/bash -p
#
# This will build the docker - copy and paste 
#
DOCKER_NAME="kathprfi_docker"
# docker build -t $DOCKER_NAME .

DOCKER_OPTS="-it "\
"--rm "\
"--volume=\"/etc/group:/etc/group:ro\" "\
"--volume=\"/etc/passwd:/etc/passwd:ro\" "\
"--volume=\"/etc/shadow:/etc/shadow:ro\" "\
"--volume=\"/etc/sudoers.d:/etc/sudoers.d:ro\" "\
"--volume=\"/:/host:rw\" "\
"--volume=\"/data/nadeem/MeerKAT:/home/nadeem/MeerKAT:rw\" "\
"--volume=\"/data_new/nadeem/DS:/home/nadeem/DS:rw\" "\
"--volume=\"/data_new/nadeem/DS/KATHPRFI/RDB_FILES:/home/nadeem/DS/KATHPRFI/RDB_FILES:rw\" "\
"--volume=\"/data_new/nadeem/DS/KATHPRFI/FLAG_FILES:/home/nadeem/DS/KATHPRFI/FLAG_FILES:rw\" "\
"--volume=\"/data_new/nadeem/DS/KATHPRFI/OUT_ZARR:/home/nadeem/DS/KATHPRFI/OUT_ZARR:rw\" "\
"--volume=\"/data_new/nadeem/DS/KATHPRFI/GOOD_FILES:/home/nadeem/DS/KATHPRFI/GOOD_FILES:rw\" "\
"--volume=\"/data_new/nadeem/DS/KATHPRFI/BAD_FILES:/home/nadeem/DS/KATHPRFI/BAD_FILES:rw\" "\
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


alias kathprfidocker="docker run ${DOCKER_OPTS} --name $DOCKER_NAME $DOCKER_NAME --vis /home/nadeem/DS/KATHPRFI/RDB_FILES --flags /home/nadeem/DS/KATHPRFI/FLAG_FILES --zarr /home/nadeem/DS/KATHPRFI/ZARR_FILES --good /home/nadeem/DS/KATHPRFI/GOOD_FILES/gd_files.npy --bad /home/nadeem/DS/KATHPRFI/BAD_FILES/bd_files.npy -n 1"

