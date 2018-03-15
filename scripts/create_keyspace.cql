CREATE KEYSPACE IF NOT EXISTS Quelea WITH replication = {'class' : 'NetworkTopologyStrategy', 'us-east-2_oh_cassandra' : 1, 'us-east_va_cassandra' : 1, 'us-west-2_or_cassandra' : 1 };
