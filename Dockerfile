FROM ubuntu:24.02

USER root

RUN  apt-get update && \
	 apt install wget -y && \
	 apt install adb -y


	
RUN apt install qemu-system qemu-kvm libvirt-clients libvirt-daemon-system bridge-utils virt-manager -y 

WOKRDIR /root 
RUN  qemu-img create -f qcow2 Bliss14.qcow2 20G	

CMD ["bash"]
