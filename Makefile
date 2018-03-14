EXE=BankAccount
SCRIPTS:=$(shell cqlsh -f create_keyspace.cql)
BROKER=

all: $(EXE) $(SCRIPTS)

BankAccount: BankAccount.hs
	ghc $(BROKER) -XDatatypeContexts -rtsopts -threaded BankAccount.hs

clean:
	rm -f *.dyn* *~ *.hi *.o $(EXE)
