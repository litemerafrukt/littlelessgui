module Commands exposing (..)

import Html exposing (Html, text, div, p, button, a)
import Html.Events exposing (onClick)
import Dict
import Markdown
import Types exposing (..)
import Content.Me as Me
import Content.Page as Page
import Content.Blogg.Refactor as Blog


{--
    Currently I am using a dict that holds all commands as keys and a union type as
    variable. Could be that this is overly complex. But at the same time I find it
    to be readable when all possible actions is in a dict and are translated to a
    union type.
--}


type CliCommand
    = About (Maybe AboutPage)
    | GitHub
    | Help
    | Blog
    | Clear
    | NewPrompt
    | NotValid String


type AboutPage
    = Me
    | Page


type CommandAction
    = Content (Html Msg)
    | ClearHistory


availableCommands : Dict.Dict (List String) CliCommand
availableCommands =
    Dict.fromList
        [ ( [], NewPrompt )
        , ( [ "" ], NewPrompt )
        , ( [ "about" ], About <| Just Me )
        , ( [ "about", "page" ], About <| Just Page )
          --   , ( [ "about" ], About Nothing )
        , ( [ "blog" ], Blog )
        , ( [ "help" ], Help )
        , ( [ "github" ], GitHub )
        , ( [ "clear" ], Clear )
        ]


runCommand : String -> CommandAction
runCommand rawCommand =
    case parseCommand rawCommand of
        NewPrompt ->
            Content <| text ""

        About page ->
            case page of
                Just Me ->
                    Content Me.content

                Just Page ->
                    Content Page.content

                Nothing ->
                    Content <| text "Do you want 'me' or 'page'?"

        Blog ->
            Content Blog.content

        GitHub ->
            Content <| Markdown.toHtml [] "My github is @: [https://github.com/litemerafrukt](https://github.com/litemerafrukt)"

        Help ->
            -- Content <| text "yeah yeah soon enough"
            Content viewHelp

        Clear ->
            ClearHistory

        NotValid c ->
            Content <| text <| "Could not find command: '" ++ c ++ "'. Please try 'help'."



{--
Translate string-command to union type CliCommand by using the
availableCommands dict.
--}


parseCommand : String -> CliCommand
parseCommand rawCommand =
    let
        command =
            String.trim rawCommand
                |> String.toLower
                |> String.words
    in
        case Dict.get command availableCommands of
            Just cliCommand ->
                cliCommand

            Nothing ->
                NotValid <| String.join " " command


viewHelp : Html Msg
viewHelp =
    let
        commands =
            -- List.map (String.join " ") (Dict.keys availableCommands)
            Dict.keys availableCommands
                |> List.filter (\xs -> not (List.isEmpty xs || List.head xs == Just ""))
                |> List.map (String.join " ")
    in
        div []
            [ p [] [ text "Available commands:" ]
            , p []
                (List.map
                    viewCommand
                    commands
                )
            ]


viewCommand : String -> Html Msg
viewCommand command =
    p [] [ a [ onClick <| ClickCommand command ] [ text command ] ]


viewHeaderCommands : Html Msg
viewHeaderCommands =
    p []
        [ a [ onClick <| ClickCommand "about" ] [ text "Me" ]
        , a [ onClick <| ClickCommand "about page" ] [ text "Page" ]
        , a [ onClick <| ClickCommand "blog" ] [ text "blog" ]
        , a [ onClick <| ClickCommand "help" ] [ text "help" ]
        ]
