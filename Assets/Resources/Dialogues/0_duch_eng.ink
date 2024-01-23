INCLUDE Globals.ink

{00_PostTutorial == false: -> welcome}
{00_PostTutorial == true: -> ready_to_go}

== welcome
Hello there! #portrait:GeniusLoci

I am so happy to be your guide around the Campus!

    + [Yikes! Who are you?!] -> scared
    + [Errr... Hello, I guess?] -> uncertain
    + [Hi there, can we go now?] -> intro_eager

== scared
I am the resident Ghost here. I'm sorry, I didn't mean to startle you. I have a bad habit of appearing unnannounced.
-> intro_puzzled

== uncertain
I’m sorry, I didn’t get a chance to introduce myself. I am the resident Ghost here. 
-> intro_puzzled

== intro_puzzled
    + [ A ghost? Like in some fairy-tale?]
-No, I'm more of a metaphor. Beings who know everything do not actually exist, so we had to create one. 

    + [Oh, right. That's fine.] -> main_tutorial
    + [It was supposed to be a serious study. I’d like a questionnaire.] -> questionaire

== intro_eager
Before we go, I need to ask: do you know how to navigate in a three-dimensional world?

    + [WSAD is my middle name.]
    -> no_tutorial
    + [Yes, I have played similar games. ]
    -> no_tutorial
    + [No, I would like a brief explanation. ]
    -> main_tutorial

== questionaire
This is an experimental study. Instead of a questionnaire, we're going to explore the virtual Campus of the Warsaw University of Technology. Along the way, we'll engage with fictional characters who represent the various challenges and issues of the Campus.

    + [Ah, right. All good! ]
    -> main_tutorial
    + [Oh well.]
    -> main_tutorial

== no_tutorial
Great! We can get right to the point. As soon as we finish this conversation, I will take you to the Campus area.
~ SwitchScene()
    -> END


== main_tutorial
Once we're done talking, please turn in any direction and press the 'W' key. You'll start walking forward. The 'A', 'S', and 'D' keys will also allow you to move, just in different directions!

~ 00_PostTutorial = true
After you take a few steps, please come back to me, and I'll transfer you to the Campus area.

    -> END

== ready_to_go 
Are you ready to go to the Campus? #portrait:GeniusLoci

    + [Yes, I'm ready!]
    Excellent, let's go!
    ~ SwitchScene()
    -> END
    
    + [I need a second.]
    Naturally. Come back to me when you're ready.
    -> END
    



