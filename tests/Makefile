EXE=BankAccount LWW_txn
#SCRIPTS:=$(shell cqlsh -f create_keyspace.cql --cqlversion 3.4.4)
BROKER=

all: $(EXE) #$(SCRIPTS)

BankAccount: BankAccount.hs
	ghc -DLBB -XDatatypeContexts -fno-warn-warnings-deprecations -rtsopts -threaded BankAccount.hs

LWW_txn: LWW_txn.hs
	ghc -DLBB -XDatatypeContexts -fno-warn-warnings-deprecations -rtsopts -threaded -fno-warn-tabs LWW_txn.hs

clean:
	rm -f *.dyn* *~ *.hi *.o $(EXE)

hard: 
	rm -f ./*/*.dyn* ./*/*~ ./*/*.hi ./*/*.o *.dyn* *~ *.hi *.o ./*/*/*.dyn* ./*/*/*~ ./*/*/*.hi ./*/*/*.o
