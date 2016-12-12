# setup yii files
#git clone https://github.com/yiisoft/yii ./yii
mkdir /var/www/html/yii
wget -q https://github.com/yiisoft/yii/releases/download/1.1.17/yii-1.1.17.467ff50.tar.gz -O - | \
  tar -zxf - -C /var/www/html/yii --strip-components=1 2>&1 && echo "Downloaded Yii." 2>&1

# setup app files
git clone https://github.com/ma-ra/php-wd15 /var/www/html/wd15 2>&1 && echo "Downloaded app." 2>&1
mkdir /var/www/html/wd15/{assets,protected/runtime} && chmod 777 /var/www/html/wd15/{assets,protected/runtime}

sed -i -e 's/{database_host}/official-mariadb/' \
    -e 's/{database_name}/wd15/' \
    -e 's/{database_user}/wd15-database-user/' \
    -e 's/{database_password}/wd15-database-password/' \
  /var/www/html/wd15/protected/config/main.php 2>&1 && echo "Set database connection info." 2>&1

