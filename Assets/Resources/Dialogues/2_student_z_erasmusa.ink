INCLUDE Globals.ink

{02_bIsDecisionMade == true: -> DecisionRevisit}
{02_bIsDecisionMade == false: -> BeginQuest}

== DecisionRevisit
Obawiam się, że skończyły mi się kwestie dialogowe. #portrait:StudentZErasmusa
-> END

== BeginQuest

Cześć, co słychać? #portrait:StudentZErasmusa

    * [Podobno chcesz tu urządzić jakąś gastronomię.]
    
    - Nie inaczej. Przydałoby się coś zjeść między wykładami, a ja jeszcze dobrze nie znam okolicy. Wiesz, nie za drogie jedzenie, ale smaczne i fajnie podane. 
    -> MainArgumentNode
    
== MainArgumentNode

    + [Dlaczego chcesz jeść właśnie tutaj?]
        -> Question_01
    + [Co będą z tego będą mieć inne osoby korzystające z tej przestrzeni?]
        -> Question_02
    + [Co powiesz na parking?]
        -> Question_03
    + [A może po prostu zostawić zieleń?]
        -> Question_04
    + [Jest pomysł, żeby tu zrobić galerię plenerową.]
        -> Question_05
    + [Nie mam więcej pytań.]
        -> END
    
    == Question_01
    Bo tu jest przytulnie! No i miałbym blisko z powrotem na wydział.
    -> MainArgumentNode
    
    == Question_02
    Oni też mieliby blisko. W pobliżu jest kilka innych wydziałów. Może ludzie zaglądaliby tu częściej.
    -> MainArgumentNode
    
    == Question_03
    Zmieściłoby się tylko kilka samochodów. I dodatkowo byłoby trudno wjechać i wyjechać. Hmm… myślę, że nie warto.
    -> MainArgumentNode
    
    == Question_04
Zieleń mi nie przeszkadza, ale potrzeba więcej miejsca, żeby położyć koc, ustawić leżaki. Drzewa mogą zostać. Można by też coś dosadzić i zrobić klomby.
    -> MainArgumentNode
    
    == Question_05
 Wiesz, o taką galerię trzeba by potem dbać i popularyzować, to co się pokazuje. Bo inaczej pewnie porosłaby grubą warstwą “kurzu”.
    -> MainArgumentNode
    
    
    -> END