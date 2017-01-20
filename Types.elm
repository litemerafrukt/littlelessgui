module Types exposing (..)

import Html exposing (Html)


-- Msg


type Msg
    = PromptOutput String
    | CliCommand
    | ClickCommand String
    | PromptFocus
    | NoOp



-- TYPES


type alias OutputHistory =
    List (Html Msg)



-- MODEL


type alias Model =
    { outputHistory : OutputHistory
    , prompt : String
    }
