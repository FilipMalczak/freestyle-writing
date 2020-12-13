# TDD and Monday walk into a bar.

Before we start - I'm a backend dev, I had my share of SCRUM mastering and tech
leading. Here I try to show a scenario that may happen in a software house or
a startup. "Username" feature is used as a simplified example. While 
there may be many alternative possible solutions for this scenario, I am not 
using examples of argumentations and excuses that I haven't heard before, insults 
included (arranged for this scenario, of course, though I'm pretty much freestyling
in this case of insults). To be honest, in Ben's case I may be paraphrasing myself 
a bit.

## A Monday morning

So, you come to the office on one Monday morning. It's Monday, people will try 
to rip each others throats off. We all know the drill. You grab your mug from 
the desk and go to the kitchen, where you find your colleagues - a backend 
developer (lets call him Ben) and a frontend developer (web dev, mobile dev, etc - let's call him Mike).

> **Ben:** Come on! We agreed! You were supposed to return first and last name as "name" field!
>
> **Mike:** No, I was supposed to return "firstName" and "lastName"!
>
> **Ben:** No, you weren't!
>
> **Mike:** Yes, I was! Just look at the whiteboard!

In this story you're a drama addict, so you follow them to the room where there's
a whiteboard that you use to write down your APIs and agreements. There's a bunch 
of caseshow it can go down from there:

1. Someone erased the whiteboard over the weekend. In that case you have much 
  worse problems than the ones I'm trying to remediate here. **todo possible typo**
  You can pretty much be sure that if the feature was going to be ready before
  now, it will definitely need some work.

2. Whiteboard agrees with one of the guys. For the sake of example, let's say 
  that it was Ben that was right (backend team for life, baby!).
  It  could be the other way round, though - the example will still work. 
  > **Mike:** That's not right! On Friday it said "firstName" and "lastName"!
  >
  > **Ben:** Go eat a massive bag of *****! It didn't!
  
  Or something along these lines. It's Monday, come on, cut him some slack.
  From there you can go scapegoat-seeking, full-on "I'm right, you smelly so-and-so",
  or these rare cases of deescalation. Who knows? Anyway, the username feature 
  won't be ready yet.
  
3. Whiteboard agrees with one of the guys that don't lose temper that easily.
  > **Mike:** Huh, that's weird, I must have made a mistake. Look, it will take me 
    quite a while to fix it, this was supposed to be a prototype and I was going
    to refactor later. Can we do it my way? The feature will be ready earlier
    in that case.
    
  or maybe:
  
  > **Ben:** Huh, that's unexpected. We need to work on our workflow. Anyway, this
    API is already consumed by a bunch of other services, I can't change it 
    without talking to a dozen people.
  One way or the other, there will be a problem and a delay. Both sides thought
  that they have their work finished, and yet one of them still have the stuff to
  do.

## What happened?

A lot of things may have happened. There may have been a mischief (easy to do
when your golden source of truth can be deleted with a sponge). There may have
been a brainfart. There may have been a confusion. There may have been simple
laziness.

> Wait, was that 1 or 2 fields? It's written on the whiteboard... But
> my chair is sooooooo comfy...

What really happened is that someone missed something. There was something of
an agreement, but it wasn't really persisted. I mean, is whiteboard really persistent?
It was easy to make a mistake. Checking required effort. Making change was 
transparently and anonymously possible.

Who missed it? A bunch of people. Authors of code. Code reviewers. Tech lead 
(who's responsibility is to take blame on his people's mistakes).  Colleagues 
present on SCRUM standup (who could have caught the issue or asked about details
that would allow it). SCRUM master (who's supposed to moderate level of details
given by team members. Who knows? In the end, all that matters is that the team
won't deliver the feature as soon as they could. Why? Because of a nuissance...

**Insert Piccard facepalm here**

## How could that be prevented?

Let's divide and conquer. First issue that is clearly visible is persistency of
the agreement. 

### Agreement persistency

When you agree on something, **WRITE THAT DOWN**. Save that file
and send it to the whole team. At least you have backup and a timestamp (you
may want to change something later, so you need to recognize earlier and later
agreements). Or better yet, save it on Confluence, it lets you version the 
documents. Wait, document versioning? Let me tell you an anecdote.

You know how I'm writing this piece? I'm doing Markup in a Notepad equivalent
on my local machine. I've created a branch with name related to this texts title
and I'm backing up my progress by commiting a simple text file.

Write the agreement down in a simple TXT file and commit it (to a backend repo,
frontend repo, dedicated documentation repo, whatever). It's even better if your
agreement is on an API - there are production-ready tools to define the API that
can later be also used in testing, API compliance validation, etc. To name a few,
Swagger a.k.a. OpenAPI ***TODO LINK*** and Spring ***<cant recall name, fix this***.

## How could that be prevented? -- continued

OK, so we can now assume that if something's agreed on then it is persisted and 
all the changes to it can be tracked. This covers most cases of loss of data (#1 
in Monday morning example) and mischief (e.g. someone changing the stuff on 
whiteboard over the weekend). It also allows for trackability (e.g. checking who
and when decided that the agreement should change; you should be able to decide 
whether a change was made in agreement between teams, or that someone decided that
something will be easier for him, no matter the rest of the team.

What's the next pitfall? A human mistake.

These can take 2 forms: something going unnoticed and someone working on wrong
assumptions. Let's do them in that order too.

### Unnoticed mistakes

Who's supposed to catch the mistakes of a code author?

Obviously, a code reviewer. 

We all make mistakes, that's what makes us human. We should expect that, and that's
why each team should do code review. Issue of an effective review is one that 
deserves separate article, thus here I'll focus on how to incorporate good
practices into already working code review process.

Now, assuming that you do code review - you've become a reviewer. What is the
actual ask here? "Check that this code is correct". Ugh, ambivalency... I hate
it, don't you? It's the one thing that makes programming hard.

What does it mean that the code is "correct"?

As far as I can see, there are 2 main interpretations:

a. The changes are aligned with "clear code" idea. In other words, that's a nice
  code of sorts.

b. The changes correctly implement the user requirements. In other words, product
  is improved from users perspective.

But now, who are you?

If you are business person (business analyst, a manager, etc) you can easily judge
against (b) option, but usually you won't be able to understand the code, the least **todo wat**
judge it's quality.

If you are a tech person, you may be able to judge both code quality and code
compliance to requirements. That requires a lot of expertise and usually gives
you a "senior" prefix in job title. "Mid" prefix means that while good at writing
the code you're good on judging either (a) and (b), but "junior" tends to mean
that you can write code that will be judged against both and usually fail one.

Of course these are all huge simplifications and stereotypes of sorts. They 
definitely do not describe the whole view accurately, but they are aligned with 
the major share (at least in my feeling) of our day-to-day work.

What I'm trying to say is that not many people can perform an appropriate code review.
Usually you need to review the code against quality and against compliance. The
first one should not focus on how the code is written, but rather on what it means.
**That's the point where "username" issue could have been avoided** too - if a
"business-perspective" reviewer had a chance to look at both codes on Friday, he 
would have caught the issue (one of the codebases not aligned to the agreement)
before it impacted anyone, not going anywhere near the end users (button that 
works poorly is better than no button, but no button is better than button that
doesn't work at all). 

### Wrong assumptions

This issue is tad harder and I'm gonna assume that we've already fixed unnoticed
mistakes In this chapter we'll tackle the issue of code going for a "business" 
review that will be negative. In other words, since we've made (reasonably) sure(ish)
that if someone makes a mistake about the agreement then it will be caught during 
the review. 

...
