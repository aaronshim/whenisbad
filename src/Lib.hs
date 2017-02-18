{-# LANGUAGE DataKinds       #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeOperators   #-}
module Lib
    ( startApp
    , app
    ) where

import Data.Aeson
import Data.Aeson.TH
import Network.Wai
import Network.Wai.Handler.Warp
import Servant

import Api

type PortNumber = Int

startApp :: PortNumber -> IO ()
startApp port = run port app

app :: Application
app = serve api server

api :: Proxy APIWithAssets
api = Proxy

server :: Server APIWithAssets
server = return users
    :<|> serveAssets
    :<|> serveAssets
  where
    serveAssets = serveDirectoryFileServer "assets"

users :: [User]
users = [ User 1 "Isaac" "Newton"
        , User 2 "Albert" "Einstein"
        ]
