# syntax=docker/dockerfile:1

#ARG BASE_CONTAINER=ubuntu:18.04
#ARG BASE_CONTAINER=ubuntu:20.04
#FROM $BASE_CONTAINER
FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive

#ARG PYTHON_VERSION=2.7
ARG PYTHON_VERSION=3.8

LABEL maintainer="Nadeem <nadeem@ska.ac.za>"

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y \
    build-essential \
    ca-certificates \
    gcc \
    git \
    libpq-dev \
    make \
    python3-pip \
    python3.8 \
    python3.8-dev \
    ssh \
    && apt-get autoremove \
    && apt-get clean

USER root

ENV TZ=Africa

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt update
RUN apt install -y tzdata

RUN  apt-get install -y software-properties-common

#RUN apt-get update -y
RUN apt-get install -y python-tk

# intalling updated version of pip for user only
#RUN wget https://bootstrap.pypa.io/get-pip.py && \
#    python get-pip.py pip>=19.2 

#RUN python --version


#Run echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
#    locale-gen

# Configure environment
ENV SHELL=/bin/bash \
    #NB_USER=$NB_USER \
    #NB_UID=$NB_UID \
    #NB_GID=$NB_GID \
    LC_ALL=en_US.UTF-8 \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8
#ENV HOME=/home/$NB_USER

# Add a script that we will use to correct permissions after running certain commands

ADD fix-permissions /usr/local/bin/fix-permissions
RUN ls -latrh /usr/local/bin/fix-permissions
RUN chmod +x /usr/local/bin/fix-permissions

# Enable prompt color in the skeleton .bashrc before creating the default NB_USER
RUN sed -i 's/^#force_color_prompt=yes/force_color_prompt=yes/' /etc/skel/.bashrc

# Create NB_USER with name specified above with UID=1000 and in the 'users' group
# and make sure these dirs are writable by the `users` group.
#RUN echo "auth requisite pam_deny.so" >> /etc/pam.d/su && \
#    sed -i.bak -e 's/^%admin/#%admin/' /etc/sudoers && \
#    sed -i.bak -e 's/^%sudo/#%sudo/' /etc/sudoers && \
#    chmod g+w /etc/passwd
#   useradd -m -s /bin/bash -N -u $NB_UID $NB_USER && \

#install python requirements file

COPY requirement.txt /tmp/
RUN pip3 install -r /tmp/requirement.txt

#COPY Nadeemrequirements.txt /tmp/
#RUN pip3 install -r /tmp/Nadeemrequirements.txt

# run on port 8895
EXPOSE 8895

# Configure container startup
# Add Tini to fix permissions
ENV TINI_VERSION v0.18.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini
ENTRYPOINT ["/tini", "--"]

#RUN fix-permissions $HOME


#USER $NB_UID
#WORKDIR $HOME


#ENV PYTHONPATH "$PYTHONPATH:/usr/lib/python3/dist-packages/:~/.local/lib/python3.6/site-packages"

RUN echo "Running papermill now...."


#
# This will run the papermill when docker is launched
#

#CMD ls /home/nadeem/DS/FB_Prophet/*py && \
#    pwd && \
#    cd

#CMD python3 $HOME/DS/FB_Prophet/papermill_test.py

# default run a notebook server
#CMD sh -c 'whoami && jupyter notebook --no-browser --ip="0.0.0.0" --port 8893 $HOME'

#WORKDIR "$HOME/GitHub/kathprfi/"
#RUN export PYTHONPATH="${PYTHONPATH}:$HOME/GitHub/kathprfi/"
CMD echo $HOME
#CMD sh -c 'python --version'
