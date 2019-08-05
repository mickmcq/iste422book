\setlength{\emergencystretch}{2em}
\begin{center}

\hrulefill

\vskip48pt

\textsc{study guide}

\vskip6pt

\rule{220pt}{0.5pt}

\vskip12pt

{\large \textcolor{gray}{\it Application Development Practices}}

\vskip6pt

\rule{220pt}{0.5pt}

\vskip12pt

\textsc{fall 2019}

\vskip148pt


\textsc{michael m{\scriptsize c}quaid}

\vskip24pt

{\large \ding{46}}

\vskip18pt

\textcolor{lightgray}{\textsc{this revision produced \MakeLowercase{\today}}}

\vskip18pt

\hrulefill

\end{center}
\thispagestyle{empty}
\pagebreak

\phantom{0}

\vfill

\begin{center}
  This document is available at\linebreak
  \url{http://mickmcquaid.com/iste422.html}.
  
  \medskip

  The source of this document is available at\linebreak
  \url{http://github.com/mickmcq/iste422book}.

  \medskip

  This document was produced by \XeLaTeX,\linebreak
  using the \textit{fbb} font package.

  \medskip

  \includegraphics[width=3cm,height=1cm]{Cc-by-nc-sa_icon.pdf}

\noindent
This content is licensed under CC-BY-NC-SA\linebreak
For more information, see\linebreak
\url{https://wiki.creativecommons.org/wiki/License_Versions}\linebreak
or\linebreak
\url{https://en.wikipedia.org/wiki/Creative_Commons_license}

\medskip

\noindent
\textcopyright \the\year, Michael J McQuaid
\end{center}

\thispagestyle{empty}
\pagebreak

\tableofcontents


# Introduction

Note that, if you must print this document, you should use Adobe Acrobat's
option to print in *booklet* format, two pages to a sheet. Other pdf software
may use the term *booklet* or something else. You should really look for it
for best results. If you merely print two to a sheet without a *booklet*
option, you may get small page images with large borders. If you print one page to an 8.5 $\times$ 11 sheet or A4 sheet, you will get a greatly magnified version (extremely large type). That may not be what you want unless you have very poor eyesight and a lot of extra paper.

On 26 January 2015, I read a story on *Hacker News* about IBM laying off a quarter of its workforce---the largest layoff in history. One reason given in two articles about the layoffs is that IBM has not transitioned to the cloud. Our discussion of the Chaos Report on the first day needs to acknowledge that software development as practiced by Google, Amazon, and other major cloud players can not be practiced by many customer-ignorant failures that litter IT history. Google and Amazon can monitor every bit of every customer's use of their software. They can update and improve anything and everything without customer interaction. There are obvious limitations if the improvements change behavior depended on by customers, as well as limitations from conflicting customer needs.

At the same time, I will report an anecdote of a leading firm in the RFID industry that recently abandoned the cloud and took its operations back in house. My discussion with their CIO convinced me that their problem was that the cloud contract, which was for two years, was written on terms that were unfavorable to them. Worse,  they could not anticipate the manner in which the terms were unfavorable. Their cloud vendor did not find it profitable to improve service to the level needed so they parted company at the conclusion of the contract.

## It is easier to write than to read
One of the most interesting assertions I have ever read to motivate the study of application development practices is the above claim. Joel Spolsky popularized the claim that *it is easier to write than to read*. Spolsky is among the most loquacious of all successful software developers and is partly responsible for *Stack Overflow*, *Trello*, and more. He used to write prolifically at *JoelOnSoftware* but the pace has slowed in recent years. Some of the popular posts have been collected into four accessible books but no single sentence of Spolsky's deserves more attention than the above brief dictum.

Why do I say this is so important? Consider this. If we measure software development by time and money, it is commonly asserted that maintenance represents half of all software effort. Maintenance necessarily requires reading, either unreadable code written by someone else or even unreadable code you wrote. If you don't believe your code is unreadable, take a look at anything you wrote more than a year ago. If that doesn't convince you, you may be in denial.

Time expended reading and trying to understand drives up the time programmers have to spend to conduct maintenance activities as opposed to new development activities. Obstacles to reading include
practices in forming variable names,
approaches to modularizing,
deciphering thought processes,
differences stemming from writer's experience level,
and commenting and its absence.
These issues will hover around many of the topics we will cover in this course.

## Chaos Report

The first thing I notice about the *Chaos Report* is that it is twenty years old. The second thing I notice is that the issues in the lists on pages 4, 5, and 8 would be similar today, twenty years later.

The introductory quote, from the novel *The Sum of All Fears*, seems to be taken out of context. I looked it up and found that the character who utters this is making the point that the Roman bridges are over-engineered and some of them are still standing to this day. He goes on to say that you have to over-engineer if you don't have the opportunity to test. He says that refinements like using less stone and less labor can come only from practice.

## Chaos Report survey results

More companies reported *cost* overruns of 21 to 50 percent than any other category. Taken together, cost overruns of 21 to 100 percent accounted for about two-thirds of the studied projects.

More companies reported *time* overruns of 101 to 200 percent than any other category. Taken together, time overruns of 51 to 200 percent accounted for two-thirds of the studied projects.

The top success factors reported were
user involvement,
executive management support,
proper planning,
clear statement of requirements, and
realistic expectations.

The top *challenged* factors reported were
lack of user input,
incomplete requirements and specs,
changing requirements and specs,
lack of executive support, and
technology incompetence.

The top *impaired* factors reported were
incomplete requirements,
lack of user involvement,
lack of resources,
unrealistic expectations, and
lack of executive support.

The top case study success factors reported were
user involvement,
executive management support,
clear statement of requirements,
proper planning, and
realistic expectations.

## Technical debt
Another way to look at problems involves the concept of *technical debt*.
A prominent software author named Martin Fowler defines technical debt as the cost of additional work required later by choosing shortcuts in the near term.

Fowler categorizes this idea into categories: reckless versus prudent technical debt, and deliberate versus inadvertent technical debt. The technical debt quadrant that he stipulates as the result of these possibilities is characterized in Figure \ref{techDebtQuadrant}.

\begin{figure}[htbp]
\begin{center}
      \includegraphics[width=8cm,height=5cm]{fitechDebtQuadrant.png}
\end{center}
\caption{the technical debt quadrants}\label{techDebtQuadrant}
\end{figure}

## The classroom

This course is meant to change how you think about application development so you will get nothing at all out of it if you don't show up.
This course is meant to support you improving your personal practice so you will get nothing at all out of it if you don't listen to what other people say.
You don't know what kinds of projects you'll work on---you must share your experiences and respect the experiences shared with you!

*I will make it difficult for people who miss too many classes to obtain a passing grade.* Please remember the preceding sentence and don't try to negotiate your way out of it. Simply attend so that you are not put in the uncomfortable position of trying to negotiate your way out of it. Also bear in mind that if you are absent and it is not your fault, you are still absent. You simply need to attend to pass. If you can not pass because of reasons beyond your control, that does not mean that you will receive a passing grade. You must actually master the material to pass. The best you can hope for if you do not attend is to withdraw before the deadline. Although you will receive some slack (and don't ask me how much), don't use it lightly. If you are absent a few times because you think it won't matter, then suddenly find yourself in an emergency that forces you to be absent further, you may regret the absences you took that you did not need.

# Baseline setting

Everyone follows a different path to this stage in education, complicating the problem of setting baseline expectations. I drew a task from a *Hacker News* challenge that should exercise some skills you should be able to bring to bear on daily tasks. To prepare for the exercise, we will familiarize ourselves with the software listed in the appendix. Although there are many tools replicating the capabilities of the tools we'll use, these have been chosen to cover most of the basic concepts.

Please do not ask to use different software for this exercise. I have permitted this in the past with dismal consequences. There will be plenty of opportunities to use the other tools you prefer later.

## Text editor

We'll use Vim, which is popular among software developers and contains the features needed for the exercise. We'll use tutorials to learn Vim, but we need to review a few general ideas here.

First, consider that when this editor was developed, computers were slow and displays had just entered common use. Most of the editing tools that existed already were editors such as `ed`, the editor, and `ex`, the extended editor, that were designed to help programmers work at what were called *hard copy terminals*. These were essentially printers connected to keyboards. The programmer had to have a very clear mental picture of what was going on because there were almost no visual aids. Imagine typing your program into a computer where you have no display at all. It should sound like a painful activity requiring a lot of concentration and the construction and maintenance of a clear mental picture.

It may seem counterintuitive to use tools designed for such a primitive environment. The purpose is, in part, to encourage you to form a mental picture but there is more to it than that. We'll discuss some of these issues later but for now, you should understand the concept of the editor functioning in a highly constrained environment where the programmer's mind is supplying quite a bit of what would today be supplied by graphical supports.

\begin{figure}[htbp]
\begin{center}
\tikzstyle{background rectangle}=[rounded corners,fill=yellow!05]
\definecolor{cmdcolor}{rgb}{0.0,0.90,0.05} 
\definecolor{insertcolor}{rgb}{1.0,0.7,0.1} 
\definecolor{excolor}{rgb}{0.3,0.4,0.5} 
\definecolor{arrowcolor}{rgb}{0.7,0.8,0.9} 
\begin{tikzpicture}[show background rectangle] 
\node (p) at (0,2.5)
  [shape=ellipse,draw=none,fill=cmdcolor,text=white,scale=0.85]
  {\sf command};
\node (pa) at (-1.5,3.2)
  [shape=rectangle,draw=none,fill=cmdcolor!60,text=white,text width=4cm,scale=0.5]
  {\sf vim behaves like a control panel};
\node (d) at (4,3)
  [shape=ellipse,draw=none,fill=insertcolor,text=white,scale=0.85]
  {\sf insert};
\node (da) at (4.7,4.3)
  [shape=rectangle,draw=none,fill=insertcolor!60,text=white,text
  width=4cm,scale=0.5]
  {\sf vim behaves like a typewriter};
\node (e) at (-0.75,0)
  [shape=ellipse,draw=none,fill=excolor,text=white,scale=0.85]
  {\sf ex};
\node (ea) at (1.05,-0.8)
  [shape=rectangle,draw=none,fill=excolor!60,text=white,text
  width=5cm,scale=0.5]
  {\sf vim behaves like a hard copy terminal};
  \draw [->,very thick,arrowcolor] (d) to [bend right=45] (p);
  \draw [->,very thick,arrowcolor] (p) to [bend right=45] (e);
  \draw [->,very thick,arrowcolor] (p) to [bend right=45] (d);
  \draw [->,very thick,arrowcolor] (e) to [bend right=45] (p);
  \node (itoc) at (2,3.5) {\sf \small esc};
  \node (ctoi) at (2.1,2.2) {\sf \small i,I,a,A,o,O};
  \node (etoc) at (0.6,1.0) {\sf \small esc,Enter};
  \node (ctoe) at (-1.3,1.2) {\sf \small :};
\end{tikzpicture} 
\end{center}
\caption{vim modes}\label{fiVimModes}
\end{figure}

Figure \ref{fiVimModes} shows the three basic Vim modes. Several programming editors have the concept of modes, so that each key can perform multiple functions depending on which mode is currently active.

## Command mode
This is the mode you should usually use to navigate program files. You should only emerge from this mode to type text or enter an ex command. In this mode Vim resembles a control panel, with each key executing a command. You can always reach command mode by pressing escape if you are in one of the other modes.

## Insert mode
When you want to type some code into a file, switch to insert mode. The command you use to do so depends on where your cursor is relative to where you want to enter text. The most common commands to enter insert mode are

- i, insert before the cursor position
- I, insert at the beginning of the current line
- a, insert after the cursor position
- A, insert after everything currently on the line
- o, open a new line below the cursor and insert
- O, open a new line above the cursor and insert

While you are in insert mode, Vim behaves somewhat like a typewriter. Pretty much every character you type is written to the file. There are a few shortcut keys but you are expected mostly to switch back to command mode to navigate or perform other activities.

## Ex mode
You enter ex mode by typing a colon (:). That causes the colon to appear in the lower left corner of the window, where you can enter an ex command. These ex commands are mostly line-oriented commands. That means that they act on entire lines of text. For example, the `global` command, usually abbreviated as `g`, performs a specified action on every line matching a given pattern.

## Vim concepts
Some of the concepts for this editor that apply to all programmer's editors are as follows. Where the concept is preceded by a colon, it is also an ex command.

- `:split` A programmer's text editor must have many ways to split windows so that you can view another file or another part of the same file while editing. There's a basic `split` command in Vim and many parameters it can be given and many ways to bind it to shortcut keys to fit your habits.
- `:vsplit` In addition to a split that draws a horizontal line across the window, an editor needs a way to split the window the other way, drawing a vertical line down the window. The `vsplit` command is the basic command to do that in Vim.
- *folding* A programmer's text editor must have a way to hide some of the text to show the structure of a file or other attributes of a file that help to provide an overview. *Folding* is the generic term for hiding part of a file. It is based on the metaphor of folding a piece of paper so only part of the text can be seen. For example, suppose you have a file with several methods. You might fold it so that only the header of each is visible. You would also want folding to understand the syntax of the language in which you are writing text. For example, this file is written using Markdown. The basic folding commands recognize this and will automatically fold according to the Markdown headline syntax.
- `:search` A text editor needs extensive support for regular expressions, both for searching and replacing text. The regular expressions should provide greater flexibility than mere literal text, and should support patterns in both search and replacement strings. These should work on individual lines, ranges of lines, or an entire file.
- `:global` A text editor should support more than search and replace on regular expressions. It should be possible to perform some specified action on every line matching a pattern. The Vim `global` command provides this capability.
- *syntax highlighting* A text editor should offer flexible syntax highlighting that you can customize. Some popular syntax highlighting schemes like *Solarized* are available for a variety of editors and terminal windows.
- *hex edit* There should be a way to represent files in hexadecimal for specialized editing tasks. There is not such a facility built into Vim but it can be added easily. In fact, for any commonly used facility not built into Vim, you should search for an extension.
- *dbext* For the database courses, you may want to use the `dbext` extension to support writing statements and passing them to MySQL or whatever dbms you are using. Most popular interpreted languages have extensions to support passing fragments of text in a file to an intrepreter, simplifying the task of keeping an audit trail of activitites.
- `:vimdiff` The most basic utility for identifying differences between files, as well as for automating the patching of program files, is the utility `diff`. A text editor should have the functionality of `diff` built in, preferably in a way that is easy to learn and use, most often through compatibility with `diff`.

Some specific examples of commands for this editor follow.

### Motion
Most of the motion commands are only useful if you do them often enough that they become automatic. If you have to think of them, you may as well reach for a mouse.

`0` Go to the beginning of the cursor's line.

`$` Go to the end of the cursor's line.

`w` Go to the beginning of the next word.
`e` Go to the end of the next word.

`ctrl-f` Forward a screenful.

`ctrl-b` Backward a screenful.

### Get into insert mode but first delete something
Often you need to replace something with something of a different length. You don't want to have to think about the length of the new thing, just identify the thing being replaced and start typing the new thing.

`c` change *motion* characters, where *motion* is a motion command. For instance `cl` deletes one character to the right, whereas `ch` deletes one character to the left.

`cc` change current line---delete the current line before entering insert mode.

`C` change current line---delete the current line before entering insert mode.

`s` substitute character or count characters if you give count first; for instance, 1s is the same as s and 2s deletes two chars before entering insert mode

`S` substitute current line

### Just delete without changing mode

`x` delete the character under the cursor

`X` delete the character to the left of the cursor

`d` delete motion characters

`dd` delete current line

`D` delete current line

### Various
Here are various commands without a unifying category.

`u` undo

`ctrl-r` redo

`:s/pattern/repl/g` The `s` in this command stands for *substitute* and it is an exceptionally powerful command. The *pattern* can be any valid regular expression pattern and the replacement can include pieces of the matched pattern---even if you don't know the exact characters matched. For example, suppose you have a file of lines that look like this.

\begin{center}
  \scriptsize
\begin{verbatim}
Name: Moe Howard Email: moe@aol.com Description: leader of the three
\end{verbatim}
\end{center}

Suppose you would like to save just the email addresses. You could use a command like the following to eliminate everything except the email addresses.

```vim
:s/.*Email: \(.*\) Description:.*/\1
```
This command isolates the characters between email and description using a device called *escaped parentheses*. These are parentheses preceded by backslashes. Every pair of escaped parentheses is implicitly assigned a number and can be reproduced in `repl` by giving the number, preceded by a backslash.

`:g/pattern/command`

`~` Toggle capitalization of the current char.

`.` Repeat the last command. (Does not repeat everything you just did while in insert mode---there is a separate command for that.)

`/pattern` Find `pattern`, which may be literal or a regular expression.

`/pattern/e` Find `pattern` and put cursor at the end of the match.

`n` find next occurrence of `pattern` after saying `/pattern`

`fx` find char `x` on current line

`;` find next `x` after f`x`


## Terminal

We'll do exercises using a terminal interface. We'll introduce about fifty utilities. Using these will be much easier if we first learn to use `tmux` or a similar utility. Utilities like `tmux` support two basic functions as well as others. These two basic functions are window management and detachment / reattachment.

Window management includes splitting terminal windows, resizing and rearranging windows, copying and pasting between windows, and receiving notifications between windows.

Detachment and reattachment refer to the frequent need to close a terminal window without stopping the work in it, then reopening that window later, possibly while sitting at a different computer in a different building or different city. For example, suppose you begin your work in a school computer lab but take a break to go home and eat dinner. Perhaps you have network access at home and would like to continue your work there, possibly staying up all night and coding like a maniac, fueled by shocking amounts of espresso. This activity is made possible by a combination of youth and `tmux`.

## Shell

The main program used in each terminal window is called a shell. I'm not sure whether the idea is that the operating system has a delicate kernel and the shell protects it from clumsy users or the shell protects delicate users from the barbaric kernel or whether is some other reason for this naming scheme. Suffice it to say that you work with a shell and the shell works with the operating system.

Numerous shells are available. We will use `bash`, one of the most popular shells. For the most part, `bash` processes commands to run the fifty or so utilities we will experience. Two of the most important features we will learn are the use of `bash` to maintain an audit trail of activities and the use of `bash` to link utilities together to perform more complicated tasks than any utility could perform alone.

This approach of linking small tools together to do large jobs reflects the Unix attitude that small tools can be better debugged and refined than large tools. Therefore, for one-off tasks we should create a temporary infrastructure of small tools rather than relying on a single large tool. Many of the small utilities we shall work with have been available as source code for up to about forty years and have, as a result, been very extensively debugged. By contrast, large tools come into fashion and fall out quite rapidly and are usually completely opaque. The code base for large tools may be completely replaced between versions without the end user being aware of it. Think about the kind of environment in which large tools work best. You will probably conclude that they work best for complicated jobs that will be repeated vastly many times so that issues will be easy to identify. They may not help for small jobs that differ from day to day.

## Utilities
These utilities can be called from the shell to do many basic tasks.

`find` find files matching a pattern in the file name or other file characteristics, such as timestamp, ownership, or size.

`grep` find text within files. There are many options including colorizing the output and returning only the matching part of the line and returning all lines that don't match.

`cut` remove a column or columns from a file. This can be used to slice up a csv or tsv file, removing unneeded columns or rearranging the order of columns. It can be used in combinations with other commands to count the number of items in a column.

`uniq` Display uniq lines of a file or count how many times a non-unique line occurs.

`wc` Word count: counts the characters, words, and lines in a file or a list of files.

`sort` Sort the lines of a file, with several options including numeric sorting and the choice to ignore case.

`head` Display the first few lines of a file. You can specify how many lines to display and you can pass as many files to the command as desired. If you pass multiple file names, the files will be separated by a line like `==> filename <==` in front of each file.

`tail` Display the last few lines of a file. Some of the options include the choice to give a specific line number to start with, allowing you to get predictable output even if you don't know how many lines are in the source files.

`sed` Stream editor. This utility has many uses. One is that it can programmatically do what you did interactively in Vim with `s/pattern/repl`. For example, suppose I have a file like the following, called `three`.

```
"Moe","The Leader"
"Curly","The Funny One"
"Larry","The Other One"
```

Imagine that I need to change the commas to semi-colons before uploading. I can use `sed` to do so by saying the following.

```bash
sed 's/,/;/' < three > tmp1
```

Now I have a new file called `tmp1` containing the desired result. Further, I could get rid of all the quotation marks by saying the following.

```bash
sed 's/"//g' < tmp1 > tmp2
```

The `g` means to do this globally, i.e., more than once per line if there is more than one quotation mark per line. What if there were single quotes in the file instead of double quotes? The command would be confused by having single quotes both in the command and surrounding the command so I would change it to the following.

```bash
sed "s/'//g" < tmp1 > tmp2
```

Now I'm using a different symbol to surround the command than I'm using inside the command. After I check `tmp2` to be sure it contains what I want, I can say `mv tmp2 three` to give it the desired name.

`uname -a` Display all the information related to the active Linux kernel.

`lsb_release -a` Display all the information related to the Linux distribution.

`man command` Section 1 of the Unix manual is a list of commands and their descriptions. Saying `man command` displays that section of the manual for that `command`. The man pages are not tutorials by any means. They are reference works, like dictionary entries. They have a rigid format, including a list of command line options, a very terse description and optional examples. Some commands offer a `See also` section.

## Redirection

When I do a series of changes to a file, I usually don't make changes to the original file until I am sure that the changes give the results I want. Consequently, I use redirection so that the output of every command becomes the input of the next command. As an example, suppose I want to remove every occurrence of bleah, blaah, and bluuh in a file called `rumbl`. I might do it like this.

```bash
sed 's/bleah//g' < rumbl > temp1
sed 's/blaah//g' < temp1 > temp2
sed 's/bluuh//g' < temp2 > temp3
```

Now I check the contents of `temp3` to make sure it worked, then say `mv temp3 rumbl` to finish. Now the file `rumbl` contains no copies of those three words.

What I did above could have been accomplished the same way by saying the following.

```bash
cat rumbl | sed 's/bleah//g' > temp1
cat temp1 | sed 's/blaah//g' > temp2
cat temp2 | sed 's/bluuh//g' > temp3
```

This is because all three of these symbols, `|`, `<`, and `>` are redirection operators. All three redirect standard input and standard output. The pipe, `|`, redirects the standard output of one command to be the standard input of another command. The standard output of `cat rumbl` is the contents of the file `rumbl` so it redirects the contents of the file `rumbl` to the standard input of the `sed` command.

The symbol `<`, the less-than sign, redirects the contents of a file to be the standard input of a command. So saying `sed 's/bla//g' < rumbl` causes the contents of file `rumbl` to become the standard input of the `sed` command.

Finally, the symbol `>`, the greater-than sign, redirects the standard output of a command to a file. Saying `some-command > file` causes the output of `some-command` to become the contents of `file`. If you want to append to `file` instead of replacing it, you can say `some-command >> file`.

There are more redirection operators you can use but these are the basics you may find useful on a day-to-day basis. The others redirect error messages or redirect more than one thing at a time.

## System calls instead of utilities

Instead of working with a shell, you can call libraries directly from your program. For many shell utilities, there is a corresponding library. Working with the shell is for off-the-cuff, informal, one-off activities.

## Exploring the development environment

There are countless places where you can learn about development. I rely a lot on *Hacker News*. One good resource (of very many) it has supplied lately is the JetBrains State of Developer Ecosystem in 2018 at
[https://www.jetbrains.com/research/devecosystem-2018/](https://www.jetbrains.com/research/devecosystem-2018/). You should keep your eyes peeled for information like this and you should be careful in digesting information like this. How many were surveyed? What were their likely biases? Where are they in their careers? What is JetBrains' interest in the results? Think about all these things as you read about the state of the developer ecosystem.
