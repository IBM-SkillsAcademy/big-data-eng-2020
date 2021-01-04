export USERNAME=$1
export PASSWORD=$2
echo $USERNAME
echo $PASSWORD
echo  $PASSWORD | su -c whoami $USERNAME

