FROM 7dtd-a16:latest 
#FROM ubuntu:latest


USER 0

#  RUN apt-get update && apt-get install --no-install-recommends -y \
# 	  ca-certificates \
#    lib32gcc1 \
#    net-tools \
#    lib32stdc++6 \
#    lib32z1 \
#    lib32z1-dev \
#    curl 


#RUN mkdir -p /home/daemon/steamcmd  && \
#    curl -s http://media.steampowered.com/installer/steamcmd_linux.tar.gz | tar -v -C /home/daemon/steamcmd -zx

ADD 7DDedi_A16.1.1.txt /home/daemon/steamcmd/install.txt

RUN chown -R daemon:daemon /home/daemon

#RUN mkdir -p /usr/sbin/.local  && \
#    chown -R daemon:daemon /usr/sbin/.local

USER daemon

WORKDIR /home/daemon/steamcmd

#RUN mkdir /home/daemon/steamcmd/7DaysToDie

RUN ./steamcmd.sh +runscript install.txt
#ADD startserver.sh /home/daemon/steamcmd/7DaysToDie/startserver.sh