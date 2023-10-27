#!/bin/bash

my_function() {
    # Function logic using the input arguments
    echo "Starting..."
    DOCKER_NAME="kathprfidockerhh"

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
    #alias kathprfidocker="docker run ${DOCKER_OPTS} --name $DOCKER_NAME $DOCKER_NAME --vis /scratch2/isaac/rfi_data/subset/time2/min284 -f /scratch2#/isaac/rfi_data/3calImaging/flags/ -z /scratch2/isaac/rfi_data/subset/time2/min#284/min284.zarr -g /data/nadeem/MeerKAT/Testing/newfi$

    #- v : path to full rdb files
    #- f  : path to flag files
    #- z : path where you will save your zarr array, you need to give it the name of# the array also.
    #- g : path where you will save your array of good files, you need to give it the# name of the array also.
    #- b : path where you will save your  array of bad files, you need to give it the# name of the array also.

    #$1 is the band
    #BAND="HH" # band under investigation
    #$2 is the band to analyse
    #FREQ="lband"
    
    

    # $3 is the config file
    #CFGFILE="$HOME/KATHPRFI/RDB_FILES/kathprfi_config_file_template_Lband_Jan_Feb_2023_reportHH.txt"
    CFGFILE="$HOME/KATHPRFI/RDB_FILES/$3"
    
    # These are for output

    OUTZARR="$HOME/KATHPRFI/OUT_ZARR/$2_$1_.zarr"
    GOODFILES="$HOME/KATHPRFI/GOOD_FILES/good_files_$2_$1.npy"
    BADFILES="$HOME/KATHPRFI/BAD_FILES/bad_files_$2_$1.npy"


    SCRIPT="$HOME/GitHub/kathprfi/script/kathprfi_script.py"
    
    echo "Running KATHPRFI now ..."
    #alias kathprfiLbandhh="docker run ${DOCKER_OPTS} --name $DOCKER_NAME $DOCKER_NAME python3 $SCRIPT -c $CFGFILE -z $OUTZARR -b $BADFILES -g $GOODFILES"
    docker run ${DOCKER_OPTS} --name $DOCKER_NAME $DOCKER_NAME python3 $SCRIPT -c $CFGFILE -z $OUTZARR -b $BADFILES -g $GOODFILES


    #echo "Type kathprfiLbandhh to run the process..."


    echo "First argument: $1"
    echo "Second argument: $2"
    echo "Third argument: $3"

}

# Check if three arguments are provided
if [ $# -ne 3 ]; then
    echo "Usage: $0 <arg1> <arg2> <arg3>"
    exit 1
fi

# Call the function and pass the input arguments
my_function "$1" "$2" "$3"
