# Tell me what you think about a language feature and I'll tell you who you are

So, lately I was thinking that I really like the Java approach to adding new
language features. By "language features" I mean stuff that would not compile
in previous version of language (so lambdas, but not Collection API).

> Why?

Great, I hoped you'd ask. Let's imagine that you need to decide whether a 
language feature should make it into some release. That is what JEP process and
friends boil down to. How do you judge a thing like this?

To put it broadly, a feature deserves to go into a release if it brings enough 
**value** to the **users** of the language. We'll look into what it can mean by 
focusing on highlighted words. **todo unnecessry sentence, I think**

> What is value?

As far as I can see, there are 2 kinds of **users** of the language (well actually, 
3 kinds, but we'll get there), which we'll look into, one by one. 
I'd also define **value** as some kind of measure of positive impact something 
has on your job. Negative value would mean that something makes your day worse.
Some things may impact different aspects of your job in different ways and its 
value is a product of sorts of "single" impact measures (e.g. something makes
doing stuff faster, but allows for many more mistakes; if you work mainly in 
prototypes the product will probably be positive, but if you do maintenance,
this will have negative value for you). 

> What kind of users do we have for a programming language (and its features)?

Effectively, there is only one kind of user - a lazy one. We want things to go
smoothly. Still, this is too broad a definition **todo you sure 'a'?**, so let's
break it down.

Well, there are front row users - developers. What do developers care about? I 
would argue that it is the ease of use. If you're a developer, programming is 
your core task. Along this line, time spent using the language of choice is core 
time of your job. If you spend that time stuggling with the tool, you'll 
eventually go nuts, unless you get over [escalation of commitment](https://en.wikipedia.org/wiki/Escalation_of_commitment)
and switch the tool to more you-friendly. What follows is that after enough 
iterations you'll end up with the tool that is close enough both market 
expectations (or you won't find job) and your personal taste aka what pisses
you off (or you won't want to do the job).

The other kind of users are consumers of developers' work. That sounds scary, so
to list some examples and their perspectives:

- end users, who care that the stuff runs at all; they want their Uber to be there
  when they click the button; bugs is what reduces value for them; the thing that
  gives value is the idea and the way it was communicated to them (aka UX), but
  even the most market-aligned apps value is small if it doesn't work properly;
- operations people, who run programs and make sure they keep running; the more 
  crashes there are, the more work they have; stability brings value and bugs
  reduce it;
- admins, who keep the machines running; if the machines run stuff that breaks
  them (is too resource consuming, it unstable, is poorly-written, e.g. pollutes
  filesystem to the limits of capacity, etc) then value of aforementioned stuff
  if decreasing with the amount of effort they need to put;
- business people, who has a very measurable value - money; in their case, value
  of anything is drastically reduced when any other branches value is reduced;
  if users are unhappy, there are no profits; if tech (operations/admins) people
  lose value, then users will probably not be happy.

> Ummm... OK, but what is the common element here?

The feature in question is a common element. To measure it, I would take the 
effect of developers work (lets call it "app"; it may be the mobile app you use,
the docker image you spawn in your cloud, the JAR you execute on your VM, whatever
your perspective is). Now, measure the value of the app (in your own terms and from
your own perspective) running with the feature and without it. If you're a user,
you may notice the difference in speed, quality of service, etc; if you're in 
tech you wanna look at stability and quality (as in bug-freeness) of the app; if
you're in business domain, you can just check your account. The change you notice
is what I call a value of the feature.

That leads us to a simple conclusion: the higher stability ("doesn't crash") **and**
efficiency ("eats less RAM", "Uber is confirmed earlier"), the higher the value.
Highlighted **and** isn't a formal logic conjunction - "business stability" 
(meaning less bugs that make you loose money) is the most important, because
you won't have a job (or a solution to your problem, if you're an user **todo I always say "a user"**) at all
without it. Priorities when it comes to resource requirements (which grow a lot
if you need to scale the app to keep up with non-business crashes) and efficiency
("how fast do you get the results" - "how fast do I get the notification?", "how 
quickly is HTTP request handled?", "how much RAM does it eat?") may differ
according to your business - Uber can't allow for a request to be processed for 
25 minutes, because you'll just get a taxi instead; if you're doing machine 
learning you will probably prefer that your code runs for 101 hours and finishes
without crashes over running it for *only* 100 hours and risking crash that would
require you to repeat everything anew **todo anew?**.

> I think I got the gist, but I think that you were talking about Java?

WIP

> note: http://openjdk.java.net/jeps/394


> TODO at the end show a product owner perspective, which should be very much
> parallel to JEP participants
