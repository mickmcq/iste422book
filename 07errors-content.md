
# Error handling

## Kinds of errors
We won't discuss hardware errors here.
Two kinds of software errors to think about include

- syntax errors, which are caught by the compiler during implementation
- logic errors, which should be caught during design or testing but may not even be caught by users in production

## Exception handling
Exceptions include any abnormal conditions, not just errors. For example, the user may attempt to enter invalid input or unexpected input. Invalid input may result from communications problems. Resources such as files, disk space, or RAM may be unavailable. Problems with hardware or other software may be responsible, but all you know is that some exceptional condition has occurred. Your response is to transfer program control by "throwing an exception."

What should be done when exceptions are thrown? They may be caught in a *try / catch* block, or they may be caught by the user. If the user catches an exception, there are three problems. (1) The typical user does not know how to respond. (2) An adversary knows how to respond to your disadvantage. (3) You have no mechanism to get useful information about problems. Therefore you *must* handle exceptions in some way.

The Wikipedia article on exception handling cites sources arguing that exception handling routines should ultimately terminate programs rather than resuming execution.
Bjarne Stroustrup, in *The Design and Evolution of C++*, @Stroustrup1995,  on page 392, writes that one of the chief proponents of resumption reversed himself after ten years and half a million lines of code convinced him to remove every resumption because "every use of resumption had represented a failure to keep separate levels of abstraction disjoint."

This leaves open the question of *where* to handle exceptions in program flow.
Language-dependent options exist for you to make decisions about exception handling. Here are four options.
You may catch and handle exceptions immediately.
You may catch and re\-throw (the most frequent option).
You may catch and retry (especially in cases of resource exceptions).
You may pass on exceptions to another layer or module of code.

# Logging
You can classify logging as either infrastructure logging or application logging. We'll consider application logging here but you should be aware that all system service log events and these logs offer a lot of value for diagnosing problems of all kinds, including security, performance, network communication, and abnormal program termination. In Unix-like systems, these infrastructure logs are saved in `/var/log` and are all human-readable. In enterprise systems, it is common for systems to not only record events locally but also to `tee` logged events to a central server that has restricted access except to append to logs. This practice is meant to enhance security.

In addition to a centralized syslogd server, enterprises also use specialized software for centralized logging and analysis. For an example of a popular package see [https://www.splunk.com/](https://www.splunk.com/).  [https://logz.io/](https://logz.io/) and [https://www.sumologic.com/](https://www.sumologic.com/) are popular alternatives. These provide enhanced searching of history and sophisticated query criteria. Some also have sophisticated reporting, analytics, and dashboarding.

## Application logging
Application logging includes any messages the developer wants to record. These can be sent to `stdout` or to a specific log file for the application or, in some cases, to a central log file (see Application logging in Linux below).

Logged messages may serve various purposes, recording events pertinent to security, such as logins, resources such as memory and disk storage, or operations such as completion of specific tasks.
These messages can be debugging messages, error messages, fatal error messages, informational messages, trace messages, or warning messages. They may serve a variety of purposes as these names suggest. They may be formalized into specific levels. The preceding list is taken from the levels of `log4j`, a popular logging package which offers the levels: all, debug, error, fatal, info, off, trace, and warn.

Logging is a vital programming activity. For example, a logging library is among the most popular Java libraries (see below). Log analysis tools like Papertrail and Splunk Cloud are highly visible in discussion forums.

## Application logging practices
A blog post by
[Ryan Daigle](http://www.miyagijournal.com/articles/five-steps-application-logging/)
suggests

- pick a small set of events to log
- stream logs to `stdout` and pipe them to collating services
- format logs as key-value tokens
- use consistent log keys
- include contextual data

He provides an example of key-value formatting as

```Java
logger.info("measure.queue.backlog=" + queueBacklog);
```

\noindent
and examples of naming conventions as starting with `measure` for measurements of conditions or `source` for source of the log,
such as `measure.queue.backlog=23` or `source=instance=1041`.

## Application logging in Linux
Recent Linux systems mostly rely on an initialization system called `systemd`. That system has a central logging system called `journald`. The point of this logging system is to centralize the logging of events reported from disparate sources because troubleshooting previously required individuals to attempt triangulation between logs from disparate systems. The thinking behind `journald` is to simplify troubleshooting. For performance purposes, the log kept by `journald` is in binary format and is accessed via a utility called `journalctl`. There have been vociferous complaints about the binary format but that seems unlikely to change, because of performance.

I have found bindings for C, Node.js, Python, PHP, and Lua for application logging to the central log. There is also a command-line utility that can be used by languages without a direct binding.


## Hello World for logging

\begin{sloppypar}
Refer to \url{https://en.wikipedia.org/wiki/Java_logging_framework} and pages for log4j and slf4j for this topic.
\end{sloppypar}

A recent survey found that JUnit and slf4j were the most popular libraries among 10,000 Java projects at 30.7% each (I found this report in the Wikipedia page on JUnit). Because of this popularity, let's try slf4j as an example of logging.

The slf4j manual offers a Hello World example to demonstrate slf4j as follows.

```java
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class HelloWorld {
  public static void main(String[] args) {
    Logger logger = LoggerFactory.getLogger(HelloWorld.class);
    logger.info("Hello World");
  }
}
```

In order to run this the slf4j API as well as a binding to a framework must be in the classpath. You can accomplish this by downloading the current version of slf4j which contains the API and several frameworks, including the recommended simple framework. I placed the two files in the folder with the `HelloWorld.java` program listed above and said

```bash
javac -cp .:slf4j-api-1.7.18.jar:slf4j-simple-1.7.18.jar \
   HelloWorld.java
java -cp .:slf4j-api-1.7.18.jar:slf4j-simple-1.7.18.jar \
   HelloWorld
```
This led to the expected output

```bash
[main] INFO HelloWorld - Hello World
```

## slf4j implements the façade pattern
Bear in mind that, if you want to put a different logging framework into your classpath, you should remove the simple framework. An important benefit of slf4j is that it is an example of the façade pattern. This means that it simplifies access to various kinds of logging frameworks. You don't have to touch your Java code to use a different framework. Instead, you remove one framework from your classpath and insert a different framework.

## Logging example
The slf4j manual provides a slightly more realistic example, amended here to run as a standalone program and provide additional output in the default setting. Create a file called `Wombat.java` and write the following code into it.

```java
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class Wombat {
  final Logger logger =
               LoggerFactory.getLogger(Wombat.class);
  Integer t;
  Integer oldT;
  public void setTemperature(Integer temperature) {
    oldT = t;
    t = temperature;
    logger.info("Temperature set to {}.
                 Old temperature was {}.",
                t, oldT);
    if(temperature.intValue() > 50) {
      logger.info("Temperature has risen above 50 degrees.");
    }
  }
  public static void main(String[] args) {
    Wombat a = new Wombat();
    a.setTemperature(100);
    a.setTemperature(25);
  }
}
```

Running this program similarly to `HelloWorld` gave me the following expected results.

```bash
[main] INFO Wombat - Temperature set to 100.
                     Old temperature was null.
[main] INFO Wombat - Temperature has risen above 50 degrees.
[main] INFO Wombat - Temperature set to 25.
                     Old temperature was 100.
```

To prepare for the logging homework, write the following code into a file called `Wombat2.java`.

```java
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class Wombat2 {
  final Logger logger =
               LoggerFactory.getLogger(Wombat2.class);
  Integer t;
  Integer oldT;
  public void setTemperature(Integer temperature) {
    oldT = t;
    t = temperature;
    logger.debug("Temperature set to {}.
      Old temperature was {}.",
      t,oldT);
    if (temperature.intValue() > 50) {
      logger.info("Temperature has risen above 50 degrees.");
    }
    if (temperature.intValue() > 75) {
      logger.warn("Temperature has risen above 75 degrees.");
    }
  }
  public static void main(String[] args) {
    Wombat2 kevin = new Wombat2();
    kevin.setTemperature(100);
    kevin.setTemperature(25);
  }
}
```
\noindent This will serve as the base file for your logging homework.

# Bug tracking
Before we talk about bug tracking, let's review the *Joel Test*. Offered nearly twenty years ago by Joel Spolsky, it remains relevant today as a list of twelve questions to ask about a software team to assess how good it is.


1. Do you use source control?
2. Can you make a build in one step?
3. Do you make daily builds?
4. Do you have a bug database?
5. Do you fix bugs before writing new code?
6. Do you have an up-to-date schedule?
7. Do you have a spec?
8. Do programmers have quiet working conditions?
9. Do you use the best tools money can buy?
10. Do you have testers?
11. Do new candidates write code during their interview?
12. Do you do hallway usability testing?

Two of the questions concern bug tracking. You have to have a record of bugs and then, of course, you have to do something about them. That seems simple enough yet there is a whole bug tracking (issue tracking) industry. For example, the aforementioned Joel Spolsky offers a bug tracking system called Fogzbugz that costs a minimum of 200 USD per month.

## Bugzilla
The commercial offerings like Fogzbugz and Issuetrak look good but their public facing documents are a little too marketing-speak. Instead, let us look at the open source Bugzilla, which you can download, install, and play with as much as you'd like and even more.

Bugzilla's user guide makes an informative introduction to bug tracking. Here are the main sections:

- Filing a bug
- Understanding a bug
- Editing a bug
- Finding bugs
- Reports and charts

Let's examine these in turn, keeping in mind that the structure of Bugzilla includes a web interface and a MySQL database. These elements come into play with every interaction.

### Filing a bug
It sometimes surprises me that students in an advanced class report their bugs to me as *my program keeps crashing*. Yet, we find that very phrase in an admonition in the *Filing a bug* chapter to give more detailed descriptions. Even experienced developers need to be reminded to say something more specific.

Filing a bug involves filling out a form and it may come as no surprise to experienced form fillers that many fields are often left blank. I've seen forms with a red asterisk next to every single field as a way of trying to get people to enter more information. It doesn't always work. To many people, the idea of filing a bug is a formality to get some attention. *I'll tell the dev what the problem is when he/she responds*, the thinking goes.

The question that arises is whether filing the bug is the best way to convey information. I have personally worked in an environment where it was mandated that no one talk about bugs *except* through the bug tracking system. That edict was pronounced because the bug tracking system was considered awful and people kept trying to circumvent it.

A team needs a quality bug tracking system that is not considered awful by its users. The choice of bug tracking system is often made by someone who doesn't actually use it. That's a big problem. Another problem that is sometimes masked by bug filing and its discontents is that inadequate resources have been assigned to fix bugs. When that is true, no bug filing strategy can help! People must try to circumvent the system to satisfy their needs.

### Understanding bugs
Bugzilla's bug filing form has about thirty fields! Understanding a bug can be daunting. Why divide the form up among so many fields? The person who filed the bug may not be so concerned as the person managing the tracking of all bugs and the time spent by all developers. Dividing the form into minute fields makes it possible to generate reports and charts describing the condition of the entire system. It may even be possible to obtain greater resources through documentation of the status of bug tracking *if the fields are filled in*.

Bugzilla's form includes
summary,
status,
resolution,
alias,
product,
component,
version,
hardware,
os,
priority,
severity,
target milestone,
assigned to,
qa contact,
url,
whiteboard,
keywords,
personal tags,
dependencies,
reported,
modified,
cc list,
ignore bug mail,
see also,
flags,
time tracking (includes orig est, current est, hours worked, hours left, percent complete, gain, deadline),
attachments, and
additional comments.

Perhaps the most interesting of the aforementioned fields is *flags* which are a mechanism for requesting and approving or denying specific resources for a bug. A separate section of the user guide explains how to use flags and track them as the main way to manage the current backlog of bugs. The Bugzilla user guide gives the following as a simple example of the use of flags:


1. The Bugzilla administrator creates a flag type called blocking2.0 for bugs in your product. It shows up on the Show Bug screen as the text blocking2.0 with a drop-down box next to it. The drop-down box contains four values: an empty space, ?, -, and +.
2. The developer sets the flag to ?.
3. The manager sees the blocking2.0 flag with a ? value.
4. If the manager thinks the feature should go into the product before version 2.0 can be released, they set the flag to +. Otherwise, they set it to -.
5. Now, every Bugzilla user who looks at the bug knows whether or not the bug needs to be fixed before release of version 2.0.

### Editing a bug
The main ways you edit a bug in Bugzilla are to manipulate flags (see above) and to do time tracking throughout the bug's life cycle. The Bugzilla user guide includes the customizable diagram in Figure \ref{fiBugLifecycle.png} represent the default workflow using statuses.

\begin{figure}[htpb]
  \begin{center}
    \includegraphics[width=4in]{fiBugLifecycle.png}
  \end{center}
  \caption{life cycle of a bug}\label{fiBugLifecycle.png}
\end{figure}

### Finding bugs
Once entered into Bugzilla, bugs must be found to be edited. Bugzilla offers two search sytems. One is meant to emulate search engines and allow keywords of whatever kind. The other is meant for managing bug tracking and allows searching of all the many fields mentioned above to find perhaps not just one bug but many.

The output of searches can be formatted as XML, CSV, long format, iCalendar, Atom feed, mail messages, or other ways. As you may guess, bug lists can be compiled for many reasons by many different staff members.

### Reports and charts
Besides the above lists of searches, Bugzilla can produce various reports and charts to monitor the state of bug tracking. Because it is a popular open-source project with a published API, developers also write add-on report and chart generators to simplify or embellish this aspect of bug tracking. For example, Figure \ref{fiBuggy.jpg} shows a chart generated by an add-on called *Buggy*.

\begin{figure}[htpb]
  \begin{center}
    \includegraphics[width=4in]{fiBuggy.jpg}
  \end{center}
  \caption{chart generated by a bugzilla add-on}\label{fiBuggy.jpg}
\end{figure}

## Bug tracking and code review
The preceding description of Bugzilla may suggest that the notion of bug tracking could be expanded to include tracking of all issues and improvements to code. There is an industry of automated code review tools that subsume the bug tracking activity into a larger kind of code review, sometimes called Automated Lifecycle Management but often just called automated code review. Consider, for example, Figure \ref{fiAndroidPatches.png}, detailing the patch workflow for AOSP, the Android Open Source Project. It uses a web-based code review tool called Gerrit. Note that I have seen this particular tool described as *all the fun of doing your taxes but without the refund*. Evidently it is required that you click through every file affected by the patch as one of several design infelicities.

\begin{figure}[htpb]
  \begin{center}
    \includegraphics[width=4in,height=6in]{fiAndroidPatches.png}
  \end{center}
  \caption{android open source project patch workflow}\label{fiAndroidPatches.png}
\end{figure}

You can find
[a lively discussion](https://news.ycombinator.com/item?id=15370620)
on Hacker News about
[an article](https://lwn.net/Articles/702177/)
describing the use of email as the code review tool for the Linux Kernel project. This project accepted an average of 8 patches per hour during 2016 from 4,000 developers working for 400 different employers and operated using email perhaps because it was the least common denominator for developers at different workplaces.

Contrast this with Google, which claimed to make about 1,875 commits per hour from 25,000 developers in 2015. This is on a code base of 2 billion lines, according to
[an article](https://news.ycombinator.com/item?id=15370620)
from 2015. The article notes that this is about 40 times the size of Windows. The code repository contains 85 terabytes, according to the same article. Google uses an internally developed version control system called Piper, having migrated from a tool called Perforce. At the time of that article, Google and Facebook, whose main app is a single project of 20 million lines of code, were reportedly working on a version of Mercurial to scale up to the size required to run Google and were planning to open-source that project. I have no more recent information about this.

# Profiling
There are two main kinds of profiling and numerous tools to accomplish both kinds. There are several reasons to profile as well, including improvement in operational efficiency, the need to evaluate coding results, better understanding of code, and prediction of future operations.

## Static profiling
This consists of a static analysis of one program by another, looking for common errors, errors more specific to this code, and small and large inefficiencies in the code, such as constructs that make extra work for the program.

The profiler reads in the code and analyzes it using formal rules. The output is an analysis as to where mistakes were made, what parts of the program are free of mistakes, and where improvements are possible.

The original static profiler was a program called `lint` after the miscellaneous fibers sticking to its inventor's wool. The inventor, Steven Johnson, wanted a tool to alert him to any obvious problems in his C code. @Johnson1978 reports that the `lint` program can check for things like variables being used before being set, division by zero, conditions that are constant, and calculations whose result is likely to be outside the range of values representable in the type used.

Any program that checks static source code may be called a *linter* after the original `lint` program but these programs may differ greatly from each other. Linters can be found in some IDEs such as Eclipse, some text editors such as Sublime, and some compilers, such as `javac`.

One interface to linters is the ALE plugin for Vim 8 and NeoVim. ALE causes any linters you have installed to be run in the background and, depending on your settings, provides facilities to review and correct problems.

## Dynamic profiling
One program records the execution of another program, examining externally visible characteristics such as execution time and memory use. The important point is that it profiles *running* code.

## Profiling tools
Java code sniffers include
Findbugs,
Dependometer,
QJ-Pro,
PMD,
Hammurapi,
JCSC,
JDepend, and
Sonar.

Java profilers include
VisualVM,
JProfiler,
YourKit,
Java Mission Control (with Java Flight Recorder),
Prefix by Stackify,
JiP,
Jrat,
JMP,
JAMon, and
Profiler4j.

Java optimizers include
PMD,
Findbugs,
Macker,
EMMA, and
Condenser.

PHP code sniffers include SonarCube, RIPS, Yasca, and PHPMD.

PHP profilers include Xdebug, Webgrind, and xhprof.

PHP optimizers include ZendOptimizer and builtins for various IDEs.

C# has Visual Studio builtins, as well as third-party tools like YourKit.

JavaScript has browser based plugins like Firefox Developer Tools.
