module Main exposing (..)

import Debug exposing (..)
import Dict exposing (..)
import Html exposing (..)
import Html exposing (program)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Http
import Task exposing (Task, perform)
import Api exposing (..)

-- trivial example (maybe we should include a less trivial example soon that uses the generated API call?)
main = h1 [] [text "Hello, world!"]
