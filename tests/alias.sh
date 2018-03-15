# This script will test if you have given a leap year or not.

echo "Enter the ip of the broker node:"
read broker



alias b="./LWW_txn --kind Broker --brokerAddr $broker"
alias m="make clean && make LWW_txn"
alias d="./LWW_txn --kind Drop && ./LWW_txn --kind Create "
alias s="./LWW_txn --kind Server --rtsArgs “-N2” --brokerAddr $broker"

