module Content.Page exposing (content)

import Html exposing (Html)
import Markdown
import Types exposing (Msg)


content : Html Msg
content =
    Markdown.toHtml [] about


about : String
about =
    """
### Om Sidan

Me-sida v0.0.1

Motivet till att göra denna sidan var dels jag ville göra nått lite annorlunda,
dels tycker jag om den brutalistiska stiltrenden inom webdesign och sist men inte minst ville
jag ha ett eget litet fullstackprojekt att strula med.

Klientsidan är skriven i Elm och för närvarande är det statiska filer. Min tanke är att göra en
backend i python eller node. Backenden skulle kunna stå för dynamiskt laddande av blogg-artiklar
eller ett enkelt meddelande system.

Markdown används för större textstycken som detta. För närvarande fuskar jag med bloggen och laddar alla
bloggartiklarna till klienten på en gång.

Sidan finns på [min github](https://github.com/litemerafrukt).
"""
