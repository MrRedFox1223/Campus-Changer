INCLUDE Globals.ink

{00_PostTutorial == true: -> post_tutorial}
{00_PostInitialDialogue == true: -> post_dialogue}
{00_PostInitialDialogue == false: -> welcome}

== post_dialogue 
First, please talk to the guide. He tends to be elusive, but he should be nearby.  #portrait:Profesor
->END

== post_tutorial 
I see you've met Genius Loci! Please don't fret about it, she does not haunt the way the other ghosts do. She will be your guide throughout the entire study. #portrait:Profesor
->END

== welcome 
Hello there! Welcome to the interactive study prepared by the interdisciplinary project team of the Warsaw University of Technology. To continue our conversation, please press the 'E' key. #portrait:Profesor

Shortly, we're going to embark on a tour of the Central Campus of the Warsaw University of Technology. As often happens, along the way, you'll encounter various people who will tell you about their issues, hoping for your help in finding solutions.

Your input is crucial as it will help us make the Campus better for all of its users!

In this game, most of the activities consist of choosing one of several possible responses to a question.
    
Please do not worry, we're not checking whether your answers are correct.

To navigate between responses, press the 'W,' 'A,' 'S,' or 'D' keys. You may choose whatever you want. Let's try that now:

    
    * [I like tomato soup with rice.] -> some_soup
    * [I like tomato soup with noodles.] -> some_soup
    * [I don't like tomato soup.] -> no_soup
    
== some_soup
Excellent! Now you know how to navigate the game, and we know which tomato soup to serve in the cafeteria
-> post_soup

== no_soup
Excellent! Now you know how to navigate the game, and we know not to serve tomato soup in the cafeteria!
-> post_soup

== post_soup

If you don't mind my asking: who are you? We are curious to know if people visiting the Campus for various reasons will give us similar or different answers. 

    + [I study at the Warsaw University of Technology.]
        ~ 00_WhoAreYou = "Studiuję na Politechnice."
    + [I work at the Warsaw University of Technology (academic staff group).]
        ~ 00_WhoAreYou = "Pracuję na Politechnice (pracownik naukowy)."
    + [I work at the Warsaw University of Technology (non-academic staff group).]
        ~ 00_WhoAreYou = "Pracuję na Politechnice (pracownik nienaukowy)."
    + [I live near the Campus.]
        ~ 00_WhoAreYou = "Mieszkam w pobliżu Kampusu."
    + [I visit the Campus for other reasons.]
        ~ 00_WhoAreYou = "Odwiedzam Kampus w innych celach."

- Thank you.

Now, let's try the second most important activity, which is turning around. It's simple enough: just move the mouse in the direction in which you want to turn. 

~ 00_PostInitialDialogue = true
~ ActivateGeniusLoci()

Now, try to turn around and talk to your guide!

-> END

==function ActivateGeniusLoci==
~ return

