# This script will test if you have given a leap year or not.

echo "Enter the ip of the broker node:"
read broker

echo "Enter the transaction kind [NoTxn|RC|MAV|RR]:"
read txn


alias b="clear && ./LWW_txn --kind Broker --brokerAddr $broker --txnKind $txn"
alias m="make clean && make LWW_txn && clear"
alias d="./LWW_txn --kind Drop --txnKind $txn && ./LWW_txn --kind Create --txnKind $txn"
alias dd="./LWW_txn --kind Create --txnKind $txn"

alias s="clear && ./LWW_txn --kind Server --rtsArgs “-N2” --brokerAddr $broker --txnKind $txn"

