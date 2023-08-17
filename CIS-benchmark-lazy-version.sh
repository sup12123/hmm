#!/bin/bash

#1.1.1 disable mounting of uncommon filesystems.

install freevxfs /bin/true
rmmod freevxfs

install jffs2 /bin/true
rmmod jffs2

install cramfs /bin/true
rmmod cramfs

install hfs /bin/true
rmmod hfs

install hfsplus /bin/true
rmmod hfsplus

install squashfs /bin/true
rmmod squashfs

install udf /bin/true
rmmod udf

#1.1.2, 1.1.3, 1.1.4 ensure /tmp is configured

systemctl unmask tmp.mount
systemctl enable tmp.mount

echo "[Mount]
What=tmpfs
Where=/tmp
Type=tmpfs Options=mode=1777,strictatime,noexec,nodev,nosuid" >> /etc/systemd/system/local-fs.target.wants/tmp.mount

mount -o remount,nodev /tmp
#1.1.21 disable stickeybit stuff
#I skipped 1.1.5 through 1.1.20 because they are irrelevant to the competition

df --local -P | awk {'if (NR!=1) print $6'} | xargs -I '{}' find '{}' -xdev -type d -perm -0002 2>/dev/null | xargs chmod a+t

#1.1.22 disable automounting

systemctl disable autofs

#Section numero threeo. Skipped two because it deals with Apt and other updates.

#1.3.1 file integrity stuff

apt-get install aide aide-common

aideinit

#1.3.2 edit cron to automate checking

echo "0 5 * * * /usr/bin/aide.wrapper --config /etc/aide/aide.conf --check" >> crontab -u root -e

#1.3.3

chown root:root /boot/grub/grub.cfg
chmod og-rwx /boot/grub/grub.cfg

#1.4.2 skipped because bootloaders are not relevant for the competition??

#1.5.1, 1.5.3 test this on ubu 18.04 and deb 10

#1.5.4 removing prelink

prelink -ua
apt-get purge prelink -y

#1.6.2.2 configure apparmour and enforce policies

aa-enforce /etc/apparmor.d/*

#1.6.3 ensure apparmor is installed

apt-get install apparmor apparmor-utils -y

#1.7.1.2 system warning system

echo "Authorized uses only. All activity may be monitored and reported." > /etc/issue

#1.7.1.3 remote login warnings

echo "Authorized uses only. All activity may be monitored and reported." > /etc/issue.net

#1.7.2 /etc/motd perms

chown root:root /etc/motd
chmod 644 /etc/motd

#Configure Sudo

echo "Defaults use_pty" >> /etc/sudoers
echo "Defaults logfile="/var/log/sudo.log"" >> /etc/sudoers

#so this point i switched to the deb10 version of the CIS. thats why the numbering is a bit rarded

echo "kernel.randomize_va_space = 2" >> /etc/sysctl.d/*

#hardening memalloc and memdump

echo "* hard core 0" >> /etc/security/limits.d/*
echo "fs.suid_dumpable = 0" >> /etc/sysctl.d/*

sysctl -w fs.suid_dumpable=0

#1.7 screwing with grub

echo "GRUB_CMDLINE_LINUX="apparmor=1 security=apparmor"" >> /etc/default/grub

update-grub

#1.7 uhhh idk apparmour stuff

aa-enforce /etc/apparmor.d/*

#1.8 configuring perms

chown root:root /etc/issue
chmod u-x,go-wx /etc/issue

chown root:root /etc/issue.net
chmod u-x,go-wx /etc/issue.net

#section 2
#killing out rando shi and pkgs

apt purge xinetd -y
apt purge openbsd-inetd -y
apt purge xserver-xorg* -y

#2.2 neutering stoopid services

systemctl --now disable avahi-daemon





