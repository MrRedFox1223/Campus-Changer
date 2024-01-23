INCLUDE Globals.ink

{00_PostHowTo == true: -> post_how_to_play}
{00_PostHowTo == false: -> welcome}

== post_how_to_play
How have you found our interactive study? #portrait:GeniusLoci
-> END

== welcome

Here's our Campus! Are you familiar with this place? #portrait:GeniusLoci

    + [Yes, of course! I visit the Campus several times a week.]
    ~ 00_HowOften = "Odwiedzam Kampus kilka razy w tygodniu"
    That’s wonderful. You probably have a formed opinion about it.
    -> how_to_play
    + [Yes, I visit the Campus several times a month.]
     ~ 00_HowOften = "Odwiedzam Kampus kilka razy w miesiącu."
    That’s great! You probably know some parts of it well.
    -> how_to_play
    + [Yes, I visit the Campus a few times each semester.]
     ~ 00_HowOften = "Odwiedzam Kampus kilka razy w semestrze"
    Excellent. You'll manage without a guide! 
    -> how_to_play
    + [Yes, but I only visit the Campus occasionally.]
     ~ 00_HowOften = "Odwiedzam Kampus tylko czasami."
    No problem. You can come back to me when you need me. 
    -> how_to_play
    + [No, I don’t know the Campus.]
     ~ 00_HowOften = "Nie znam Kampusu."
    No problem. You can come back to me when you need me. 
    -> how_to_play
    
== how_to_play

The gameplay is not complicated. All you need is to walk around the Central Campus of the Warsaw University of Technology, keeping an eye out for other people you might encounter along the way. 
If you see me, come over. I might have something important to share with you.

    + [Thanks.]

~00_PostHowTo = true
Good luck!

-> END