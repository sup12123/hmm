#!/bin/bash

#this is a script to secure grub

echo /home/passworduniv.txt | sudo grub-mkpasswd-pbkdf2 
