{-# LANGUAGE DeriveGeneric   #-}
{-# LANGUAGE DataKinds       #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeOperators   #-}

module Api where

import GHC.Generics
import Data.Aeson.TH
import Network.Wai
import Servant

data User = User
  { userId        :: Int
  , userFirstName :: String
  , userLastName  :: String
  } deriving (Eq, Show, Generic)

$(deriveJSON defaultOptions ''User)

-- Our API Routes
type API = "users" :> Get '[JSON] [User]
type APIWithAssets = API 
                :<|> "assets" :> Raw 
                :<|> Raw
