
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
"--volume=\"${HOME}/.Xdefaults:${HOME}/.Xdefaults\" "


SCRIPT="/home/nadeem/GitHub/kathprfi/script/kathprfi_script.py"

#BAND="Lband"

read -p 'Enter band to reduce [Lband or Uband]: ' BAND # taking input from user

# Declare an array of string with type
declare -a StringArray=("HH" "VV" "HV" )  # pol under investigation

#CSV="SCI_Imaging_L_2021-02-01_2021-02-28"

read -p 'Enter files list without the .csv extension: ' CSV

echo '###'
echo 'Going into loop now'
echo '###'

# Iterate the string array using for loop
for val in ${StringArray[@]}; do
   POL=${val}
   # These are for output
   CFGFILE="$HOME/KATHPRFI/RDB_FILES/kathprfi_config_${CSV}_${val}.txt"
   echo "###"    
   echo "Using config file ${CFGFILE}..."
   echo "###"
   OUTZARR="$HOME/KATHPRFI/OUT_ZARR/${BAND}_${POL}_.zarr"
   GOODFILES="$HOME/KATHPRFI/GOOD_FILES/good_files_${BAND}_${POL}_2021FebSci.npy"
   BADFILES="$HOME/KATHPRFI/BAD_FILES/bad_files_${BAND}_${POL}_2021FebSci.npy"

   #echo docker run ${DOCKER_OPTS} --name $"DOCKER_NAME"_$"POL"  $DOCKER_NAME python3 $SCRIPT -c $CFGFILE -z $OUTZARR -b $BADFILES -g $GOODFILES
   echo docker run ${DOCKER_OPTS} --name $"DOCKER_NAME"  $DOCKER_NAME python3 $SCRIPT -c $CFGFILE -z $OUTZARR -b $BADFILES -g $GOODFILES
done
  
#kathprfi_loop="docker run ${DOCKER_OPTS} --name ${DOCKER_NAME} ${DOCKER_NAME} python3 $SCRIPT -c $CFGFILE -z $OUTZARR -b $BADFILES -g $GOODFILES"
#$kathprfi_loop

