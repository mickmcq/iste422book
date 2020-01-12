
# Help systems

## User perspective on help
The user needs to be able to

- quickly identifying good sources
- recognize clues on youtube for good tutorials
- example: thumbnail shows application
- example: starts with an ad

## Identify a healthy support community
Some indicators of a healthy support community include

- recency of posts
- number of authors
- presence of tags
- number of views
- tactic is to go to the most popular
- amount of official support activity

## Developer perspective on help
Now consider help from the point of view of the developer. What must the developer think aobut?

- what is going wrong? what kind of help do you need?
- engage user in conversation---but user wants quick resolution
- quick turnaround on problems
- easy monitoring of software usage

## Example: Microsoft Watson initiative
Microsoft learned to use the Internet for feedback on MS Office crashes in the early 2000s. An initiative called Watson provided instant feedback, at the user's discretion. The figures show the difference between successful Office application sessions before and after the intiative.

\begin{figure}
\includegraphics[width=4in]{fiMSbefore.pdf}
\caption{microsoft before watson initiative}
\end{figure}

\begin{figure}
\includegraphics[width=4in]{fiMSafter.pdf}
\caption{microsoft after watson initiative}
\end{figure}

## Example: Google reply-all
How do you respond to outrage over a change of default from reply to reply-all? look at user behavior from the past; somehow evidence showed you that people meant to hit reply-all very often; google wants you to press as few buttons as possible; figure out what you really wanted to do; look at logs to see what people did next after they hit reply; discover that so many people then went back and hit reply-all, suggesting that should have been the default; arm yourself with graphs based on logs showing why you did it, as well as alternative strategies to deal with the user problem of hitting the unintended button

A quote from Henry Ford: *If I asked my customers what they wanted they would say a better horse and buggy.*
This quotation illustrates the need to do more than monitor users. It is necessary to analyze user behavior and needs in light of many aspects of the application experience that users may not know themselves.

## Help authoring tools
Wikipedia provides some unsourced guidance on help authoring tools. Wikipedia provides the following headings under functions of help authoring tools:

- file input
- help output
- auxiliary functions

### File input
How does help originate? You can write help in plain text, html, or in proprietary formats such as WinHelp. This text is often written by a professional tech writer whose job is to understand problems users experience and to provide help.

### Processing
This help can be provided in different forms and does not need to be provided in the form in which it was written. It can be encapsulated with the application for which it is helping, bundled with the application, or provided separately. The help authoring tool processes the input file and produces help in the form in which it will be viewed by the user.

### Output
Output of a help authoring tool can be a compiled file or noncompiled. It is possible to apply styles or other organizational paraphernalia to the help as written before converting it into the form in which it will be consumed.

### Auxiliary functions
Many software applications are available in different countries in different languages. Help authoring tools may provide assistance with translation, using XML tools to organize specific help by language. There may also be support for image editing, including support for image hotspot menus and document features such as indexes and tables of contents. Help authoring tools may also provide built-in spelling checkers with support for recognizing terms and abbreviations.

### Specific help authoring tools
You need to be skilled at identifying tools with healthy communities and prospects for support. You may start by looking at the help authoring tools listed on Wikipedia.

\begin{sloppypar}
\url{https://en.wikipedia.org/wiki/Help_authoring_tool}

\url{https://en.wikipedia.org/wiki/List_of_help_authoring_tools}

\url{https://en.wikipedia.org/wiki/Adobe_RoboHelp}
\end{sloppypar}

You will soon see that *Adobe RoboHelp* and *Madcap Flare* are market leaders, although with licenses costing in the neighborhood of 2,000USD, there must be alternatives. Further analysis will show that most of those with Native Windows versions have license fees in the neighborhood of 200USD. For your project in this course, you may want to try out an alternative that stores your files in the cloud. Some of these allow you one project with limited pages for free. Check out
[https://clickhelp.co](https://clickhelp.co) and
[https://proprofs.com](https://proprofs.com).
[https://readthedocs.io](https://readthedocs.io) is also a very popular site for online documentation for opensource projects.
