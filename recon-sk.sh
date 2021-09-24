#!/bin/bash


#Script by : SNEHIL KUMAR
#Instagram : @_._snehil_


#Disclaimer : This is a simple bash script i did for fun. I am new for cyber security field and i am from non tech background 
#             Please kindly DM in on my instagram if you face some issues or if in any way i can improve this script.THANK YOU:)
#             Use this script only for CTF challenges. I am not responsibble if you use this script against any target without permission.


#Explaination: This is a automation script for recon. This script runs three nmap scans. 
#	       1st scan is  TCP SYN port scan. 
#              2nd scan is AGRESSIVE scan 
#              3rd scan is it performs a Vulnerability scan. 
#              After the NMAP Scans it performs a fuff scan and smbmap if port 445 is open and enum4linux for additional info.

#        //NOTE: You can comment out the scan if you dont want to use.//


figlet -c -f Cybermedium  "      RECON-SK     " | lolcat

echo "
 ______________________________________________________________________________
|                                                                              |
|                             WELCOME TO RECON-SK                              |
|______________________________________________________________________________|
|                                                                              |
|                                                                              |
|                                                                              |
|                 User Name:          [  SNEHIL     ]                          |
|                                                                              |
|                 Password:           [  INVALID    ]                          |
|                                                                              |
|                                                                              |
|                                                                              |
|                            [ SUBMIT ]                                        |
|______________________________________________________________________________|
|                                                                              |
|INSTAGRAM:@_._snehil_                  BLOG:https://snehil-cyber.medium.com   |
|______________________________________________________________________________| "  | lolcat


pkgs='figlet lolcat'
install=false
for pkg in $pkgs; do
  status="$(dpkg-query -W --showformat='${db:Status-Status}' "$pkg" 2>&1)"
  if [ ! $? = 0 ] || [ ! "$status" = installed ]; then
    install=true
    break
  fi
done
if "$install"; then
  sudo apt install $pkgs
fi

if [ -z "$1" ]
then
        echo "Usage: ./scan.sh <IP>"
        exit 1
fi 


mkdir $@
cd $@

Name="result"   		#Enter Name for your Output Data
    
echo Starting Scan on $1

nmap -sS $1 -oN nmap$Name.txt

sleep 5

nmap -A -T4 $1 -oN detail$Name.txt

sleep 5

nmap -T4 --script vuln $1 -oN Vuln$Name.txt

sleep 5


ffuf -w /usr/share/wordlists/dirb/common.txt -u http://$1/FUZZ -e .aspx,.html,.php,.txt,.old,.bak,.txt -o fuff$Name.txt

sleep 5

smbmap -H $1

sleep 2

enum4linux -a $ip | tee enum4linux.log     

echo "        ENUMERATION COMPLETE! HAPPY HACKING:)       " | lolcat

