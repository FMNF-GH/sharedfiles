#!/bin/bash

txtBlue="\[\033[0;34m\]"   #letter color blue
txtRed="\[\033[0;31m\]"    #letter color red
txtCyan="\[\033[1;36m\]"   #letter color cyan
txtWhite="\[\033[1;37m\]"  #letter color white
txtYellow="\[\033[1;33m\]"
export PS1="<$txtCyan\h$txtWhite> "

function hn() {
    echo $HOSTNAME
}

function update() {
    cd ~
    source functions.sh
    echo "---- Updated Functions ----"
}

function upd() {
    cd ~
    source functions.sh
    echo "---- Updated Functions ----"
}

function edit() {
    cd ~
    nano functions.sh
}

function c() {
    clear
}

function cls() {
    clear
}

function gl() {
    glances
    clear
}

function list() {
    cd ~
    declare -F > functions.txt
    cut -b 12-22 functions.txt > cutfunctions.txt
    tail -11 cutfunctions.txt
}

function net() {
    ifconfig > fnet.txt
    iwconfig > wnet.txt
    clear
    sed -n '1{p;q}' wnet.txt
    sed -n '17{p;q}' fnet.txt
}

function st() {
    clear
    speedtest
}

function ss() {
    sudo su
    source functions.sh
}

function n() {
    netstat -t
}


function netman() {
    ifconfig wlp2s0 down
    iwconfig wlp2s0 mode managed
    ifconfig wlp2s0 up
    systemctl start NetworkManager.service
}

function mon() {
   airmon-ng check kill && airmon-ng start wlp2s0 && airodump-ng wlp2s0
}

function ipmac() {
    arp-scan --interface=wlp2s0 --localnet
}

function currentap() {
    iwconfig | grep "Access Point"
}

function ftp() {
    cd ~
    cd Desktop
    cd FileZilla3
    cd bin
    ./filezilla
}
