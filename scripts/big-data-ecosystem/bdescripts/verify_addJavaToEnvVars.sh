profile_filename=/etc/profile
if [[ -z "${JAVA_HOME}" ]]; then
  echo 'Adding Java path to /etc/profile'
  echo "export JAVA_HOME=/usr/jdk64/jdk1.8.0_112" >> $profile_filename
  echo "export PATH=\$PATH:\$JAVA_HOME/bin" >> $profile_filename
else
  echo 'Java Path already exist'
fi
