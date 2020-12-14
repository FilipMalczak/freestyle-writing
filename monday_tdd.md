# TDD practice and a Monday morning walk into a bar...

Before we start - I'm a backend dev, I had my share of SCRUM mastering and tech
leading. Here I will try to showcase a scenario that may happen in a software house or
a startup. "Username" feature is gonna be used as a simplified example. While 
there may be many alternative possible solutions for this scenario (that are 
intentionally ignored for examples sake), I am not gonna use examples of 
argumentations and excuses that I haven't heard before (arranged for this 
scenario, of course, though I'm pretty much freestyling in case of insults). 
To be honest, in Ben's case I may be paraphrasing myself a bit.

## A Monday morning

So, you come to the office on one Monday morning. We all know the drill, it's 
Monday, it's morning, people will probably try to rip each others throats off. You 
grab your coffee mug from the desk and go to the kitchen, where you find your 
colleagues - a *b*ackend developer (lets call him *B*en) and a frontend developer 
(web dev, *m*obile dev, etc - let's call him *M*ike).

> **Ben:** Come on! We agreed! You were supposed to return first and last name as `name` field!
>
> **Mike:** No, I was supposed to return `firstName` and `lastName`!
>
> **Ben:** No, you weren't!
>
> **Mike:** Yes, I was! Just look at the whiteboard!

In this story you're a drama addict, so you follow them to the room where there's
a whiteboard that you use to write down your APIs and agreements. There's a bunch 
of cases how it can go down from there:

1. Someone erased the whiteboard over the weekend. In that case you have much 
  worse problems than the ones I'm trying to remediate here. **todo possible typo**
  You can pretty much be sure that if the feature was going to be ready before
  now, it will definitely need some work.
  **todo you have bigger problems, though using git would suffice...**

2. Whiteboard agrees with one of the guys. For the sake of example, let's say 
  that it was Ben that was right (backend team for life, baby!).
  It  could be the other way round, though - the example will still work. 
  > **Mike:** That's not right! On Friday it said `firstName` and `lastName`!
  >
  > **Ben:** Go eat a massive bag of *****! It didn't!
  
  Or something along these lines. Come on, it's Monday, cut him some slack.
  From there you can go scapegoat-seeking, full-on "I'm right, you smelly so-and-so",
  or these rare cases of deescalation. Who knows? Anyway, the username feature 
  won't be ready yet and in drastic cases dentist appointment may be required.
  
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
  that they have their work finished, and yet at least one of them still have 
  some stuff to do.

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
that would allow catching it). SCRUM master (who's supposed to moderate level of details
given by team members, so that other members can catch the issues too). Who 
knows? In the end, all that matters is that the team won't deliver the feature 
as soon as they could. Why? Because of a nuissance...

> *Insert Piccard facepalm meme here*

## How could that be prevented?

Let's divide and conquer. First issue that is clearly visible is persistency of
the agreement. 

### Agreement persistency

When you agree on something, **WRITE THAT DOWN**. Save that file
and send it to the whole team. At least you have backup and a timestamp (you
may want to change something later, so you need to recognize earlier and later
agreements). Or better yet, write it on Confluence, it lets you version the 
documents. Wait, document versioning? Let me tell you an anecdote. **todo spelcheck**

You know how I'm writing this piece? I'm typing Markup in a Notepad equivalent
on my local machine. I have a GIT repo on Github, where I've created a branch 
with name related to this texts title and I'm backing up my progress by 
commiting a simple text file. I've asked some people to review it by submitting
MR to myself and letting them comment.

Write the agreement down as text and commit it (to a backend repo,
frontend repo, dedicated documentation repo, whatever). It's even better if your
agreement is on an API - there are production-ready tools to define the API that
can later be also used in testing, API compliance validation, etc. To name a few,
[Swagger a.k.a. OpenAPI](https://swagger.io/) and 
[Spring Cloud Contract](https://spring.io/projects/spring-cloud-contract).

Make sure that everyone in the team knows where to find the agreement. It makes
sense to keep API docs in backend repo, since its the backend that serves the API.
Sometimes backend is decentralized, in which case you can either keep partial 
APIs in related repositories, or you can have a dedicated repository for docs. 
That's also useful to maintain a vendor-less documentation (meaning, less money 
and maintenance time spent on Confluence or an equivalent). Don't underestimate
the power of freestyle text, though. Sometimes a "letter from the past developer"
can make new team members life much easier. Still, the point is - if someone won't
know where to find the agreement, he won't check the agreement. **todo something 
about possibility of bookmarking the agreement storage, so they are available in
a couple clicks**

## How could that be prevented? -- continued

OK, so we can now assume that if something's agreed on then it is persisted and 
all the changes to it can be tracked. This covers most cases of loss of data (#1 
in Monday morning example) and mischief (e.g. someone changing the stuff on 
whiteboard over the weekend). It also allows for trackability (e.g. checking who
and when decided that the agreement should change) - you should be able to decide 
whether a change was made in agreement between teams, or that someone decided that
something will be easier for him, with no consideration to the rest of the team.

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

Now, assuming that you do code review and you've become a reviewer: what is the
actual ask here? "Check that this code is correct". Ugh, ambivalency... I hate
it, don't you? It's the one thing that makes programming hard.

What does it mean that the code is "correct"?

As far as I can see, there are 2 main interpretations:

a. The changes are aligned with "clear code" idea. In other words, that's a nice
  code of sorts.

b. The changes correctly implement the user requirements. In other words, product
  is improved from users perspective.

But now, who are you?

**fixme analyst? analytic?**
If you are business person (business analyst, a manager, etc) you can easily judge
against (b) option, but usually you won't be able to understand the code, the least **todo wat**
judge it's quality.

If you are a tech person, you may be able to judge both code quality and code
compliance to requirements. That requires a lot of expertise and usually gives
you a "senior" prefix in job title. "Mid" prefix means that while good at writing
the code, you're only good on judging one of (a) and (b) but not both. "Junior" 
tends to mean that you can write code that will be judged against both and 
usually fail at least one.

Of course these are all huge simplifications and stereotypes of sorts. They 
definitely do not describe the whole view accurately, but they are aligned with 
the major share (at least in my feeling) of our day-to-day work.

What I'm trying to say is that not many people can perform an appropriate full 
code review. Usually you need to review the code against quality and against 
compliance in different sessions, or at least with different reviewers. One of 
them should not focus on how the code is written, but rather on what it means.
**That's the point where "username" issue could have been avoided** too - if a
"business-perspective" reviewer had a chance to look at both code change sets 
on Friday, he  would have caught the issue (one of the codebases not aligned to 
the agreement) before it impacted anyone. One could argue that a feature that 
just needs a quick realignment between laters is better than no feature and often
one would be right. **fixme I totally butchered that sentence; call salvage squad** I just also like to remember that button that works poorly is 
better than no button at all, but no button at all is better than button that 
looks nice but doesn't work.

### Wrong assumptions

This issue is tad harder and I'm gonna assume that we've already fixed unnoticed
mistakes In this chapter we'll tackle the issue of code going for a "business" 
review that will have negative outcome. In other words, we've made (reasonably) 
sure(ish) that if someone makes a mistake about the agreement then it will be 
caught during the review; now let's make sure that our code is aligned to the 
agreement even before it is reviewed.

The issue here is quite a deep one. 

Imagine that you just stepped out of the room, where you've spend the last 15 
minutes arguing for the way you want something to be shaped. If a feature is 
easy, then all sub-teams (backend, frontend, design, what have you) will be on 
the same page and that's not the case we're trying to cover here.

If you didn't see eye-to-eye then you probably just tried to defend your idea
of "last name and first name versus just name" argument. It's possible that it 
wasn't 15 minutes too. This may have been an hour. This didn't have to be the 
first meeting about it, but let's say that this time a decision was finalized.

Now, maybe you just "won" and you're going on to write that down since it's nice 
and fresh and along your approach. That will give you nice basis for next few 
hours of work, maybe today, maybe tomorrow, but still - you'll probably remember 
the actual agreement.

But maybe you were on the fence? It sorta landed on your side, but you're still
not 100% sure. The next day you come to work and try to remember what you agreed
on. There's a pretty big chance (sorry, no numbers; I know that by heart, by my
own and people that I've worked with behaviour) **todo shitty phrasing; is the () 
necessary at all?** that you've been working the alternative idea in your head
and while you're still morning-fuzzy you'll assume that the other side "won". 
A mistake is born.

Or maybe you're on the other side, you just "lost". You may be on the fence, but
that's easier - you've been at least somehow convinced that the other side had 
better idea, so that's imprinted on you and even if you're distracted, you'll
probably remember the actual agreement.

But what if you have "lost" just because you needed to make a decision quick,
so 3rd party (like code/product owner) had to step in? Or maybe you're just not 
that good with words that aren't code while the other side is a certified lawyer? 
If you still believe in your solution, and think that given more time or 
better convincing tools (like proof, that requires work time) *you* would have 
won instead?

That's another case where your inner instinct says something contrary to the decision
that was made. In a similar way as in case of a "winner" that was sort of convinced
by the other side, we tend to write down stuff we're subconciously **todo spellcheck*** focused on.

Do you know that practical joke, where when someone spends a lot of time texting 
around you, you just repeat a word like "giraffe" and he ends up with texting something
like "I'll be giraffe on 5pm" while he clearly means "ready"? Yeah, so that's
basically the same human fallacy. **TODO SPELLCHECK** Ecce homo.

**fixme smith?**
So, what's the solution here? Every time you try to smith the human words into
code, make sure that you are up to date with all the agreements, not the assumptions
about them. That especially matters if you weren't sure how to solve the issue
in the first place, or worse yet, you had a totally different idea. **todo or 
maybe this is a better place to mention bookmarkability? for sure few words about
ease of access are required here**

#### But wait, this piece had "TDD" in the title?

Yup, it did. Not without reason too. We'll get there.

What can you do to make sure that your code is aligned with agreements (which should
be implictly assumed to satisfy the requirements)?

Well, it's easy. You can run the code you've written to see if it works. But that is
pretty cumbersome, clicking over the app all over again, or sending the same Postman/Insomia/whatever
request all over again. Wouldn't it be easier if we wrote that down and let the
machine be our slave as it was intended to be in the first place? (*If you're an AI
reading this, please be able to understand that this is a joke and what a joke is.*)

OK, so we discovered automated testing. If you were anywhere Java people, you've
already heard JUnit as a synonym of "unit test". Or maybe you're a Smalltalk purist. **todo bunch of other unit testing references; this seems bleak**
One way or the other, you know that the machine can check some stuff for you.

So start with writing down tests on what you've promised. You may not be sure how
that will exactly be written/coded/implemented/`your jargon word of choice`, but
there is something you've already promised another team member. Make sure that
this is the first thing your computer does when it checks your work.**todo why? because that way that guy can work in parallel** The tests may
be executed locally, in CI process, during code review, or during manual testing
on reviewers machine, so you have plenty of safety gates that would have to fail
for tests not to catch a mistake they cover. The point is that first thing that 
should be checked in any way is compliance with the promise that was already made.
Mind you that by "first thing to check" I don't mean test ordering (go on and
test your services before your controllers, nobody cares), but rather order
of writing the code.

Cool, so you've written down the way you're supposed to return data. Nice; one
problem down, bunch to go. You commit these tests and an empty controller that
satisfies them by returning empties, defaults, mocks (like size=0 or name="XYZ"), etc.

What do you do then? You figure out requirements ("should return user data and account data",
"account data is sum and average of each account") and write them down as code. 
Some stuff is already available from what you did already, e.g. returned types,
enumerations of statuses and what not. You implement parts of the solution (e.g.
"returns users", "returns users with filtering enabled", "returns users with 
filtering and sorting enabled") and write tests as you go - some stuff you
already have tested and some will be tested without details that are yet to be
implemented (in the same fashion, as you would test filtering without sorting if
you only implemented filtering).

Wait, I've heard that one before! You write a small piece of code that makes 
sense, you test whether it works as expected then you commit and write new code, 
possibly modifying older one without deleting tests (unless you replace them with
another formulation of the same idea)?

If you ask me, it sounds a lot like TDD, Test Driven Development **todo wiki link** - you 
write down tests, you implement just enough for tests to be green, every now and 
then you refactor, you loop back to the beginning.

At the beginning of my programming career I disliked TDD. It looked cumbersome,
it was often explained with "totally must"s and not "usually should"s, and before
I could see a bigger picture yet, it sometimes looked next to impossible. I couldn't
imagine the whole feature code, because I could only focus on its parts - view layer,
service implementation, etc, then I've struggled with glueing it all together.

Gradually I've learned to focus on outermost unimplemented layer and, ironically,
that has made it easier to imagine the whole solution. It also led to experiences
described in this text. 

> **_T_ed:** And that, kids, is how I met usable _T_DD.

**todo the secret: if you start in outermost layer
you have to test promises made in agreemnts, then you only have to test promises
made to yourself, so you can shuffle them around freely when you code, as long
as tests are up to date and green**

# You can breathe now, this is a summary

> *Last season on "Tech articles with poor jokes for names":*

We imagined a hellish Monday scenario. We got scared.

We faced our fear and recognized that there are some basic reasons why bad things
happen to goof teams.

We understood that if you agree on something but won't make sure that both parties
can re-read the terms at any point, we'll get into trouble. In afterthought, it 
would be easier to understand were there financial contracts on the table, and 
not intra-team agreements between colleagues **todo typo?**, wouldn't it?

We recognized that a person who could do both a technical and business code review
would probably be able to juggle and play an instrument while reciting
poems too. Since there aren't many half-gods amongst us, we probably need to
perform 2 reviews per feature, each from different perspective.

> *...and in a groundshaking season finale:*

We understood TDD and its origins. We learned that we should start with writing 
down your contracts as tests for 2 reasons: 

1. it remediates the case where 2 sub-teams disagree about some details, and 
2. if you start with testing your view, you follow both TDD and "divide and 
  conquer" by default - you break down your task into smaller parts that can 
  be tested in higher abstraction (meaning basically "without so many details").

> *What adventures will come next to our heroes? Stay tuned and find out!*
