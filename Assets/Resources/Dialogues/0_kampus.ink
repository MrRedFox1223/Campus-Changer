INCLUDE Globals.ink

{00_PostHowTo == true: -> post_how_to_play}
{00_PostHowTo == false: -> welcome}

== post_how_to_play
Jak wrażenia z naszego interaktywnego badania? #portrait:GeniusLoci
-> END

== welcome

Oto nasz Kampus! Czy znasz już to miejsce? #portrait:GeniusLoci

    + [Tak, jasne! Odwiedzam Kampus kilka razy w tygodniu.]
    ~ 00_HowOften = "Odwiedzam Kampus kilka razy w tygodniu"
    Cudownie. Pewnie masz o nim wyrobione zdanie. 
    -> how_to_play
    + [Tak, odwiedzam Kampus kilka razy w miesiącu.]
     ~ 00_HowOften = "Odwiedzam Kampus kilka razy w miesiącu."
    Świetnie. Pewnie dobrze znasz niektóre zakątki. 
    -> how_to_play
    + [Tak, odwiedzam Kampus kilka razy w semestrze.]
     ~ 00_HowOften = "Odwiedzam Kampus kilka razy w semestrze"
    Znakomicie. Poradzisz sobie bez przewodnika. 
    -> how_to_play
    + [Tak, ale odwiedzam Kampus tylko czasami.]
     ~ 00_HowOften = "Odwiedzam Kampus tylko czasami."
    Nie szkodzi. W razie potrzeby możesz mnie zawołać. 
    -> how_to_play
    + [Nie, nie znam Kampusu.]
     ~ 00_HowOften = "Nie znam Kampusu."
    Nie szkodzi W razie potrzeby możesz mnie zawołać. 
    -> how_to_play
    
== how_to_play

Rozgrywka nie jest skomplikowana. Wystarczy że przejdziesz się po Kampusie Centralnym PW, rozglądając się za innymi osobami, które możesz napotkać na swojej drodze. 
Jeśli mnie zobaczysz, podejdź. Mogę mieć coś ważnego do przekazania.

    + [Dzięki.]

~00_PostHowTo = true
Powodzenia!

-> END