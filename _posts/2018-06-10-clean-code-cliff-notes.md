---
layout: post
title:  "Clean Code - Cliff Notes"
date:   2018-05-02 12:00:00 +0530
---
# Cliff notes from Robert C Martin's Clean Code

## Chapter 0: Introduction


* There are two parts to learning craftsmanship: knowledge and work. You must gain the knowledge of principles, patterns, practices, and heuristics that a craftsman knows, and you must also grind that knowledge into your fingers, eyes, and gut by working hard and practicing.


* Learning to write clean code is hard work. It requires more than just the knowledge of principles and patterns. You must sweat over it. You must practice it yourself, and watch yourself fail. You must watch others practice it and fail. You must see them stumble and retrace their steps. You must see them agonize over decisions and see the price they pay for making those decisions the wrong way.

## Chapter 1: Clean Code

* Code represents the details of the requirements. At some level those details cannot be ignored or abstracted; they have to be specified. And specifying requirements in such detail that a machine can execute them is programming. Such a specification is code.


* Bad code tempts the mess to grow

* Leave the campground cleaner than you found it


## Chapter 2: Meaningful names

* The name of a variable, function, or class, should answer all the big questions. It should tell you why it exists, what it does, and how it is used.

* Programmers must avoid leaving false clues that obscure the meaning of code.

* Noise words are redundant. The word variable should never appear in a variable name. The word table should never appear in a table name

* Make your names pronounceable

* If you can’t pronounce it, you can’t discuss it without sounding like an idiot. “Well, over here on the bee cee arr three cee enn tee we have a pee ess zee kyew int, see?” This matters because programming is a social activity.

* You also don’t need to prefix member variables with m_ anymore.

* I prefer to leave interfaces unadorned. The preceding I, so common in today’s legacy wads, is a distraction at best and too much information at worst.

* Certainly a loop counter may be named i or j or k (though never l!) if its scope is very small and no other names can con- flict with it. This is because those single-letter names for loop counters are traditional. However, in most other contexts a single-letter name is a poor choice; it’s just a place holder that the reader must mentally map to the actual concept.

* If names are too clever, they will be memorable only to people who share the author’s sense of humor, and only as long as these people remember the joke.

* Avoid using the same word for two purposes. Using the same term for two different ideas is essentially a pun.

* Remember that the people who read your code will be programmers. So go ahead and use computer science (CS) terms, algorithm names, pattern names, math terms, and so forth. It is not wise to draw every name from the problem domain because we don’t want our coworkers to have to run back and forth to the customer asking what every name means when they already know the concept by a different name.

* In an imaginary application called “Gas Station Deluxe,” it is a bad idea to prefix every class with GSD. Frankly, you are working against your tools. You type G and press the com- pletion key and are rewarded with a mile-long list of every class in the system. Is that wise? Why make it hard for the IDE to help you?


## Chapter 3: Functions

* The first rule of functions is that they should be small. The second rule of functions is that they should be smaller than that.

* This implies that the blocks within if statements, else statements, while statements, and so on should be one line long. Probably that line should be a function call. Not only does this keep the enclosing function small, but it also adds documentary value because the function called within the block can have a nicely descriptive name.

* FUNCTIONS SHOULD DO ONE THING. THEY SHOULD DO IT WELL. THEY SHOULD DO IT ONLY.

* We want the code to read like a top-down narrative.5 We want every function to be fol- lowed by those at the next level of abstraction so that we can read the program, descending one level of abstraction at a time as we read down the list of functions. I call this The Step- down Rule.

* My general rule for switch statements is that they can be tolerated if they appear only once, are used to create polymorphic objects, and are hidden behind an inheritance

* Don’t be afraid to make a name long. A long descriptive name is better than a short enigmatic name. A long descriptive name is better than a long descriptive comment. Use a naming convention that allows multiple words to be easily read in the function names, and then make use of those multiple words to give the function a name that says what it does.

* Don’t be afraid to spend time choosing a name. Indeed, you should try several differ- ent names and read the code with each in place. Modern IDEs like Eclipse or IntelliJ make it trivial to change names. Use one of those IDEs and experiment with different names until you find one that is as descriptive as you can make it.

* The ideal number of arguments for a function is zero (niladic). Next comes one (monadic), followed closely by two (dyadic). Three arguments (triadic) should be avoided where possible. More than three (polyadic) requires very special justification—and then shouldn’t be used anyway.

* There are two very common reasons to pass a single argument into a function. You may be asking a question about that argument, as in boolean fileExists(“MyFile”). Or you may be operating on that argument, transforming it into something else and returning it. For example, InputStream fileOpen(“MyFile”) transforms a file name String into an InputStream return value. These two uses are what readers expect when they see a func- tion.

* A somewhat less common, but still very useful form for a single argument function, is an event. In this form there is an input argument but no output argument. The overall program is meant to interpret the function call as an event and use the argument to alter the state of the system

* Using an output argument instead of a return value for a transformation is confusing. If a function is going to transform its input argument, the transformation should appear as the return value.

* Flag arguments are ugly. Passing a boolean into a function is a truly terrible practice. It immediately complicates the signature of the method, loudly proclaiming that this function does more than one thing. It does one thing if the flag is true and another if the flag is false!

* A function with two arguments is harder to understand than a monadic function. For exam- ple, writeField(name) is easier to understand than writeField(output-Stream, name).10 Though the meaning of both is clear, the first glides past the eye, easily depositing its meaning.

* There are times, of course, where two arguments are appropriate. For example, Point p = new Point(0,0); is perfectly reasonable.

* Functions that take three arguments are significantly harder to understand than dyads.

* So all the same rules apply. Functions that take variable arguments can be monads, dyads, or even triads. But it would be a mistake to give them more arguments than that.

* Side effects are lies. Your function promises to do one thing, but it also does other hidden things.

* Anything that forces you to check the function signature is equivalent to a double-take. It’s a cognitive break and should be avoided.

* Functions should either do something or answer something, but not both. Either your function should change the state of an object, or it should return some information about that object. Doing both often leads to confusion.

* Returning error codes from command functions is a subtle violation of command query separation. It promotes commands being used as expressions in the predicates of if state- ments.

* On the other hand, if you use exceptions instead of returned error codes, then the error processing code can be separated from the happy path code and can be simplified:

* Try/catch blocks are ugly in their own right. They confuse the structure of the code and mix error processing with normal processing. So it is better to extract the bodies of the try and catch blocks out into functions of their own.

* Functions should do one thing. Error handing is one thing. Thus, a function that handles errors should do nothing else.

* So if you keep your functions small, then the occasional multiple return, break, or continue statement does no harm and can sometimes even be more expressive than the sin- gle-entry, single-exit rule. On the other hand, goto only makes sense in large functions, so it should be avoided.

## Chapter 4: Comments
* The proper use of comments is to compensate for our failure to express ourself in code. 

* Truth can only be found in one place: the code. Only the code can truly tell you what it does. It is the only source of truly accurate information. Therefore, though comments are sometimes necessary, we will expend significant energy to minimize them.

* Sometimes it is useful to warn other pro- grammers about certain consequences

* It is sometimes reasonable to leave “To do” notes in the form of //TODO comments. In the following case, the TODO comment explains why the function has a degenerate implementa- tion and what that function’s future should be.

* It is just plain silly to have a rule that says that every function must have a javadoc, or every variable must have a comment. Comments like this just clutter up the code, propa- gate lies, and lend to general confusion and disorganization.

## Chapter 5: Formatting
* Concepts that are closely related should be kept vertically close to each other

* Variables should be declared as close to their usage as possi- ble. Because our functions are very short, local variables should appear a the top of each function

* Instance variables, on the other hand, should be declared at the top of the class.

* Everybody should know where to go to see the declarations.

* Dependent Functions. If one function calls another, they should be vertically close, and the caller should be above the callee, if at all possible.

* Certain bits of code want to be near other bits. They have a certain conceptual affinity. The stronger that affinity, the less vertical distance there should be between them.

* In general we want function call dependencies to point in the downward direction. That is, a function that is called should be below a function that does the calling.2 This creates a nice flow down the source code module from high level to low level.

* We should strive to keep our lines short. The old Hollerith limit of 80 is a bit arbitrary, and I’m not opposed to lines edging out to 100 or even 120. But beyond that is probably just careless.

* Breaking Indentation. It is sometimes tempting to break the indentation rule for short if statements, short while loops, or short functions. Whenever I have succumbed to this temptation, I have almost always gone back and put the indentation back in.

## Chapter 6: Objects and Data Structures

* Objects hide their data behind abstractions and expose functions that operate on that data. Data struc- ture expose their data and have no meaningful functions.

* There is a well-known heuristic called the Law of Demeter2 that says a module should not know about the innards of the objects it manipulates.

* Chains of calls like this are generally considered to be sloppy style and should be avoided

* Hybrids (entities that act as both objects and data structures) make it hard to add new functions but also make it hard to add new data structures. They are the worst of both worlds. Avoid creating them.

* The quintessential form of a data structure is a class with public variables and no functions. This is sometimes called a data transfer object, or DTO

* Active Records are special forms of DTOs

* Unfortunately we often find that developers try to treat Active Record based DTO data structures as though they were objects by putting business rule methods in them. This is awkward because it creates a hybrid between a data structure and an object.

## Chapter 7: Error handling
* Use Exceptions Rather Than Return Codes

* Write Your Try-Catch-Finally Statement First

* Use Unchecked Exceptions

* Provide Context with Exceptions

* Define Exception Classes in Terms of a Caller’s Needs

* SPECIAL CASE PATTERN [Fowler]. You create a class or configure an object so that it handles a special case for you. When you do, the client code doesn’t have to deal with exceptional behavior. That behavior is encapsulated in the special case object.

* Don’t Return Null

* Don’t Pass Null

## Chapter 8: Boundaries
* Learning the third-party code is hard. Integrating the third-party code is hard too. Doing both at the same time is doubly hard. What if we took a different approach? Instead of experimenting and trying out the new stuff in our production code, we could write some tests to explore our understanding of the third-party code. Jim Newkirk calls such tests learning tests.1

* The learning tests end up costing nothing. We had to learn the API anyway, and writing those tests was an easy and isolated way to get that knowledge. The learning tests were precise experiments that helped increase our understanding.

* Not only are learning tests free, they have a positive return on investment. When there are new releases of the third-party package, we run the learning tests to see whether there are behavioral differences.

* Code at the boundaries needs clear separation and tests that define expectations. We should avoid letting too much of our code know about the third-party particulars. It’s better to depend on something you control than on something you don’t control, lest it end up controlling you.

## Chapter 9: Unit Tests

* First Law You may not write production code until you have written a failing unit test. Second Law You may not write more of a unit test than is sufficient to fail, and not com- piling is failing. Third Law You may not write more production code than is sufficient to pass the cur- rently failing test.

* Test code is just as important as production code. It is not a second-class citizen. It requires thought, design, and care. It must be kept as clean as production code.

* Readability is perhaps even more important in unit tests than it is in production code.

* Code within the testing API does have a different set of engineering standards than produc- tion code. It must still be simple, succinct, and expressive, but it need not be as efficient as production code. After all, it runs in a test environment, not a production environment, and those two environment have very different needs.

* The number of asserts in a test ought to be minimized.

* Perhaps a better rule is that we want to test a single concept in each test function.

* Tests should be fast.

* Tests should not depend on each other.

* Tests should be repeatable in any environment.

* The tests should have a boolean output. Either they pass or fail.

* Timely The tests need to be written in a timely fashion. Unit tests should be written just before the production code that makes them pass. If you write tests after the production code, then you may find the production code to be hard to test.

## Chapter 10: Classes

* The first rule of classes is that they should be small.

* Count responsibilities. There should be 1.

* The Single Responsibility Principle (SRP) states that a class or module should have one, and only one, reason to change.

* Classes should have a small number of instance variables. Each of the methods of a class should manipulate one or more of those variables.

* DIP says that our classes should depend upon abstractions, not on concrete details.

## Chapter 11: Systems
* First, consider that construction is a very different process from use.

* Software systems should separate the startup process, when the application objects are constructed and the dependencies are “wired” together, from the runtime logic that takes over after startup.

* True Dependency Injection goes one step further. The class takes no direct steps to resolve its dependencies; it is completely passive. Instead, it provides setter methods or constructor arguments (or both) that are used to inject the dependencies.

* If you can write your application’s domain logic using POJOs, decoupled from any architec- ture concerns at the code level, then it is possible to truly test drive your architecture. You can evolve it from simple to sophisticated, as needed, by adopting new technologies

* It is not necessary to do a Big Design Up Front18 (BDUF). In fact, BDUF is even harmful because it inhibits adapting to change, due to the psychological resistance to dis- carding prior effort and because of the way architecture choices influence subsequent thinking about the design.

* Standards make it easier to reuse ideas and components, recruit people with relevant expe- rience, encapsulate good ideas, and wire components together. However, the process of creating standards can sometimes take too long for industry to wait, and some standards lose touch with the real needs of the adopters they are intended to serve.

* A good DSL minimizes the “communication gap” between a domain concept and the code that implements it, just as agile practices optimize the communications within a team and with the project’s stakeholders.

* DSLs, when used effectively, raise the abstraction level above code idioms and design patterns. They allow the developer to reveal the intent of the code at the appropriate level of abstraction.

## Chapter 12: Emergence

* First and foremost, a design must produce a system that acts as intended. A system might have a perfect design on paper, but if there is no simple way to verify that the system actually works as intended, then all the paper effort is questionable.

* Once we have tests, we are empowered to keep our code and classes clean. We do this by incrementally refactoring the code. For each few lines of code we add, we pause and reflect on the new design. Did we just degrade it? If so, we clean it up and run our tests to demon- strate that we haven’t broken anything. The fact that we have these tests eliminates the fear that cleaning up the code will break it!

* You can also express yourself by using standard nomenclature. Design patterns, for example, are largely about communication and expressiveness. By using the standard pattern names, such as COMMAND or VISITOR, in the names of the classes that imple- ment those patterns, you can succinctly describe your design to other developers.

* Even concepts as fundamental as elimination of duplication, code expressiveness, and the SRP can be taken too far. In an effort to make our classes and methods small, we might create too many tiny classes and methods. So this rule suggests that we also keep our func- tion and class counts low.


## Chapter 13: Concurrency
* Recommendation: Keep your concurrency-related code separate from other code.6

## Chapter 14: Successive refinements

* One of the best ways to ruin a program is to make massive changes to its structure in the name of improvement. Some programs never recover from such “improvements.” The problem is that it’s very hard to get the program working the same way it worked before the “improvement.”

* To avoid this, I use the discipline of Test-Driven Development (TDD). One of the cen- tral doctrines of this approach is to keep the system running at all times. In other words, using TDD, I am not allowed to make a change to the system that breaks that system. Every change I make must keep the system working as it worked before.

