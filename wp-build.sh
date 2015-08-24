#!/usr/bin/env bash
# Wordpress build script.
# Build a new site quickly from the command line.

# Database connection details, you will have to add your own in here.
dbhost="localhost"
dbuser="root"
dbpass="root"


echo "Starting Wordpress Build"

if [ $# -eq 0 ]
  then
    echo "Please enter a name for this site: "
    read answer
    if [ ! -z "$answer" ]
    then
      echo "Thank You, continuing build..."
    else
      echo "No data supplied, exiting"
    fi
fi


# Make a database, we will use the website name as the db name
echo "Creating database $answer (if it's not already there)"
mysql -u $dbuser --password=$dbpass -e "CREATE DATABASE IF NOT EXISTS $answer"
mysql -u $dbuser --password=$dbpass -e "CREATE USER '$answer'@'localhost' IDENTIFIED BY '$answer'"
mysql -u $dbuser --password=$dbpass -e "GRANT ALL PRIVILEGES ON $answer.* TO $answer@localhost IDENTIFIED BY '$answer';"

# Download WordPress to a directory named after our site.
if [ ! -d $answer ]
  then
	echo "Installing WordPress using WP CLI"
	mkdir $answer
	cd $answer
	wp core download
	wp core config --dbname="$answer" --dbuser=$answer --dbpass=$answer --dbhost="localhost"
	wp core install --url=$answer.local --title="$answer" --admin_user=admin --admin_password=$answer --admin_email=demo@example.com
	cd ..
fi

echo "Wordpress site built and ready!";
