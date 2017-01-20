module App exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput, on, keyCode, onBlur)
import Html.Lazy exposing (lazy)
import Task
import Dom
import Dom.Scroll
import Json.Decode as Json
import Types exposing (..)
import Commands exposing (..)


init : ( Model, Cmd Msg )
init =
    { outputHistory = []
    , prompt = ""
    }
        ! [ Cmd.none ]



-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        PromptOutput promptInput ->
            { model | prompt = promptInput } ! []

        CliCommand ->
            let
                command =
                    span [] [ promptSymboml, text model.prompt ]
            in
                case runCommand model.prompt of
                    Content content ->
                        { model | outputHistory = model.outputHistory ++ [ command, content ], prompt = "" } ! [ Task.attempt (always NoOp) (Dom.Scroll.toBottom "screen") ]

                    ClearHistory ->
                        { model | outputHistory = [], prompt = "" } ! []

        ClickCommand command ->
            let
                newModel =
                    { model | prompt = command }
            in
                update CliCommand newModel

        PromptFocus ->
            model ! [ Task.attempt (always NoOp) (Dom.focus "theprompt") ]

        NoOp ->
            model ! []



-- VIEW


promptSymboml : Html Msg
promptSymboml =
    span [] [ br [] [], text "READY.", br [] [] ]


view : Model -> Html Msg
view model =
    div [ class "screen", id "screen" ]
        [ p [ class "header-text" ] [ text "**** LITEMINDREGUI 64 BASIC V2 ****" ]
        , p [ class "header-text header-links" ] [ Commands.viewHeaderCommands ]
        , lazy viewHistory model.outputHistory
        , div [ id "prompt" ]
            [ span [] [ promptSymboml ]
            , span [ id "inputoutput" ]
                [ text model.prompt ]
            , span [ class "cursor" ]
                [ text "|" ]
            , input
                [ attribute "autofocus" ""
                , id "theprompt"
                , type_ "text"
                , value model.prompt
                , onInput PromptOutput
                , onEnter CliCommand
                , onBlur PromptFocus
                ]
                []
            ]
        ]



{--Could i use lazy for rendering of the history?
--}
-- HELPERS


viewHistory : OutputHistory -> Html Msg
viewHistory outputHistory =
    div [ class "history" ]
        (List.map viewHistorySection outputHistory)


viewHistorySection : Html Msg -> Html Msg
viewHistorySection historySection =
    section [ class "history-section" ]
        [ historySection ]


onEnter : Msg -> Attribute Msg
onEnter msg =
    let
        isEnter code =
            if code == 13 then
                Json.succeed msg
            else
                Json.fail "not ENTER"
    in
        on "keydown" (Json.andThen isEnter keyCode)
