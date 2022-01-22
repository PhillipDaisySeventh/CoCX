package classes.Scenes.Places.TrollVillage {
//import classes.*;
//import classes.GlobalFlags.kFLAGS;
//import classes.Scenes.SceneLib;
import classes.Scenes.Places.TrollVillage;
public class Kuru extends TrollVillageAbstractContent{
    public function Kuru() {
    }
    public function KuruDining():void{
        clearOutput();
        if (TrollVillage.ZenjiFollowing) outputText("\"Ah, sorry, [name]. I need ta use the restroom, I’ll be back in a bit.\"\n" +
                "\n" +
                "He gives you a brief kiss on the cheek before excusing himself.\n");
        if (!TrollVillage.KuruUnlocked){
            outputText("While waiting around, you flag down the waitress as she passes by your table, feeling that you could get to know her in the idle time. She looks at you earnestly, but despite her serious tone, there’s a hint of comfort in her presence.\n\n");
            outputText("You want to get to know the people around the village, and she seemed like a pleasant person to talk to.\n\n");
            outputText("\"My name is Kuru\" She replies with a soft grin, \"It’s been a fairly calm life, nothing too special. My parents are the chefs here and I work around the hall.\"\n\n");
            outputText("Kuru looks around idly for a moment, \"I don’t know. Things are nice, I wouldn’t really have it any other way. My parents love me and I feel comfortable with what I do.\" Kuru takes a sip of water from a small canteen on her hip. \"What about you, are you comfortable with how things are going in your life?\"\n\n");
            outputText("You think about her question, the memory of everything you’ve done so far, all the things that led you up to this moment. It has not been a bad journey, you’ve met some rather nice people after all. You tell her that things are going well, all things considered.\n\n");
            outputText("\"That’s nice, glad to hear that all is well. I hope you’re enjoying the village too.\" Kuru replies\n\n");
            outputText("You tell her that it is nice and you’re glad to enjoy some company that’s as good as hers.\n\n");
            outputText("Kuru gives you a warm smile, \"Cool, thanks, I must get back to work now though. Bye.\"\n\n");
            outputText("She unceremoniously stands up and leaves you alone for the time being. You exit the dining hall once you’ve decided there’s nothing left for you at this time.\n\n");
            TrollVillage.KuruUnlocked = true;
            KuruExitDialogue();
        }
        else{
            outputText("While waiting around, you flag down Kuru, the waitress as she passes by your table, feeling that you could get to know her in the idle time. She looks at you earnestly, but despite her serious tone, there’s a hint of comfort in her presence.\n" +
                    "\n" +
                    "\"You wanted something?\"\n" +
                    "\n" +
                    "You tell the waitress that she seemed like a pleasant person, and you just wanted to talk to her.\n" +
                    "\n" +
                    "The waitress glances around the hall, before turning her attention to you. \"Alright, I have some time to spare, what did you want to talk about?\"");
            menu();
            addButton(0, "Herself", KuruSelfIntro);
            addButton(1, "Her Job", KuruJob);
            addButton(2, "The People", KuruLocals);
        }
    }

    private function KuruSelfIntro():void{
        clearOutput();
        outputText("You want to get to know more about her, who is Kuru and what does she do?\n" +
                "\n" +
                "Kuru looks around idly for a moment, \"I don’t know. Things have been going well lately, I wouldn’t really have it any other way. My parents love me and I feel comfortable with what I do.\" Kuru takes a sip of water from a small canteen on her hip.\n" +
                "\n" +
                "\"Business is the same as always, nothing special about it honestly. I know I will grow up to take care of the dining hall, it is a very nice place after all. I wouldn’t change a thing about it.\"\n" +
                "\n" +
                "You tell her that’s good to hear, you’re glad she enjoys what she does.\n" +
                "\n" +
                "Kuru gives you a warm smile, \"Cool, thanks, I must get back to work now though. Bye.\"\n");
        outputText("She unceremoniously stands up and leaves you alone for the time being. You exit the dining hall once you’ve decided there’s nothing left for you at this time.\n\n");
        KuruExitDialogue();
    }

    private function KuruJob():void{
        outputText("You want to get to know how she feels about working here, how she does it, and what it’s like dealing with the people.\n" +
                "\n" +
                "\"It’s all well,\" She replies, placing a platter full of glasses on the table and sitting down. \"Most people are very pleasant and besides, we’re all trying to get back to business. For many, there’s not too much time to socialize, so it’s best to finish your food and get back to work.\"\n" +
                "\n" +
                "Kuru glances around nervously, \"There is this one guy… I’m not saying names, but I swear, he’s out there… hunting for his next victim every time he eats. I’ve seen the way he eyes other guys, why other guys specifically?\" She shakes her head. \"Other than that creep it’s calm and actually rather pleasant dealing with other people, sometimes they have something exciting that happened earlier today.\"\n" +
                "\n" +
                "\"I still remember when my parents told me it was time I learned how to manage the dining hall, cleaning up, and interacting with the others. I was so scared, but it was actually easy since I knew most of the people, I didn’t need to be nervous around them.\"\n" +
                "\n" +
                "Kuru glances at the platter beside the table again. \"I must get back to work now though, bye.\"\n" +
                "\n" +
                "She quickly stands up, picking up her things before leaving you.\n");
        KuruExitDialogue();
    }

    private function KuruLocals():void{
        outputText("You want to get to know more about the people in the village. After all, being the waitress of the dining hall she must have heard many interesting stories and tales from the other trolls and have a good sense of the people around the village. \n" +
                "\n" +
                "\"The people here are nice,\" Kuru replies, placing the platter on the table and sitting beside you. \"It can be a little hectic at times. Plenty of people are trying to do things quickly to get back to their business, whatever it may be. What do they do in their free time I’m not sure. I’m just cleaning the tables and serving the food my parents prepare.\"\n" +
                "\n" +
                "\"I must say though.\" She says, giving a nervous glance around the room, \"While most trolls are calm and peaceful, that only makes the worst seem worse. Trust me, there are some nasty people even in this village, but we can’t do anything about it because everyone serves an important role, no matter how small it may be.\"\n" +
                "\n" +
                "Kuru looks at the platter on the table again. \"Speaking of which, I best get back to my job, after all, the food won't serve itself.\"\n" +
                "\n" +
                "She quickly stands up, picking up her things before leaving you.\n");
        KuruExitDialogue();
    }

    public function KuruExitDialogue():void{
        if (TrollVillage.ZenjiFollowing){
            outputText("After another minute Zenji returns.\n" +
                    "\n" +
                    "\"Alright, let's get going back ta camp, sound good, [name]?\"\n" +
                    "\n" +
                    "You nod, deciding it’s about time to go back home with your lover.\n");
        }
        else{
            outputText("You decide to head home for the time being\n");
        }
        doNext(camp.returnToCampUseOneHour);
    }
}
}
