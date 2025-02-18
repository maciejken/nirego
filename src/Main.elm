module Main exposing (main)

import Html exposing (text)
import Browser


type alias Model =
    String


initialModel : Model
initialModel =
    "Hello, Elm!"

main = Browser.sandbox
  { init = initialModel
  , view = view
  ,update = update
  }

view data =
    text initialModel

update msg data =
    "Testing"
