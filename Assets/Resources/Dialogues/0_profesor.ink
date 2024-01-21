INCLUDE Globals.ink

{00_PostTutorial == true: -> post_tutorial}
{00_PostInitialDialogue == true: -> post_dialogue}
{00_PostInitialDialogue == false: -> welcome}

== post_dialogue 
Najpierw porozmawiaj z przewodnikiem. Czasami jest trochę ulotny, ale powinien być gdzieś w pobliżu. #portrait:Profesor
->END

== post_tutorial 
Widzę, że udało Ci się poznać Genius Loci. Nie martw się, nie straszy jak inne duchy. Ten poprowadzi Cię przez całe badanie. #portrait:Profesor
->END

== welcome 
Cześć! Witamy w interaktywnym badaniu przygotowanym przez interdyscyplinarny zespół projektowy Politechniki Warszawskiej. Aby kontynuować naszą rozmowę kliknij klawisz "E". #portrait:Profesor

Za chwilę wyruszymy na wycieczkę po Kampusie Centralnym Politechniki.
Na swojej drodze, jak to zazwyczaj bywa, napotkasz różnych ludzi, którzy opowiedzą Ci o różnych swoich sprawach licząc na to, że im pomożesz je rozstrzygnąć.

Twoje wskazówki są niezmiernie ważne! Pomogą nam uczynić Kampus lepszym dla wszystkich jego użytkowników!
    
Większość czynności w tej grze polega na wybraniu jednej z kilku możliwych odpowiedzi na pytanie. 

Nie martw się – nie będziemy sprawdzać, czy Twoje odpowiedzi są dobre.  
Aby poruszać się pomiędzy odpowiedziami kliknij klawisz "W", "A", "S" lub "D". Możesz wybrać co chcesz. Spróbujmy tego teraz:
    
    * [Lubię zupę pomidorową z ryżem.] -> some_soup
    * [Lubię zupę pomidorową z makaronem.] -> some_soup
    * [Nie lubię zupy pomidorowej.] -> no_soup
    
== some_soup
Znakomicie! Teraz Ty wiesz, jak kierować grą, a my wiemy, jaką zupę pomidorową podawać w stołówce. 
-> post_soup

== no_soup
Znakomicie! Teraz Ty wiesz, jak kierować grą, a my wiemy, żeby nie podawać zupy pomidorowej w stołówce. 
-> post_soup

== post_soup

Przy okazji: kim jesteś? Ciekawi nas, czy osoby odwiedzające Kampus w różnych celach będą nam udzielać podobnych, czy różnych odpowiedzi.

    + [Studiuję na Politechnice.]
        ~ 00_WhoAreYou = "Studiuję na Politechnice."
    + [Pracuję na Politechnice (pracownik naukowy).]
        ~ 00_WhoAreYou = "Pracuję na Politechnice (pracownik naukowy)."
    + [Pracuję na Politechnice (pracownik nienaukowy).]
        ~ 00_WhoAreYou = "Pracuję na Politechnice (pracownik nienaukowy)."
    + [Mieszkam w pobliżu Kampusu.]
        ~ 00_WhoAreYou = "Mieszkam w pobliżu Kampusu."
    + [Odwiedzam Kampus w innych celach.]
        ~ 00_WhoAreYou = "Odwiedzam Kampus w innych celach."

- Dziękuję.

Spróbujmy teraz drugiej najważniejszej czynności, czyli obracania się. To proste: wystarczy że przesuniesz mysz w kierunku, w którym chcesz się obrócić. 

~ 00_PostInitialDialogue = true
~ ActivateGeniusLoci()

Spróbuj teraz obrócić się i porozmawiać z Twoim przewodnikiem.

-> END

==function ActivateGeniusLoci==
~ return



