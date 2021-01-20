rm -rf bdescripts.tar.gz
dos2unix bdescripts/*.sh
sudo chown root:root bdescripts/*.sh
sudo chown root:root bdescripts/*.csv
tar -zcvf bdescripts.tar.gz bdescripts/