# This script will test if you have given a leap year or not.

echo "Enter the ip of the seed node:"
read seed

public=$(curl checkip.amazonaws.com)
private=$(ifconfig | grep 'inet addr' | cut -d ':' -f 2 | awk '{ print $1 }' | head -n 1)


sudo rm -r -f /opt/apache-cassandra-3.11.2/data/*
sed s/SADDRESS/$seed/ conf/cassandra_template.yaml > temp1
sed s/LADDRESS/$private/ temp1 > temp2
sed s/BCADDRESS/$public/ temp2 > cassandra.yaml
sudo mv cassandra.yaml /opt/apache-cassandra-3.11.2/conf/
rm temp*
sudo /opt/apache-cassandra-3.11.2/bin/cassandra -R -f


