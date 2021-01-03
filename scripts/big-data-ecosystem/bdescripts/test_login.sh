export USERNAME=$1
export PASSWORD=$2
su student0000
echo  $PASSWORD | su -c 'whoami' $USERNAME