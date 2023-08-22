#!/bin/bash

#this is a script to input the universal password. can be found at /home/passworduniv.txt #

echo "Please input a universal password. Make it a secure password to gain points"

read univ-password


echo univ-password >> /home/passworduniv.txt

echo "the universal password has been changed to" cat >> /home/passworduniv.txt

sleep 10

echo "If you need to change or view the password, its located in /home/passworduniv.txt"
