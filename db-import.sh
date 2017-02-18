#import a DB without using provision script

vagrant ssh -- -t '
DATABASE_DIR="bedrock/web/database"

if [ -d "$DATABASE_DIR" ]; then
    #run WP-CLI command to restore database
    cd bedrock/web/database
    wp db import homestead.sql --allow-root
    echo "DB imported"
else
    echo "ERRR"
fi
exit
/bin/bash'