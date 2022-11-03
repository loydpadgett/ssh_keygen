  1 #!/bin/bash                                                      
  2 ## Loyd Richard Padgett III                                      
  3 ## Script to generate CSR                                        
  4 ## function to outline the certificate contents                  
  5 genRSA(){                                                        
  6   CN="`hostname`"                                                
  7   locality="City"                                                
  8   org="organization"                                             
  9   state="State"                                                  
 10   country="US"                                                   
 11   OU="Organization Unit"                                         
 12   storePass=$1                                                   
 13   keyPass=$1                                                     
 14                                                                  
 15   if [ -n $keyPass ]                                             
 16   then                                                           
 17     # insert while loop to verify information in the certificate.                                                                           
 18     echo "keypass value exists!"                                 
 19     # simple check for empty variables                           
 20     keytool -genkey -alias `hostname` -keyalg RSA -keysize 2048 \
 21     -keystore `date +%Y`-`hostname`.jks -keypass $keyPass -storepass $storePass \
 22     -dname "CN=$CN, OU=$OU, O=$org, L=$locality, ST=$state, C=$country" && \
 23     keytool -certreq -alias `hostname` -file `hostname`.csr -keystore `date +%Y`-`hostname`.jks -keypass $keyPass -storepass $storePass
 24     fi                                                           
 25 }                                                                
 26 genRSA $1
