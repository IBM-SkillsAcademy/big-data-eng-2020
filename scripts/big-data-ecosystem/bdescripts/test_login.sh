export USERNAME=$1
export PASSWORD=$2
#echo $USERNAME
#echo $PASSWORD
#echo  "$PASSWORD" | su -c whoami "$USERNAME"

#read -p "Username >" username
#IFS= read -p "Password >" password
salt=$(sudo getent shadow $USERNAME | cut -d$ -f3)
epassword=$(sudo getent shadow $USERNAME | cut -d: -f2)
match=$(python -c 'import crypt; print crypt.crypt("'"${PASSWORD}"'", "$6$'${salt}'")')
# s[ ${match} == ${epassword} ] && echo "$USERNAME Password matches" || echo "$USERNAME Password doesn't match"
echo $match
echo $epassword
if [ ${match} == ${epassword} ]
then 
    echo "$USERNAME Password matches"
else 
     echo "$USERNAME Password doesn't match"
fi



