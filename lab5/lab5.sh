#!/bin/bash

#Install an Apache server on Machine C.
sudo apt install apache2
sudo service apache2 start

#Configure Apache to have virtual hosts for Dunder-Mifflin (www.dundermifflin.com),
#the Michael Scott Paper Company (www.michaelscottpapercompany.com)
#and Schrute Farms (www.schrutefarms.com).
sudo chmod -R 755 /var/www
sudo a2ensite /etc/apache2/sites-available/dundermifflin.conf
sudo a2ensite /etc/apache2/sites-available/schrutefarms.conf
sudo a2ensite /etc/apache2/sites-available/michaelscottpapercompany.conf
systemctl reload apache2

#Configure Apache to accept both the full hostname and omitting the leading www.
#So, for example both www.dundermifflin.com and dundermifflin.com should work.

#this ia achieved by editing /etc/apache2/sites-available/{websitename}.conf with the ServerAlias directive.

#Pam Beesly, Kelly Kapoor and Andy Bernard must be able to add and edit files served by the web server
#but only on the Dunder Mifflin web server.  Dwight Schrute should have similar privileges on the
#Schrute Farms web server.  (Dwight has sudo access, but should not need to use it.)



#The DocumentRoot for each of the sites must be /var/www/html/site where the site must match the name as received
#from the ISP.  For example, the Dunder Mifflin site should have a DocumentRoot of  /var/www/html/dundermifflin.

#testing

#change /etc/hosts to redirect to the correct site.
#curl

#127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4
 #100.64.11.3 michaelscottpapercompany.com
 #100.64.11.3 dundermifflin.com
 #100.64.11.3 schrutefarms.com
 #100.64.11.3 www.michaelscottpapercompany.com
 #100.64.11.3 www.dundermifflin.com
 #100.64.11.3 www.schrutefarms.com
 #::1         localhost localhost.localdomain localhost6 localhost6.localdomain6