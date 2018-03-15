# This script will test if you have given a leap year or not.

echo "Enter the ip of the seed node:"
read seed

echo "Enter your public ip:"
read public

echo "Enter your private ip: "
read private

sed s/SADDRESS/$seed/ conf/cassandra_template.yaml > temp1
sed s/LADDRESS/$private/ temp1 > temp2
sed s/BCADDRESS/$public/ temp2 > cassandra.yaml
sudo mv cassandra.yaml /opt/apache-cassandra-3.11.2/conf/
rm temp*



