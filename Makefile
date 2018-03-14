EXE=BankAccount
SCRIPTS:=$(shell cqlsh -f create_keyspace.cql --cqlversion 3.4.4)
BROKER=

all: $(EXE) $(SCRIPTS)

BankAccount: BankAccount.hs
	ghc $(BROKER) -XDatatypeContexts -fno-warn-warnings-deprecations -rtsopts -threaded BankAccount.hs

clean:
	rm -f *.dyn* *~ *.hi *.o $(EXE)
