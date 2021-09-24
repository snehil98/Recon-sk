# Recon-sk
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





######
USAGE:
   
git clone 
chmod +x recon-sk.sh
mv recon-sk.sh /usr/local/bin
# now you can execute this script from anywhere in terminal
recon-sk.sh <IP>
