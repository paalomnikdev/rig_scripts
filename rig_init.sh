
#!/bin/bash
if [[ $EUID -ne 0 ]]
then
    printf "%s\n" "This script must be run as root"
    exit 1
fi
export LC_ALL=C
export DISPLAY=:0
echo "export DISPLAY=:0" >> ~/.bashrc
echo "export LC_ALL=C" >> ~/.bashrc
apt-get install openssh-server -y
echo "%sudo  ALL=(ALL:ALL) NOPASSWD:ALL" >> /etc/sudoers
systemctl enable ssh
reboot
