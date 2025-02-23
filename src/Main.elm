module Main exposing (main)

import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick, onInput)
import Browser
import Html exposing (input)
import Html.Attributes exposing (placeholder, value)
import Html.Attributes exposing (name)



type Msg =
    MsgSurprise
    | MsgReset
    | MsgName String
    | MsgAgeAsString String

type alias Model =
    { message : String
    , firstname : Maybe String
    , age : Maybe Int
    }


initialModel : Model
initialModel =
    { message = "Hi "
    , firstname = Nothing
    , age = Nothing
    }

main : Program () Model Msg
main =
    Browser.sandbox
        { init = initialModel
        , view = view
        ,update = update
        }

view : Model -> Html Msg
view model =
    div [] [
        div [] [
        text model.message           
        ]
        , input [ placeholder "Enter your name", value (Maybe.withDefault "" model.firstname), onInput MsgName ] []
        , input [ placeholder "Enter your age", value (String.fromInt (Maybe.withDefault 0 model.age)), onInput MsgAgeAsString ] []
        , button [ onClick MsgSurprise ] [ text "Surprise" ]
        , button [ onClick MsgReset ] [ text "Reset" ]
        , text (String.fromInt (String.length (Maybe.withDefault "" model.firstname)))
    ]

update : Msg -> Model -> Model
update msg model =
    case msg of
        MsgSurprise ->
            case model.firstname of
                Just aName ->
                    case model.age of
                        Just anInt -> { model | message = "Happy Birthday " ++ aName ++ " you are " ++ (String.fromInt anInt) ++ " years old." }
                        Nothing -> { model | message = "Please enter a valid age" }
                Nothing -> { model | message = "Please enter a valid name" }

        MsgName name ->
            if (String.trim name) == "" then
                { model | firstname = Nothing, message = "Please enter a valid name" }
            else
                { model | firstname = Just name, message = "Hi " ++ name ++ "!" }

        MsgAgeAsString age ->
            case String.toInt age of
                Just anInt -> { model | age = Just anInt }
                Nothing -> { model | age = Nothing, message = "Please enter a valid age" }

        MsgReset ->
            initialModel
