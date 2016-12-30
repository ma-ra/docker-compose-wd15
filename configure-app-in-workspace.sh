# configure app in workspace
set -x
mkdir /var/www/html/wd15-test/{assets,protected/runtime} && chmod 777 /var/www/html/wd15/{assets,protected/runtime}

sed -i -e 's/{database_host}/official-mariadb/' \
    -e 's/{database_name}/wd15/' \
    -e 's/{database_user}/wd15-database-user/' \
    -e 's/{database_password}/wd15-database-password/' \
  /var/www/html/wd15-test/protected/config/main.php 2>&1 && echo "Set database connection info." 2>&1

