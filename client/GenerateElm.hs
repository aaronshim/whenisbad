{-# LANGUAGE OverloadedStrings #-}

import           Data.Text
import qualified Data.Text.IO
import           Servant.Elm
import           Elm

import           Api

-- so that the generator can use this type (deriving Generic is also important)
instance ElmType User

main :: IO ()
main = do
  let code = intercalate "\n\n" $
        "module Api exposing (..)" :
        defElmImports :
        toElmTypeSource    (Proxy :: Proxy User) : -- must be explicitly generated in this version
        toElmDecoderSource (Proxy :: Proxy User) :
        generateElmForAPI (Proxy :: Proxy API) -- important not to use the API with the static assets attached!
  Data.Text.IO.writeFile "client/Api.elm" code
