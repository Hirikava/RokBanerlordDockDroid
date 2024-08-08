FROM ubuntu:22.04

RUN  apt-get update && \
	 apt install wget -y && \
	 apt install adb -y


RUN  apt install python3 python3-pip python3-venv -y && \
	 apt-get install g++ -y &&	\
	python3 -m venv .venv && \
	source .venv/bin/activate && \
	python3 -m pip install gdown	
	
RUN apt install qemu-system qemu-kvm libvirt-clients libvirt-daemon-system bridge-utils virt-manager -y 

CMD ["bash"]
	