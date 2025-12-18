FROM ubuntu:22.04

# install distro packages
RUN apt update && \
    apt -y install bash-completion sudo binutils-mips-linux-gnu wget make git python3 libcapstone-dev pkg-config build-essential

# install qemu (can be removed if you're using ido recomp)
RUN wget https://github.com/n64decomp/qemu-irix/releases/download/v2.11-deb/qemu-irix-2.11.0-2169-g32ab296eef_amd64.deb -P /tmp && \
    dpkg -i /tmp/qemu-irix-2.11.0-2169-g32ab296eef_amd64.deb

# setup users
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers && \
    useradd -ms /bin/bash dev && usermod -aG sudo dev

# copy cloned repo
COPY ./ /home/dev
USER dev
WORKDIR /home/dev

CMD ["/bin/bash"]
