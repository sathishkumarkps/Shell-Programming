#!/bin/sh

SOURCE_LOCATION=/usr/local/scripts

#Enter the username and password

DBUSER=username
DBPASSWD="password"

# Create a file called databases_list.lst in the /usr/local/scripts and enter the database names one by one
DBLIST=`cat $SLOC/databases_list.lst`
DATE=`date +”%F”`

#Directory to save the mysql backups

BACKUP=/opt/mysqlbackups/daily/

export PATH=$SOURCE_LOCATION:$PATH

cd $BACKUP

for DBNAME in $DBLIST
do
/usr/bin/mysqldump -u$DBUSER -p$DBPASSWD $DBNAME > $DBNAME-$DATE.sql
tar zcvf $DBNAME-$DATE.tgz $DBNAME-$DATE.sql
rm -f $DBNAME-$DATE.sql
done

