{-# LANGUAGE OverloadedStrings #-}

module Quelea.ETCDDriver  (
getETCDLock,
initETCDLock,
releaseETCDLock

)where

import Quelea.ClientMonad
import           Test.Hspec
import           Data.Char
import           Data.Maybe
import           Data.Text (Text)
import qualified Data.Text as T
import           Data.Monoid
import           Control.Applicative
import           Control.Concurrent
import qualified Control.Concurrent.Async as Async
import           Control.Monad
import           Control.Monad.Random (getRandomR, evalRandIO)
import           Control.Monad.Trans

import           Network.Etcd





initETCDLock :: IO ()
initETCDLock = do client <- setup
                  set client "/deSQL/mutex" "free" Nothing
		  return ()

getETCDLock :: IO ()
getETCDLock = do client <- setup
		 tryGettingETCDLock client 0


tryGettingETCDLock :: Client -> Int -> IO ()
tryGettingETCDLock client i = do node <- get client "/deSQL/mutex"
			         case node  of
			 	   Just n -> case (_nodeValue n) of 
			 	 	       Just value -> if (T.isPrefixOf value "freeee")
			 				     then do set client "/deSQL/mutex" "taken" Nothing
								     return ()
							     else do print i
							             threadDelay 1000
							             tryGettingETCDLock client (i+1)
				   _ -> print "ERROR: Key does not exist!"	



releaseETCDLock :: IO ()
releaseETCDLock = do client <- setup
                     set client "/deSQL/mutex" "free" Nothing
		     return ()

setup :: IO (Client)
setup = do
    client <- createClient [ "http://13.59.97.241:2379" ]
    return (client)
























