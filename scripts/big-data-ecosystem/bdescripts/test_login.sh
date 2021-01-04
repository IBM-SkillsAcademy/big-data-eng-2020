export USERNAME=$1
export PASSWORD=$2
echo $USERNAME
echo $PASSWORD
#echo  "$PASSWORD" | su -c whoami "$USERNAME"

#read -p "Username >" username
#IFS= read -p "Password >" password
salt=$(sudo getent shadow $USERNAME | cut -d$ -f3)
epassword=$(sudo getent shadow $USERNAME | cut -d: -f2)
match=$(python -c 'import crypt; print crypt.crypt("'"${PASSWORD}"'", "$6$'${salt}'")')
echo $USERNAME && s[ ${match} == ${epassword} ] && echo "Password matches" || echo "Password doesn't match"


