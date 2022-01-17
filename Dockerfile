FROM ubuntu:18.04
RUN apt-get update && apt-get install -y sudo python-pip openssh-server software-properties-common iputils-ping && sudo apt-add-repository ppa:ansible/ansible && \
    apt-get install ansible -y 
RUN useradd -m -d /home/ansible -s /bin/bash ansible && echo 'ansible:ansible' | chpasswd
RUN echo "ansible ALL=(ALL:ALL) NOPASSWD:ALL" > /etc/sudoers.d/ansible
ENTRYPOINT ["/bin/bash","-c","service ssh restart && tail -f /dev/null"]
