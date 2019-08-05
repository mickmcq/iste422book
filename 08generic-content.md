
# Generic code
@Dehnert2000 begin by saying that "Generic programming depends on the decomposition of programs into components which may be developed separately and combined arbitrarily, subject only to well-defined interfaces." They go on to say that there have been a variety of unsuccessful approaches to the concept of software reuse. They claim that "Generic programming offers an opportunity to achieve what these other approaches have not. It is based on the principle that software can be decomposed into components which make only minimal assumptions about other components, allowing maximum flexibility in composition."

These authors claim the C++ Standard Template Library (STL) as the first instance of generic programming in widespread use. They assert some underlying principles explaining the success of STL.

First among these principles is the use of built-in type operator syntax for user-defined types allows programmers to make user-defined types look like built-in types. Additional principles include the stipulation of a *regular type* that behaves like the built-in types, and definitions for some operations, including copy and equality, on regular types.

A more accessible introduction to generic programming can be found in @Lee2014. Here we find *generics* identified as any constructs (like the above-mentioned STL) that let programmers reuse classes, especially classes that act as maps and vectors. By maps, Lee means any data structure that allows arbitrary mapping of keys of any kind to values of any kind. Python calls these dictionaries. Java calls them hashmaps.
Lee refers to the STL as parameterized classes, where the parameters are types.
Lee goes on to say that "templates and generics are necessary in statically typed languages to support code re-use when it is impractical or impossible to do via an inheritance hierarchy. Java has an inheritance hierarchy for all classes because every class inherits from Object either directly or indirectly. C++ has no such hierarchy making templates all that more important. Without a built-in hierarchy of classes, generic classes like maps and sets would not be possible in C++ without templates."

# Data driven code

We are required by our course description to study a topic also reviewed in our *Database Applications Development* course. The following material is also used in that course.

## Background

Students in IST are expected to practice something that is locally called data-driven programming in projects. Examples of what is meant locally by data-driven programming are the Acute Otitis Media application and the Companion Radio application that are used as examples and platforms in some database courses.

Unfortunately, data-driven programming is a term used differently elsewhere. We need to look at different definitions of data-driven programming, not only to clarify what is meant locally but also to understand criticism of data-driven programming as it applies or does not apply to the local definition.

## How IST uses the term data-driven programming

To see how the term is used locally, it helps to look at the example applications that use it, the Acute Otitis Media application and the Companion Radio application. From these examples, we can deduce the utility and some limits to data-driven programming.

## The Acute Otitis Media application
This application is used by physicians in a clinic treating and conducting research on children with ear infections. The sense in which this is called data-driven is that there are new bacteria and drugs becoming available all the time. These bacteria and drugs must be selectable on menus available to physicians. Rather than update the application, the physicians want to be able to enter *application information*, such as the names of bacteria and drugs, that will populate the menus in the application.

## The Companion Radio application
This application provides automated disc jockey facilities to a radio station that must play music tracks and report copyright information to regulators. This application includes menus of categories of music and rules about playing music that the client would like to be able modify without programmer intervention. Like the Acute Otitis Media application, this application contains a facility to enter *application information* that determines the content of menus in the application.

## Why database applications support customer modification
The preceding examples suggest why the customers should be able to modify the applications.
For example, the applications are more immediately responsive to changes in the customer's environment. Any bottleneck represented by contact with the application developer is removed.

It also suggests some practices. For example, there are different classes of users. Some are only permitted to perform CRUD actions on business data. Others are permitted to perform CRUD actions on applications data governing the control of the application.

## Customer modification may lead to an inner-platform effect
The term inner-platform effect refers to the temptation to create a platform within the platform being used by the developer. It has only very rarely occurred in the history of computing that it was a good idea to create a new platform for a project. Generally, a platform created within another platform is underdeveloped.

The temptation to create an inner platform is strong, especially in database programming where the developer uses two primary tools arising from different paradigms. For example, database programming often pairs an object-oriented programming language and a relational database tool.
It is almost inevitable that a developer feels more strongly about one of these paradigms than the other and thinks more readily in one of these paradigms than the other. One question that is unsettled in my mind is whether the developer then reinvents the tool with which they are more familiar, perhaps to augment the less familiar tool, or reinvents the less familiar tool because they have less facility with it.

## To be continued
For now, I would like to join you in googling the term data-driven programming and explore the different meanings we encounter for the term.


[Data-driven-programming](http://en.wikipedia.org/wiki/Data-driven_programming)
defines it

[Data-driven programs](http://c2.com/cgi/wiki?DataDrivenPrograms)

[Little Language](http://c2.com/cgi/wiki?LittleLanguage)
discuss Jon Bentley's *Programming Pearls* books.

[TAOUP Chapter 9](http://www.catb.org/esr/writings/taoup/html/ch09s01.html)
Eric Raymond describes his development of `fetchmail` in data-driven terms.

[Stack Overflow discussion](http://stackoverflow.com/questions/1065584/what-is-data-driven-programming)
contains the most of the text in the lecture notes I inherited on this topic.

[Can a system be data-driven?](http://programmers.stackexchange.com/questions/231637/can-a-system-be-100-data-driven)

Is such a 100% Data Driven Application possible?

*This is where I just started. With my answer I'm trying to agree with the original post that: It is possible, but you're correct, it will just shift the problem one level higher for no \[obvious\] benefit.*


[Wikipedia on inner platform effect](http://en.wikipedia.org/wiki/Inner-platform_effect)

[Inner platform effect](http://thedailywtf.com/articles/The_Inner-Platform_Effect)

[Dynamic tables](http://www.thedailywtf.com/articles/dynamic-tables)

[Table-driven programming](http://www.paragoncorporation.com/ArticleDetail.aspx?ArticleID=31)
This article provides an example similar to an assignment in our *Application Development Practices* course and provides a database solution (called table-driven programming in the article) to the *refactoring* exercise from the *Application Development Practices* course.
