#!/bin/bash -p
#
# This will build the docker - copy and paste 
#
# DOCKER_NAME="nadeem_papermill"
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
"--volume=\"/tmp:${HOME}:rw\" "\
"-e HOME=\"${HOME}\" "\
"--user=`id -ur` "\
"--net=host "\
"-e QT_X11_NO_MITSHM=1 "\
"-e DISPLAY=${DISPLAY} "\
"--volume=\"${HOME}/.Xauthority:${HOME}/.Xauthority\" "\
"--volume=\"${HOME}/.Xdefaults:${HOME}/.Xdefaults\" "\

alias PaperMillNbook="docker run ${DOCKER_OPTS} --name Ppermill_1 nadeem_papermill"
