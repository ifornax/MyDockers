#!/bin/bash -p
#
# This will build the docker - copy and paste 
#
# DOCKER_NAME="nadeem_katdal"; docker build -t $DOCKER_NAME .

DOCKER_NAME="nadeem_katdal"

DOCKER_OPTS="-it "\
"--rm "\
"--volume=\"/etc/group:/etc/group:ro\" "\
"--volume=\"/etc/passwd:/etc/passwd:ro\" "\
"--volume=\"/etc/shadow:/etc/shadow:ro\" "\
"--volume=\"/etc/sudoers.d:/etc/sudoers.d:ro\" "\
"--volume=\"/:/host:rw\" "\
"--volume=\"/data/nadeem/MeerKAT:/home/ubuntu/MeerKAT:rw\" "\
"--volume=\"/data_new/nadeem/DS/MyDockers/Docker_NadJup3/BUILD:/home/ubuntu:rw\" "\
"--volume=\"/data_new/nadeem/DS:/home/ubuntu/DS:rw\" "\
"-e HOME=\"/home/ubuntu\" "\
"--user=`id -ur` "\
"--net=host "\
"-e QT_X11_NO_MITSHM=1 "\
"-e DISPLAY=${DISPLAY} "\
"--volume=\"${HOME}/.Xauthority:${HOME}/.Xauthority\" "\
"--volume=\"${HOME}/.Xdefaults:${HOME}/.Xdefaults\" "\

alias DSkatdal="docker run ${DOCKER_OPTS} --name $DOCKER_NAME $DOCKER_NAME"
