module Content.Blogg.Refactor exposing (content)

import Html exposing (Html)
import Html.Attributes exposing (class)
import Markdown
import Types exposing (Msg)


content : Html Msg
content =
    Markdown.toHtml [ class "blog-article" ] about


about : String
about =
    """
2017-01-02

Bota refaktoreringssmärtan
==================================

Att omstrukturera sin kod, refaktorisering, kan ibland kännas smärtsamt. Vi har ett fungerande program men koden ser ut som skit. Ska vi fortsätta utvecklingen, eller ens kunna göra underhåll, måste vi städa upp. Göra en refaktorering.

Boten mot refaktoreringssmärtan, vill jag hävda, är ett kompilerat, starkt typat och funktionellt programmeringsspråk!

Jag skriver nästan alltid skitkod till att börja med. Kod som börjar med att lösa en del av uppgiften. Sedan bygger jag på med kod som löser fler delar av uppgiften. Under tiden städar jag upp, abstraherar delar, ser till att hålla koden DRY och så vidare.

Vi människor har dock en väldigt begränsad hjärna. Vi kan i medeltal hålla fem saker i närminnet samtidigt (vilket har en mängd implikationer som är en helt egen bloggartikel!) Detta ger att det oundvikligen kommer att finnas mer eller mindre "technical dept" i koden i sin första färdiga iteration. Ibland spelar det ingen roll, det kanske är ett skriv och släng skript, men ofta behöver vi komma tillbaka och ändrar i koden.

Det är i detta läge vi kan känna refaktoreringssmärta.

## Olika typer av buggar
Till att börja med skulle jag vilja definiera två typer av buggar.

<img src="img/buggar.jpg">

* Skitbuggar - stavfel och slarvfel som att missa att 5 + '5' är 55, inte 10 eller att "undefined is not a function"
* Ok buggar - logiska buggar, programmet fungerar på ett annat sätt än tänkt.

Att de sistnämnda får kallas ok buggar är för att det är mänskligt att fela. Gör om, gör rätt.

De förstnämnda, skit buggarna, är skitbuggar för de är sådana buggar som lätt kan undvikas. De är sådana buggar som våra datorer är experter på att hitta och hjälpa oss att slippa. Om vi använder rätt verktyg.

## Funktionstestad Javascript

Vi tänker oss att vi utvecklar en liten javascriptapplikation. Det är en ganska liten sak, vi har kort om tid och den är bara tänkt för internt bruk så vi bestämmer oss för att skippa automatiserade tester och bara köra funktionstester.

Vi gör en mängd utvecklingscykler där vi skriver en bit kod, testar att det fungerar som tänkt och repeterar. När vi är färdiga verkar det fungera och vi gör ett mer omfattande funktionstest där vi försöker eliminera så många som möjligt av buggarna.

<img src="img/javascript-testing.jpg">

## Funktionstestad Elm

I ett parallellt universum har vår utvecklingsavdelning sett fördelarna med ett kompilerat och starkt typat språk. Där har vi gått över till att utveckla i Elm och använder bara javascript när vi vill använda externa bibliotek.

Här ser utvecklingen lite annorlunda ut. Det är fortfarande en cykel av att skriva lite kod och testa men mycket av testandet är mot kompilatorn. Kompilatorn berättar för oss om vi glömt en rad i en case-sats, om vi försöker lägga ihop 5 och '5' eller om vi inte hanterar när en lista är tom. Det är en lite längre resa till att vi får testa vårt program. I gengäld har datorn, kompilatorn, sett till att vi redan har eliminerat våra skitbuggar.

Skitbuggarna har eliminerats ur vår Elm-kod utan att vi behövt tänka på att testa alla möjliga "edge cases". Bara en sån sak!

<img src="img/elm-testing.jpg">

När vi funktionstestar vår app kan vi fokusera på funktionen och att hitta de logiska buggar vi byggt in.

## Refaktorering - smärta och smärtlindring

Vår lilla app, avsedd för internt bruk, blev naturligtvis en succé. Därför kommer chefen och berättar att den ska skeppas till kund, dock med en del förändringar.

I javascript-universat känner vi kallsvetten rinna längs ryggen. Det var inte meningen att appen skulle lämna utvecklingsavdelningen. Appen innehåller en hel del technical dept och den behöver en ordentlig refaktorering för att vi ska kunna införa de föreslagna förändringarna.

I vårt parallella elm-universa känner vi ingen kallsvett, bara berättigad stolthet över att vår app blivit så uppskattad. Visst har vår elm-applikation ett stort technical dept men tillsammans med kompilatorn kommer vi inte att ha några större problem att göra en snygg refaktorering.

Skillnaden ligger i skitbuggarna. Att omstrukturera koden kommer inte att införa några nya logiska buggar men skitbuggar kommer garanterat att dyka upp vid en ordentlig refaktorering. Kombinera detta med att både försäljningsavdelningen och chefen tror att appen i stort sett är färdig att skeppas så har vi föklaringen till javascriptutvecklarens kallsvett.

<img src="img/refactor.jpg">

## Funktionell programmering

Om det räcker med kompilator och stark typning, varför blandade jag då in funktionell programmering i ingressen? Jo, när vi väl vill lägga till automatiserade tester, vilket vi förmodligen vill nu när appen skall börja skeppas till kund, kan även dessa tester vara inriktade på funktion. Vi behöver inte testa för skitbuggar.

De automatiserade testerna blir dessutom enklare att skriva genom att alla funktionerna i vår elm-app är "pure".

## Våga vägra skitbuggar

Testa ett typat språk som kompilerar till javascript. Om inte elm så kanske typescript?

## Se mer

En video med Richard Feldman från Reactiv Conf 2016. Videon tar bland annat upp refaktorering i react vs elm.
[Elm and React in production](https://www.youtube.com/watch?v=3FNKaGm3gk0)
"""
