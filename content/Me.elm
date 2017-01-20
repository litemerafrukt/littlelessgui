module Content.Me exposing (content)

import Html exposing (Html)
import Markdown
import Types exposing (Msg)


content : Html Msg
content =
    Markdown.toHtml [] about


about : String
about =
    """
### Anders Nygren

<img src="img/me64.png" class="selfie"/>

Jag studerar webbutveckling på Blekinge Tekniska Högskola. När jag inte studerar så jobbar jag med mikroslöjd i Malmö eller är helt enkelt ute och cyklar.

#### Me-länkar

* [GitHub](https://github.com/litemerafrukt)
* [Codewars](https://www.codewars.com/users/litemerafrukt)
* [Dbwebb](http://www.student.bth.se/~anng15/dbwebb-kurser/)
* [Odontologi](http://tandlakarenygren.se)
"""
