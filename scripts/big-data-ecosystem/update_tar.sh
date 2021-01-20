rm -rf bdescripts.tar.gz
dos2unix bdescripts/*.sh
sudo chown root:root bdescripts/*.sh
tar -zcvf bdescripts.tar.gz bdescripts/*.sh