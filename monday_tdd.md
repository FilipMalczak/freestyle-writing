> Before we start - I'm a backend dev, I had my share of SCRUM mastering and tech
> leading. Here I try to show a scenario that may happen in a software house or
> a startup. "Username" feature is used as an example. While I ask you that while
> there may be many alternative possible solutions for this scenario, I am not 
> using examples of argumentations and excuses that I haven't heard before
> (arranged for this scenario, of course), insults included (though I'm pretty
> much freestyling in this case). To be honest, sometimes I'm paraphrasing myself.

# A Monday morning

So, you come to the office on one Monday morning. It's Monday, people will try 
to rip each others throats off. We all know the drill. You grab your mug from 
the desk and go to the kitchen, where you find your colleagues - a backend 
developer (lets call him Ben) and a frontend developer (web dev, mobile dev, etc - let's call him Mike).

> **Ben:** Come on! We agreed! You were supposed to return first and last name as "name" field!
>
> **Mike:** No, I was supposed to return firstName and lastName!
>
> **Ben:* No, you weren't!
>
> **Mike:** Yes, I was! Just look at the whiteboard!

So you follow them to the room where there's a whiteboard you use to write down
your APIs when you try to come up and agree on them. There's a bunch of cases 
how it can go down from there:

1. Someone erased the whiteboard over the weekend. In that case you have much 
  worse problem than the ones I'm trying to help solve with that piece of text.
  You can be pretty much sure, that if the feature was going to be ready before
  now, it will definitely need some work.

2. Whiteboard agrees with one of the guys. For the sake of example, let's say 
  that it was Ben was right (backend team for life, baby!).
  It  could be the other way round, though - the example will still work. 
  > **Mike:** That's not right! On Friday it said firstName and lastName!
  >
  > **Ben:** Go eat a massive bag of *****! It didn't!
  Or something along these lines. It's Monday, come on, cut him some slack.
  From there you can go scapegoat-seeking, full-on "I'm right, you smelly so-and-so",
  or these rare cases of deescalation. Who knows? Anyway, the username feature 
  won't be ready yet.
  
3. Whiteboard agrees with one of the guys that don't lose temper easily.
  > **Mike:** Huh, that's weird, I must have made a mistake. Look, it will take me 
    quite a while to fix it, this was supposed to be a prototype and I was going
    to refactor later. Can we do it my way? The feature will be ready earlier
    in that case.
  or maybe:
  > **Ben:** Huh, that's unexpected. We need to work on our workflow. Anyway, this
    API is already consumed by a bunch of other services, I can't change it 
    without talking to a dozen people.
