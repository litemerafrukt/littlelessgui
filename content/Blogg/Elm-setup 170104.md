---
author: Bew Gorp
published: "2016-12-21"
#category:
#    - dagens bild
...

Elm-setup och Hello World!
==================================

Det blir roligare att testa runt med ett nytt utvecklingsverktyg om omgivningarna ser ok ut.
<!--more-->

Elm grundpaket kommer med något som kallas elm-reactor. Elm-reactor startar upp en liten server och låter oss testa elm-filer och program. Problemet med Elm-reactor är att vi har ingen kontroll över html-dokumentet som laddar vårt program och om man inte skriver någon inline styling kommer webbläsarens standardstyling att appliceras.

Låt oss fixa det genom att även installera elm-live. Det visar även lite bättre hur elm integreras i en html-sida.

## Installera Elm
Det första vi behöver är naturligtvis Elm paketet. Det enklaste sättet att installera Elm är via npm.

Om du inte har node och npm kan du dra ner och installera det härifrån: [Node.js](https://nodejs.org/en/).

Sedan installerar du Elm globalt via node med:
```sh
$ npm install -g elm
```

Testa att elm är på plats genom att köra:

```sh
$ elm-make --version
```

## Installera elm-live

Elm live är en liten app som vaktar våra elm filer och kompilerar dessa vid förändringar. Den innehåller även en liten server som presenterar sidan och automagiskt laddar om den vid förändringar.

Installera med npm:
```$
$ npm install -g elm-live
```

## Konfigurera din editor

Crockford må säga vad han vill men jag anser att syntax highlighting gör det enklare att visuellt navigera i koden. [Här finns paket med syntax highlighting för alla stora editorer.](https://guide.elm-lang.org/get_started.html#configure-your-editor)

Förutom syntastisk upplysthet rekomenderar jag starkt att man installerar [elm-format](https://github.com/avh4/elm-format) och följer instruktionerna för att få det att fungera i sin editor. Elm-format kommer att vara ett mycket bra hjälpmedel för att lära sig språket. Ser koden fel ut efter att den formaterats är sannorlikheten stor att du använt ett felaktigt syntax.

Man kan löst jämföra elm-format med pythons pep8.

## Rekomenderar Atom

Om du inte har starka preferenser för vilken editor du vill använda så rekomenderar jag githubs Atom. I atom är det lätt att installera och konfigurera olika elm-plugin. För atom finns dessutom en plugin [elmjutsu](https://atom.io/packages/elmjutsu) som bland annat innehåller en "sidekick" som visar elm-dokumentation medans du kodar.

## Hello World i elm-reactor

Med allt installerat sätter vi ihop snabbast möjliga "Hello World."

1. Skapa en katalog för ditt hello-world.
2. Skapa en fil `hello.elm`.
3. Lägg följande kod i filen:
```elm
module Main exposing (main)

import Html exposing (text)

main =
  text "Hello Elm!"
```
4. Kör kommandot `elm-package install` i hello-world katalogen.
5. Starta elm-reactor med `elm-reactor` och öppna sidan [http://localhost:8000](http://localhost:8000)
6. Klicka på "hello.elm" och beskåda ditt första elm-program!

## Hello World med elm-live

Nu vill vi sätta lite styling på vår elm-app. Det går att lägga in styling direkt i elm-programmet men istället ska vi använda lite klassisk css.

Skapa en index.html med följande innehåll:
```html
<!doctype html>
<html>
<head>
    <meta charset="utf-8" />
    <!-- Mobile -->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>Hello Elm</title>
    <style>
        html, body {
            height: 100%;
        }
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            font-family: monospace;
            font-size: xx-large;
        }
    </style>
</head>
<body>
    <script src="hello.js"></script>
    <script>
        // Start elm fullscreen. We could just give it a div, but not today.
        Elm.Main.fullscreen()
    </script>
</body>
</html>
```

Sedan drar vi igång elm-live med kommandot `elm-live hello.elm --output=hello.js` och navigerar till [http://localhost:8000](http://localhost:8000).

Elm-live har även fördelen att sidan automatiskt laddas om när vi förändrat någon av elm-filerna i vårt projekt, förutsatt att det går igenom kompileringen.

## Fin

Jag hoppas att du har kunnat följa med i vad vi har gjort i denna korta och intensiva artikel.

Vill du fortsätta att utforska Elm rekommenderar jag guiden på [elm-lang.org](http://elm-lang.org/): [An Introduction to Elm](https://guide.elm-lang.org/).

Vill du gå rakt på elm arkitekturen och testa lite interaktivitet så hoppa fram till exemplet [buttons](https://guide.elm-lang.org/architecture/user_input/buttons.html). Buttons exemplet kan du kopiera rakt in i hello.elm och köra direkt med elm-live.

I en framtida artikel ska vi använda buttons-exemplet och göra en fizzbuzz med patternmatching :-)
