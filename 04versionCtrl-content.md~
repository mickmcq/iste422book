
# Version control

Whenever application development is accomplished by a team, some form of version control exists.
Most students in \the\year\ are probably familiar with GitHub, the most publicly visible version control system. Students at RIT have version control for shared documents as well, via Google Drive. Your experiences with these two examples can provide a reference point for understanding the underlying commonalities and differences between all version control systems. Bear in mind, though, that they are examples and you need to know more.

Although version control has been practiced since the dawn of computing, it remains problematic. In very small group student projects you may have encountered some of the classic version control problems. Even in a solo project you may have encountered some of the classic version control problems, especially if the project lasts for a long time. You may have experienced analogous problems with different versions of documents, such as term papers. Try to think back to any examples of struggling to reconcile different versions of code or documents. What specific things did you do to make the reconciliation?

## The version control problem
An application has source code written by a person or people. That source code may be revised during each period of work. Say, for instance, you work on code from breakfast until lunch. At the end of the morning, you have a stopping point. You put your work away and leave. If you are working on a group project, you might tell another group member that you are leaving and suggest that that person continue working with the same source code. When you return, you may find one of several scenarios.

- No one has touched your code.
- Someone has modified your code in a way that improves it and you would like to forget about the version you were working on before lunch and only make further improvements in the modified source code.
- Someone has modified your code in a way that is so obviously wrong that you yik-yak in a very humorous way about it and gain temporary fame across campus.
- Someone has modified your code in a way that may be good or may be bad and it is hard to be sure.
- Someone is still modifying your code so you really can't go back to work on it without colliding with their work somehow.
- Your machine is a smoldering wreck because the office drone was shot down and crashed into it while carrying a load of kerosene to the backup generator. You start to wonder how the shared repository works.

All of these scenarios can benefit from some kind of version control. You would like to be able to identify your fragment of code, identify whether it has been modified and, if so, who modified it, how they modified it, and when they modified it. How can you do all this?

## The basic version control solution

A basic solution to the problem would be to establish a repository of source code and treat it like a lending library. At the start of your morning work period, you check out a fragment of source code. If anyone else wants it, they see a record of its state when you checked it out and your identity. The library would need to have a policy about what to do. The simplest policy would be to disallow anyone else to check out the same fragment of code while you have it but you can probably imagine many more elaborate policies. When you leave for lunch, your work period has ended and you check your code fragment back in. If you have modified it, the lending library needs to keep a record of that. The lending library should be able to produce, for any future borrower, the version you checked out, the version you checked back in, both times, your identity, and the status of the code in the project. In other words, if someone wants to build the project, the lending library should be able to tell whether to use the version you checked out or the version you checked back in.

## Questions raised by the basic solution
This very basic solution leaves a lot of open questions. Following are three questions, concerning (1) authority, (2) units of work, and (3) bundling.

(1) Who decides which version of the code is to be used in a build? I used to work for a man whose nickname was *Suicide Pete*. He was extremely talented but, as you may guess from his moniker, prone to taking extreme risks. People took a keen but somewhat apprehensive interest in his solutions, expecting the best but preferring to review before committing to the occasional catastrophe.

Key terms used in making choices about authority include *locking* and *merging*. One choice may be to allow a developer to lock access to some code while modifying it. Another choice might be to allow everyone to check out code. Then, require a developer who checks code in to verify that the same code has not been previously checked in by someone else. If it has, a common policy is for the second developer to have the responsibility to merge changes with those of the first developer. This kind of policy is meant to encourage early check-in since it burdens the developer who checks in last.

(2) Another question has to do with the *period of work* and the *fragment of code*. This question is tied to the question of what the lending library does when another borrower seeks the same fragment of code while it is checked out.

A key term used to make choices about these issues is *atomicity*. The word *atomic* means the smallest unit, the indivisible fragment. What should be regarded as the smallest unit of code? The word *atomic* as it was once used in physics turned out to describe a unit that was divisible after all. Similarly, in source code, the notion of *atomicity* is not settled and may vary by language or development environment.

A second key term used to make choices about these issues is *branching* or *forking*. What should be done if we would like to continue with two different versions of some fragment of code? Should we divide the project into different branches, perhaps for different platforms or pursuing different objectives? Would it make sense to regard some code as common to two or more branches and to be able to build a project with some common code and some different code? Should we divide a project into two projects and assume that all the code in both projects may drift apart over time?

Another pair of key terms used to make choices about these issues is *commitment* and *rollback*. If we want to include a new fragment of code as part of the build, we can say we commit it to the build version. If we decide to reject it, we can say we roll back to the previous version of the same code. If a commit operation is interrupted, it should be possible to automatically roll back to avoid including nonsensical fragments. Not all popular version control systems offer any integrity functionality and leave it to developers to insure integrity manually.

A final key term to consider is *tagging*. How do we tag fragments of code? We need to refer to their status regarding builds, the identity of developers responsible for specific revisions, the time specific revisions were made, and the status of code at the moment of events, like milestones, freezes, inspections, or walkthroughs.

(3) A third question is the extent to which aspects of version control should be bundled together. Whenever you select tools to solve problems, you must think about the spectrum running from a large collection of small tools at one end of the spectrum to a single mammoth tool that does everything at the other end of the spectrum. How many tools related to the problem should be bundled together?

## The root of all version control, diff
All version control is based on comparing two fragments of text. The most basic tool to compare two fragments of text, often modified and incorporated into other tools, is called `diff`. Some version of `diff` has been shipping with Unix since 1974 and remains in active use in \the\year. The core of this tool computes the smallest number of changes that would need to be made to text fragment A to produce text fragment B.

As you may imagine, all kinds of refinements could be made to the core tool. For example, there might be different ways to display the differences. The fragment of text might be a file or a set of files. The text may be written in a programming language syntax that could be highlighted. It may be useful to compare more than two fragments at a time. It may be useful to produce an output that can be used as a *patch* by another program to update one file to be indistinguishable from another file. It may be more economical to transmit this patch rather than to transmit the entire code base.

You should learn to operate at least the common command-line version of `diff` to understand the basic concepts used in the vastly many refinements to diff. You need to know that the basic comparison is between two files and that one file is the first file and the other file is the second file. You need to know that the comparison is line-oriented. You need to know the symbols used in the command line version, <, >, and =, to signify lines from the first file, lines from the second file, and lines common to both. You need to be able to control the display to help you find what you are looking for in varying circumstances. You should be able to make `diff` display side-by-side output or interleaved output. You need to be able to control for whether `diff` regards tabs, spaces, or case as important. You need to be able to control for whether `diff` ignores lines containing a given regular expression. You need to be able to produce a patch using `diff` so that, instead of transmitting a hundred similarly-named files in a dozen directories, you transmit a single patch file that makes the relevant changes to the code base when applied with the `patch` utility. 

## Code repositories

The most familiar code repository today is GitHub. You may regard it as the best answer to every version control issue. Actually, GitHub represents many choices and many kinds of repositories are possible and in common use.

### Storage choices
For example, how should fragments of code be stored? Should they be stored as individual files? If two files are similar, should the repository store only the patches that would be needed to convert one file into the other? Should the fragments be stored in a database of some kind? How and when should repositories be backed up?

### Centralization or decentralization
Should the repository be stored in one location or redundantly in several locations? If it is stored in one location, is that location considered authoritative? If stored in a distributed manner, is each copy regarded as equal?

Choosing a centralized or decentralized repository implies other choices. A centralized repository allows one entity to more easily control the code base. A centralized repository allows one entity to quickly see every aspect of the code base. A centralized repository provides a single point of failure, simplifying fixes for some kinds of problems. A single centralized repository is vulnerable to communications issues. A single issue may prevent all developers from working on any code. A centralized repository makes it easier to deny access to any given developer.

A decentralized repository implies less hierarchical management. It may encourage more involvement by remote developers and work better with limited network access by individual developers.
It may permit individual developers with different backgrounds to use already familiar tools and become productive more quickly. This contrasts with a centralized system that may permit only a single toolset.
A decentralized repository may encourage more experimentation.
One developer may create and destroy multiple branches, all without disturbing the work of any other developer. It may require external managerial work to determine which of conflicting redundant copies has authority.

A decentralized repository is harder to audit than a centralized repository unless external choices are made to enhance auditability. To see why this is, consider the case where a first copy of a repository is synchronized with a second copy, then the second copy is synchronized with a third copy, regarded as the master copy. Whoever controls the second copy could eliminate tags from the first copy before passing it along, making it appear that the owner of the second copy completed all the work accomplished in the first copy.

### Sharing repository contents
How should the repository be shared with developers? Should individuals receive copies of individual fragments of code or copies of the entire repository when they check something out? What happens when code is committed? Is there some kind of moderation over individual developers? What if two developers each modify a different fragment so that each works with the version of code that was current in the repository when they checked the code out, but which conflict with each other so that, when they commit, a new bug is introduced? Which developer is responsible for breaking the build?

### Representing repository contents
How should the repository represent its contents to users? How should the history of changes look? How should a global view look? How should individual file views look? The way in which the repository is stored places limitations on what can be represented but there may still be a lot of flexibility. It may help to imagine the reasons someone browses the repository. A developer may want to work on a specific bug and the relationships between different code fragments before and after the bug was introduced. A manager may want to examine the contribution of a particular developer. Should developers be able to add comments to the repository, independent of comments in individual fragments of code? How should repository comments be represented? Suppose that a conceptual change requires changes in several fragments of code stored in different files. Where should that conceptual change be described? In a repository log?

## Implementations of version control
Many implementations of version control are available and well-documented. Some examples include CVS, RCS, SCCS, SVN, Mercurial, BitBucket, Tortoise, and the current ruler of this space, git. Because these implementations change and new ones are born, spread, and die, it makes little sense for you to review static slideshows to compare them. Instead, use your googling, Stack Overflow, Hacker News, and Wikipedia skills by investigating them. See which systems are used by which projects. See who sponsors which systems. See which systems are the subject of which type of questions. Find out the volume of traffic about each system. There is no substitute for using a version control system to learn about version control, but active monitoring of the web makes a better learning supplement than does any prepackaged content.

## git
This study guide is stored as a project on github at \url{https://github.com/mickmcq/iste422book}. You can clone it and make changes to it and request that those changes be merged into the main branch.

First, install git on your machine. If you are using the virtual machine for this course, it has already been installed. Otherwise, visit \url{git-scm.com} for Windows or use the package managers for all other platforms. For example, for macOS use homebrew and for Ubuntu use apt.

There are two main things you'll do with git. First you'll create a git project, add a file to it, commit a change to the file, and push it to a remote repository. Second, you'll clone a repository on github, make a change to it and offer that change to the person controlling that repository.

## A simple project with git and github
Making a new project is easy. Just create a folder, change to that folder, and say `git init`. This has the effect of creating a `.git` subdirectory filled with stuff you probably don't ever need to look at directly.

Next, create a file called `proggy.js` and put one line of code into it, `console.log('Hello, World!')`. Then type `node proggy.js` at the terminal prompt. Then type `git status` at the terminal prompt. This will tell you your status, including the fact that you haven't committed anything yet and that you have an untracked file called `proggy.js`. Track that file by saying `git add proggy.js` at the terminal prompt.

When you then say `git status` again you can see your status has changed---you have a change to be committed. Rather than committing it, though, remove it, saying `git rm --cached proggy.js` and check the status again. You're back to where you were a minute ago. Now instead use a shortcut to add the file, saying `git add .` which will add all the files in the folder. Now check the status and commit, saying `git status` then `git commit -m "initial commit"`.
So far, what you've done looks like this:

```bash
mkdir proggy
cd proggy
git init
vi proggy.js
node proggy.js
git status
git add proggy.js
git status
git rm --cached proggy.js
git status
git add .
git status
git commit -m "initial commit"
```

It is always a good idea to add a commit message via `-m` to remind you of what you've done. If you *don't* include a message and instead just say `git commit`, git will throw you into an editor session using Vim by default and you will be faced by a bunch of lines preceded by comment characters, `#`. You can uncomment the line that says `# Initial commit` for instance and that will become your commit message. Developers often write non-useful commit messages under the impression that they are funny but they often seem less funny when you're trying to remember what you did a while ago and you're facing a deadline.

The next thing you might like to do is push this to github (or some other host like gitlab or bitbucket) so that you can share this with someone else who might want to help us develop it further. Before you do that, you should create a `README.md` file, containing the text that will greet anyone who chances upon the repository. My README file for this project contains the text `This repository is only a classroom exercise. Ignore this.` You should also configure our git account globally by saying `git config --global user.name 'Mick McQuaid'` and also `git config --global user.email 'mickmcquaid@gmail.com'`. If you look, you will now see a `.git` file in your home directory that contains this information.

Log into your github account (or another host if you prefer---I'm just going to use github for this example) and establish a new project. The screenshot in Figure \ref{fiGitHubCreate} shows how I have configured mine. Note that I am skipping the step at the bottom of the screen because I'm going to push my local repo here.

\begin{figure}
  \includegraphics{fiGitHubCreate.png}
  \caption{The GitHub Create Repo screen in Summer 2019}
  \label{fiGitHubCreate}
\end{figure}

Assuming you're playing along with doing this in github, select *Create Repository* at the bottom of the screen. This should bring up a *Quick Setup* screen that will advise you of what to do next. We're going to select the option to push an existing repository from the command line. That requires two commands as follows.

```bash
git remote add origin https://github.com/mickmcq/proggy.git
git push -u origin master
```

This should give you output like the following.

```
Enumerating objects: 3, done.
Counting objects: 100% (3/3), done.
Writing objects: 100% (3/3), 245 bytes | 245.00 KiB/s, done.
Total 3 (delta 0), reused 0 (delta 0)
To https://github.com/mickmcq/proggy.git
 * [new branch]      master -> master
Branch 'master' set up to track remote branch 'master' from 'origin'.
```

In my case, I forgot to add the README file despite having just written the above instructions, so I had to do it over again giving me four objects instead of three as above.

You may have noticed that github has a Hello, World tutorial that it recommends. I recommend it too. Try that next because it exercises a few more commands than what you've just done. Then come back and try the next exercise, which is to clone the iste422book repo and alter this very study guide.

## A second simple project using git and github
For this project, switch to a directory that can be the parent of the directory you'll work in. The easiest thing to do is to use the virtual machine for this class and open a terminal to the home directory, then make a subdirectory for 422 (it may already exist) and change to that. From there, run `git clone https://github.com/mickmcq/iste422book` and you should wind up with a new folder having that project's name. Changing to that folder you will find the files that constitute the study guide. Most of these files are not of interest to you if you just want to change the content of the study guide. The content is in a bunch of markdown files with the extension `.md`. These files are numbered in the order in which they contribute to the study guide.

There are also a bunch of files whose names begin with the letters `fi`. These are image files used in the study guide, although there are also images constructed by code in the markdown files. There are also a bunch of files that control how the study guide looks.

For now, you are mainly concerned with the file named `Makefile`. This is the input to a build utility called `make`. Build utilities will be covered in the next section in case you want to read ahead to see how this works. For now, just use the build utility without knowing any of its details. To do so, type `make` at the terminal prompt. By default, the `make` utility looks for a file called `Makefile` to take instructions from, so it should find your `Makefile` and follow its instructions. The instructions are to build a pdf file from all the files in the folder. That pdf file is called `book.pdf` by default and is identical to the study guide for this course on MyCourses. The build process invoked by typing `make` should succeed if you're on the virtual machine for this class, but may fail on other machines because you don't have the correct prerequisites installed. You may need to see the instructor if you are trying to build this on another machine.

You can alter the study guide by editing any of the `.md` files with a text editor such as Vim. Then you can see the effect by rerunning `make`. You can then create a remote branch on github or some other host with your changed version.  How do you get the author of the study guide to accept your changes into the main branch? First, you must learn about branches. Then you must learn about pull requests.

You can find out about branches at \url{https://git-scm.com/book/en/v2/Git-Branching-Branches-in-a-Nutshell}.
You can find out about github branches at \url{https://help.github.com/en/articles/about-branches}.
You can find out about pull requests at \url{https://help.github.com/en/articles/about-pull-requests}.
You can reach these resources through the lists at \url{https://help.github.com/en}.
A future version of this guide will contain more details. For now, use the above links to learn more. Then take the github tutorial at \url{https://lab.github.com/githubtraining/introduction-to-github}.
An even better, although more time-consuming approach, would be to read the *ProGit* ebook, available at \url{https://git-scm.com/book/en/v2}. Section 6.2, *Contributing to a Project*, contains a detailed example of creating a branch, modifying it, then submitting a pull request to the project owner.

