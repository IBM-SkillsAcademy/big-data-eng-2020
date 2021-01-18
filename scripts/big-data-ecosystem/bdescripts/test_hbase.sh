#SECONDS=0
CMD="user_permission \'@ns_$1\'"
#echo $CMD
su hbase -c "echo $CMD | hbase shell"
#echo $SECONDS