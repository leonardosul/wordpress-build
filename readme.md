# Wordpress Site Builder Script

This script builds a Wordpress site. It takes one argument, and uses that argument as the site name, db name, db user and db password. This is designed so that you can quickly spin up a site for testing purposes, etc.

Prerequisites:

1. Have the WP-CLI installed on your development environment.
2. Have root access to MySQL.


To get started:

1. Clone the repo somewhere like www directory.
2. Run the script, passing in the site name.
3. If everything goes to plan you should have an installed wp site, with database configured.
4. You will have to add a vhost for your site in apache or nginx.

