#Script to export database
#SSH into the machine and run the following script.
vagrant ssh -- -t '
echo "im in the machine" 
DATABASE_DIR="bedrock/web/database"
cd bedrock/web

if [ ! -d "$DATABASE_DIR" ]; then
    mkdir database
    cd database
    wp db export wordpress.sql --allow-root
    echo "DB Exported to web/database DIR"
else
    echo "Error: No database found, check if /database/ exists and there is a homestead.sql file"
fi
exit
/bin/bash'
#this script runs in the VM, 
