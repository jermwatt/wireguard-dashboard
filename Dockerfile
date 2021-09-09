FROM ubuntu:20.04

# update pack list
RUN apt update

# install utils + wireguard
RUN apt install -y apt-utils python3.8 python3-pip gcc libffi-dev python-dev default-libmysqlclient-dev python3-dev net-tools gettext-base iproute2 iptables wireguard

# configure wireguard
RUN wg genkey | sudo tee /etc/wireguard/privatekey | wg pubkey | sudo tee /etc/wireguard/publickey

# python installs
RUN pip3 install Flask tinydb ifcfg icmplib flask-qrcode

# make home directory
RUN mkdir /home/app 

# copy over env and template
COPY env.sh /home/app/env.sh
COPY wg0_template.conf /etc/wireguard/wg0_template.conf
