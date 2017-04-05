# Setup Wordpresss
echo "cd into bedrock"
cd bedrock/
echo "composer install from .lock"
composer install

#install wp-cli
#check if a db file exits in /database/ if yes, restore it, else carry on, to a default WP setup
echo "Installing WP-CLI"
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 
chmod +x wp-cli.phar
sudo mv wp-cli.phar /usr/local/bin/wp
echo "check WP-CLI version"
wp --info --allow-root

# #check if we have a database we can restore from. 
# Note: Directory only exists after we run the restore DB script.
DATABASE_DIR="web/database"

if [ -d "$DATABASE_DIR" ]; then
    #run WP-CLI command to restore database
    cd web/database
    wp db import homestead.sql --allow-root
    echo "DB Imported"
fi
echo "Provision complete"
exit
