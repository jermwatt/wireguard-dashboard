#!/bin/bash

# set temp envs
export SERVER_PRIVATE_KEY=$(cat /etc/wireguard/privatekey)

# copy template
cp /home/app/wg0_template.conf /etc/wireguard/wg0_template.conf

# sub in vars in template .conf
envsubst < /etc/wireguard/wg0_template.conf > /etc/wireguard/wg0.conf 

# clean up template
rm /etc/wireguard/wg0_template.conf

# chmod
chmod 600 /etc/wireguard/{privatekey,wg0.conf}
