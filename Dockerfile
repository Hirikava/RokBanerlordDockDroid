FROM ubuntu:22.04

RUN sudo apt-get update && \
	sudo apt install wget -y && \
	sudo apt install adb -y


RUN sudo apt install python3 python3-pip python3-venv -y && \
	sudo apt-get install g++ -y &&	\
	python3 -m venv .venv && \
	source .venv/bin/activate && \
	python3 -m pip install gdown	
	
RUN sudo apt install qemu-system qemu-kvm libvirt-clients libvirt-daemon-system bridge-utils virt-manager -y 

CMD ["bash"]
	