#!/bin/bash
HOSTNAME=`hostname`
sudo sed -i "s/^127.0.0.1\ localhost .*$/127.0.0.1\ localhost\ ${HOSTNAME}/g" /etc/hosts
echo "nameserver 10.215.210.71" > /tmp/resolv.conf
sudo mv /tmp/resolv.conf /etc/resolv.conf
sudo apt-get update
sudo apt-get install -y apache2
cat <<EOF > /tmp/index.html
<html>
<body>
<p>hostname is $HOSTNAME</p>
</body>
</html>
EOF
sudo mv /tmp/index.html /var/www/html/index.html
sudo chown -R www-data:www-data /var/www/html
sudo service apache2 start
