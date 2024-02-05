#! /bin/bash

wget https://wordpress.org/latest.tar.gz
tar -xzf latest.tar.gz
mv wordpress/* .
rm -rf wordpress
rm -rf latest.tar.gz

sed -i "s/database_name_here/wordpress_db/g" wp-config-sample.php
sed -i "s/username_here/wordpress_user/g" wp-config-sample.php
sed -i "s/password_here/wordpress_password/g" wp-config-sample.php
sed -i "s/localhost/mariadb/g" wp-config-sample.php
cp wp-config-sample.php wp-config.php