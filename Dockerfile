FROM ubuntu:22.04

USER root

WORKDIR /root

RUN  apt-get update && \
	 apt install wget -y && \
	 apt install adb -y

RUN echo 'root:root' | chpasswd
RUN printf '#!/bin/sh\nexit 0' > /usr/sbin/policy-rc.d
RUN apt-get update
RUN apt-get install -y systemd systemd-sysv dbus dbus-user-session
RUN printf "systemctl start systemd-logind" >> /etc/profile

RUN apt install python3 python3-pip python3-venv -y && \
apt-get install g++ -y && \
python3 -m venv .venv && \
source .venv/bin/activate && \
pip install gdown && \
gdown --fuzzy -O bliss.iso https://drive.google.com/file/d/1gewUmKIIzyiE-mV_5YBem8-CTIRI7nvt/view?usp=drive_link && \
deactivate
	
RUN apt install qemu-system qemu-kvm libvirt-clients libvirt-daemon-system bridge-utils virt-manager -y 

 
RUN  qemu-img create -f qcow2 bliss.qcow2 20G	

CMD ["bash"]
