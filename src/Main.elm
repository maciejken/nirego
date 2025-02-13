module Main exposing (main, Model, processData)

import Html exposing (Html, text)


type alias Model =
    { data : List Int }


initialModel : Model
initialModel =
    { data = [ 1, 2, 3, 4, 5, 7 ] }



main : Html msg
main =
  let sum = processData initialModel
  in
  text (String.fromInt sum)


processData : Model -> Int
processData model =
    List.sum model.data
