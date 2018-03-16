ERROR:   Initial Warning: File "/usr/local/Cellar/cassandra/3.11.2/libexec/bin/cqlsh.py", line 2443, in <module>
	 ---> comment the line 483 in /usr/local/Cellar/cassandra/3.11.2/libexec/bin/cqlsh.py (#no_compact=no_compact,)

ERROR:   The consistency ALL was not achieved. 
	 The reason was that the keyspace was specifying a datacenter which did not exist. 
	 I realized it by running nodetool status and the fact that one of the nodes did own 0% of the data.
	 It was fixed by double checking the DC names and re-creating the keyspace
	 * I don't think it was necessary but I also updated the cassandra-rackdc.properties file with datacenter specific info



----------------------------------------------------------------------------------------------------------------------
PATH:    .yaml file for the 3.11 installed through brew: /usr/local/Cellar/cassandra/3.11.2/.bottle/etc/cassandra
	 *Properties: /usr/local/etc/cassandra
	 *Logs: /usr/local/var/log/cassandra
	 *Data: /usr/local/var/lib/cassandra/data

----------------------------------------------------------------------------------------------------------------------
TIPS:	 To stop cassandra process: pkill -f 'java.*cassandra'


----------------------------------------------------------------------------------------------------------------------





