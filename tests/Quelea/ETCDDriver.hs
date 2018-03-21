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
import 	       	 Data.Aeson
import 		 Network.HTTP.Client
import 		 Control.Lens
import 		 Network.Etcd as E



setup :: IO (Client)
setup = do
    client <- createClient [ "http://127.0.0.1:2379" ]
    --client <- createClient [ "http://184.72.99.214:2379" ]
    return (client)

httpKey :: Text
httpKey = "deSQL/mutex"



initETCDLock :: IO ()
initETCDLock = releaseETCDLock




getETCDLock :: IO ()
getETCDLock = do client <- setup
		 tryGettingETCDLock client 0


tryGettingETCDLock :: Client -> Int -> IO ()
tryGettingETCDLock client i = do node <- E.setcas "free" client httpKey "taken" Nothing
			         case node  of
			 	   Just n -> return () --putStrLn "Lock Acquired!"
				   Nothing -> do threadDelay 5000
				   		 --putStrLn $ (show i) ++ "Failed to acquire lock. Trying again..." 
					   	 tryGettingETCDLock client (i+1)


releaseETCDLock :: IO ()
releaseETCDLock = do client <- setup
                     E.set client httpKey "free" Nothing
		     return ()
























