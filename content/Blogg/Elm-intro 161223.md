---
author: Bew Gorp
published: "2016-12-20"
category:
    - Elm
...
Elm på Svenska
==================================
[FIGURE src="image/blogg/elm-logo.png?w=128"]
Elm är ett funktionellt programmeringsspråk för att göra appar som körs i webbläsaren. Skaparen Evan Czaplicki började skriva på Elm när han blivit frustrerad över hur det var att utveckla Javascript appar med html, css och vanilla Javascript. Ett av ledorden i utvecklingen av Elm är "developer happiness."
<!--more-->

## Elm har flera styrkor

En av de största fördelarna med Elm, som jag ser det, är att du i princip inte kan få några "runtime exceptions". Genom att Elm är ett kompilerat och helt typat språk kan kompilatorn kontrollera att du har deklarationer för alla dina funktioner och konstanter. Felmeddelandet "undefined is not a funktion" kan du inte att få i Elm.

Andra fördelar:

* En inbyggd struktur för utveckling (liknar react-redux även om heriditeten är den omvända).
* En vänlig och hjälpsam kompilator.
* Enklare refaktorering genom att kompilatorn håller reda på om du missar något.
* Typsystemet gör koden nästan självdokumenterande.

## Kompilerat

[FIGURE src="image/blogg/elm-beginnerprogram.png?w=256" caption="Flödet i ett Elm-program"]

Elm är ett programmeringsspråk för att skriva appar som körs i webbläsare. För att kunna göra detta kompileras Elm-koden till Javascript. Att Elm är ett funktionellt språk innebär att alla funktioner är "pure" det vill säga funktioner har inga sidoeffekter, du skickar in parametrar och får tillbaka ett resultat, alltid. Detta har flera fördelar, bland annat blir det lättare att förstå koden, du kommer inte att behöva leta efter globala variabler som används eller fundera på vad en funktion, utan parametrar och som inte returnerar nånting, egentligen gör.

## Elm i produktion

Flera företag använder redan Elm i produktion. [NoRedInk](http://tech.noredink.com/post/129641182738/building-a-live-validated-signup-form-in-elm) är förmodligen det mest kända då både Elm evangelisten Richard Feldman och numera även Elms skapare Evan Czaplicki jobbar där. Ett annat företag som har Elm som frontend i sin stack, och även en intressant blogg, är [gizra](http://www.gizra.com/content/thinking-choosing-elm/).

## Prova på Elm
Jag kommer att göra några bloggartiklar om att komma igång med Elm. Vill du prova direkt kan du testa i [online editorn](http://elm-lang.org/try).

## Läs och lyssna mer
* Podcast från The Web Platform, [108 Elm Revisited](http://thewebplatformpodcast.com/108-elm-revisited)
* Erfarenheter av Elm i produktion: [How Elm made our work better](http://futurice.com/blog/elm-in-the-real-world)
* Utförligt svar på Quora om att [skifta från Javascript till Elm](https://www.quora.com/Why-did-you-switch-to-Elm-from-JavaScript/answer/Ryan-C-Collins?srid=6Bkv)
