FROM phusion/baseimage:0.9.22
MAINTAINER Max Ivak <maxivak@gmail.com>



#
ENV TERM xterm
#RUN export TERM=xterm


# base packages
RUN apt-get update
RUN apt-get -y install iputils-ping net-tools netcat

# docker
RUN apt-get install -y docker.io


# setpwd
#RUN echo 'root:pass' | chpasswd
#RUN echo 'app:pass' | chpasswd


# ssh
RUN rm -f /etc/service/sshd/down

ADD files/ssh/sshd_config /etc/ssh/sshd_config

RUN chown root:root /var/run/sshd && chmod 700 /var/run/sshd


# clean
RUN apt-get update && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /var/tmp/* /etc/dpkg/dpkg.cfg.d/02apt-speedup

