
# Build utilities

Even small software projects involve multiple files and dependencies among files. For example, a Hello World program in java requires you to 

- write code in a source file
- use `javac` to compile that source
- use `java` to run the compiled file

In this exceptionally simple case, updating the source code in `hello.java` requires that we then update the file `hello.class` to see any changes. Automating this process makes it easier to create targets larger than toy programs.

As a slightly larger example, this set of lecture notes consists of about twenty source files and a dozen graphics files. If I change one word, all these files have to come into play to rebuild the pdf file. To do this task, I use the oldest of all build utilities, `make`. Whenever I change any file in this project, I type the word `make` at the command line and the pdf file is recreated. I'll continue with this example as I describe build utilities, starting with this very old utility and then talking about more contemporary build utilities.

## Make
The first build utility was devised around 1976 in response to programmer frustration. This is documented in *The Art of Unix Programming* by Eric Raymond. The utility is called Make and remains in widespread use in the twenty-first century.

The simplest way to use Make is to create a file called `Makefile` in the root directory of a project. This file specifies all the dependencies between files in the project and the tools required to build the project. As an example, consider the `Makefile` for these lecture notes.

```Makefile
rerun    = "Rerun to get cross-references right"
basename = book
latex    = xelatex
option   = -jobname $(basename) '\input{preamble-basic.tex}'

all : $(basename).tex
	$(latex) $(option) || true
	grep -q $(rerun) $(basename).log \
	     && $(latex) $(option) \
	     || true

$(basename).tex : $(basename)-content.md
	pandoc                           \
	  -t latex                       \
	  --bibliography $(basename).bib \
	  --template pandocNotes         \
	     $(basename)-content.md      \
	  -o $(basename).tex

$(basename)-content.md : 0*.md 1*.md
	cat                              \
	  01intro-content.md             \
	  02develMeth-content.md         \
	  03diagrams-content.md          \
	  04versionCtrl-content.md       \
	  05buildUtil-content.md         \
	  06testing-content.md           \
	  07errors-content.md            \
	  08generic-content.md           \
	  09reverse-content.md           \
	  10efficient-content.md         \
	  11stateMachine-content.md      \
	  12applDeploy-content.md        \
	  13help-content.md              \
	  14packaging-content.md         \
	  15doc-content.md               \
	  16appendices-content.md        \
	  > $(basename)-content.md
clean :
	rm $(basename)-content.md *.log *.aux *.out *~
```

### Make rules
We'll look at this in more detail later but for now it is enough to know that the main body of the file consists of a series of *rules*. The general format for these rules, as given in the GNU make manual, is as follows.

```Makefile
target ... : prerequisite ...
        command
        ...
```

You can see that the rule has three parts, a target or targets, a prerequisite or prerequisites, and a command or commands. A rule tells us two main pieces of information: (1) what files are required to make a target and (2) how to make the target.

The *target* is the name of a file or the name of an action. The above example has four targets: `all`, `$(basename).tex`,\linebreak
`$(basename)-content.md`, and `clean`. Two of these are actions and two are the names of files. Actions can be specified when running the `make` command, but don't have to be. By default, `make` will try to satisfy the first rule it encounters in a file called `Makefile` in the present working directory. Chapter 14 of the GNU make manual recommends that the default target of any `Makefile` should be `all`. Notice that the other action, `clean`, is not a prerequisite of any other target. As a result, it will only be satisfied whenever you explicitly name it from the shell by saying

```bash
make clean
```

The *prerequisite* is a file or files required to make the target. Notice that in the above Makefile, the prequisites for the first and second rules are the targets for the second and third rules. In other words, there is a series of files being processed, with the output being other files. In this case, there are sixteen files whose names end in `.md` to be concatenated into a single `.md` file, called `$(basename)-content.md`. That file is then used to produce\linebreak
`$(basename).tex`. That file is then used in the rule to make `all`. Its output is a file called `$(basename).pdf` which is the file you are reading now.

The *command* has to be some command that can be run by the shell. In the above case, there are several commands, including `cat`, `pandoc`, `$(latex)`, `grep`, and `rm`. The command `cat` concatenates files together and lists them. The command `pandoc` converts Markdown files into other document formats, in this case \LaTeX\ documents. The command `$(latex)` converts \LaTeX\ documents into other document formats, in this case `.pdf`. The command `grep` searches files for a text string, in this case `$(rerun)`. The command `rm` removes files.

In addition to rules, a Makefile can have other things, including definitions. The beginning of the above Makefile is a series of definitions. These are pieces of text that might be reused and might change from time to time, so that it is more convenient to rewrite it in one location rather than searching and replacing throughout the Makefile. The definitions are automatically replaced when you use the construct `$(name)`. For example, when you say `$(rerun)` in the above Makefile, it is replaced by the text

```
Rerun to get cross-references right
```

\noindent before `make` does anything else.

The above Makefile contains four definitions. You can look through the Makefile to see where the four names are replaced by their definitions. 

### Other aspects of this Makefile
It is not important for you to understand the the commands given in the Makefile but a few more features may be of interest. These are all based on the fact that the `command` portion of the Makefile is run through a shell, so everything in the `command` must be compatible with whatever shell you use. I use `bash` almost exclusively, so there are a few features of `bash` in this Makefile.

The symbol `||` means *or* to `bash` so whenever I say

```bash
command || command
```

\noindent `bash` interprets this to mean to run the first command and then to run the second command whether the first command returns a successful exit code or not.

The symbol `&&` means *and* to `bash` so whenever I say

```bash
command && command
```

\noindent `bash` interprets this to mean to run the first command and then to run the second command ONLY if the first command returns a successful exit code.

The symbol `\ `, when it appears at the end of a line, means that the command continues on the next line so `bash` interprets a series of short lines as if it were one long line. I do this because I find it easier to read a lot of short lines than one very, very long line.

## Hello world with Make
To introduce Make at a practical level, start with a Hello, World program to be built using Make. Type the following C code into a file called `hello.c` in a hello directory.

```c
#include <stdio.h>
int main(int argc, char ** argv) {
  printf("Hello, world\n");
}
```

Next, in the same directory, type the following into a file called `Makefile`. Notice that you are typing one rule, with one target, one prerequisite, and one command.

```Makefile
hello : hello.c
  gcc hello.c -o hello
```

Be sure that the ONLY character on the line with `gcc` before `gcc` is a tab character. Make will issue an error message if you use spaces or a combination of tabs and spaces. Plus, depending on how your editor is set up, a space followed by a tab may take up exactly as much room as a tab by itself! The error message may look something like this.

```bash
Makefile:2: *** missing separator.  Stop.
```

The simplest solution may be to delete everything before `gcc` on the line. Then insert a single tab character.

The process of creating the `hello` program is to type the word `make` in the terminal after you have created the above two files. Then you can type `./hello` to run the program. The reason you have to type `./` before the `hello` part is to make Linux look in the current directory for it. By default, for security reasons, Linux does not look in the current directory for programs to run. This is in contrast to other operating systems, some of which will happily run `virus.exe` in the current (usually Downloads) directory.

Notice that, if you run `make` again, it will issue the following message.

```bash
make: 'hello' is up to date.
```

\noindent This is because `make` can see that the timestamp on `hello.c` is older than the timestamp on `hello`, meaning that `hello` was created with the current copy of `hello.c` so `make` does not need to be run again.

## An example of Make with lex
Next, try a slightly more complicated example. This is a contrived example because there are simpler ways to do what you're going to do. This simply illustrates the use of `make` in a longer toolchain. Like the next two examples, this comes from @Mecklenburg2005.

The main difference here is that you need to create multiple object files. It is common that software projects create multiple object files although here you're going to do so to accomplish a trivial task, counting the occurrences of some specific words.

To count words, you're going to use a lexical analyzer generator. This is a program that is used to create compilers that are then used to compile human-written programs into object code. We're going to use the lexical analyzer generator to generate a lexical analyzer or, more specifically, a scanner to scan words looking for certain words. The scanner then performs an action every time it sees one of the target words. In this very simple case, that action will be to increment a counter.

Start by creating the C program that will call the scanner and report its output. Type the following code into a file called\linebreak `countWords.c`.

```c
#include <stdio.h>
extern int feeCount, fieCount, foeCount, fumCount;
extern int yylex(void);
int main(int argc, char ** argv) {
  while(yylex())
    ;
  printf("%d %d %d %d\n",feeCount,fieCount,foeCount,fumCount);
}
```

Next, create the rules for the scanner. Put these into a file called `lexer.l`.

```lex
	int feeCount=0;
	int fieCount=0;
	int foeCount=0;
	int fumCount=0;
%%
fee	feeCount++;
fie	fieCount++;
foe	foeCount++;
fum	fumCount++;
.
\n
```

There are many tabs in the above file. You will get error messages if you do not type the file in exactly as written. The first four lines each have exactly one tab character before `int`. The incrementing lines (fee, fie, foe, and fum) have exactly one tab character between the words `fee`, `fie`, `foe`, and `fum`, and the incrementing variable, e.g., `feeCount++`.

Finally, write the Makefile, establishing the relationships between these files and the other, intermediate files, that will be created in the process of making the `countWords` program. Type the following into a file called `Makefile`. Notice that you are typing in five rules, each with a target, zero or one or two prerequisites, and each with one command.

```Makefile
countWords : countWords.o lexer.o
	gcc countWords.o lexer.o -lfl -o countWords

countWords.o : countWords.c
	gcc -c countWords.c

lexer.o : lexer.c
	gcc -c lexer.c

lexer.c : lexer.l
	flex -t lexer.l > lexer.c

clean :
  rm *.o lexer.c
```

Again, remember that lines with commands must start with a tab character. There are four lines with commands, three of which start with `gcc`. The fourth starts with `flex`, which is a free version of `lex`.

The construct `-lfl` refers to the static library of `flex` which is required for linking the object files into the final executable. The command may require you to be more explicit about the location of this library. On my copy of Ubuntu 16.04, the above command works and finds the required library in

```bash
/usr/lib/x86_64-linux-gnu/libfl.a
```

\noindent and associated files in that same directory. On Mac OS X on the other hand, I have installed `flex` using MacPorts and must issue the above command with

```bash
-L /opt/local/lib
```

\noindent just before the string `-lfl` so that `gcc` looks in the right place.

The above build failed until I ran the following commands. You may not need all these commands to succeed so first try running `make` to see the output. If that fails, run `make clean` then the first command below then try `make` again. If that fails, try the whole sequence.

```bash
sudo apt-get install flex
sudo apt-get -f install
make clean
```

\noindent
The `make clean` command is especially important because, if you did not have a working copy of `flex` you will have an updated but empty copy of `lexer.c`. This will prevent `make` from invoking `flex` when you do get it running. This is because `make` is smart enough to look at timestamps to determine what to run but not smart enough to look into files and see what is there. Any construct of the form `badcommand >somefile` will produce `somefile` even if `badcommand` does not exist. This is an easy trap to fall into if you are not used to working with I/O redirection.

It is unlikely but possible that you'll need to run the following additional commands. These simply bring your system up to date with the latest patches.

```bash
sudo apt-get update
sudo apt-get upgrade
```

## Adding automatic variables to a Makefile
Makefiles can include shortcuts called *automatic variables* to simplify your work and make it easier to reuse. These automatic variables are described in detail in Chapter 10, Section 10.5.3 of the GNU make manual. To introduce a couple of them, revise your previous work to take advantage of automatic variables.

Begin by creating a new directory and copying some of your previous work into it.

```bash
cd ~/422/cw1
mkdir ~/422/cw2
cp -p lexer.l countWords.c Makefile ~/422/cw2/
cd ~/422/cw2
```

Now modify the Makefile to have the following content.

```Makefile
countWords : countWords.o lexer.o -lfl
	gcc $^ -o $@

countWords.o : countWords.c
	gcc -c $<

lexer.o : lexer.c
	gcc -c $<

lexer.c : lexer.l
	flex -t $< > $@

clean :
	rm *.o lexer.c
```

You can test that this works by saying `make` then, if you get no errors, say something like the following at the terminal prompt.

```bash
echo 'fee fie' | ./countWords
```

\noindent which should give output like `1 1 0 0` depending on your input.

Then use a command like `vimdiff ../cw1/Makefile Makefile` to examine the differences between the two files. You should notice three symbols plus a few other differences. Here are brief definitions of the symbols. Complete definitions can be found in the GNU Make manual, Section 10.5.3.

- `$^` means the names of all the prerequisites of the current rule, with a space between each one. Note that you're cheating a little here because `-lfl` is not strictly a prerequisite. Instead it is a qualifier to the prerequisites but it is advantageous to treat it as if it were a prerequisite in this case because that way it gets added to the command in the right place.

- `$@` means the name of the target of the current rule.

- `$<` means the name of the first prerequisite of the current rule. When we use it here, there is only one prerequisite for the given rule.

These automatic variables don't do a great deal. They just save some typing and reduce the chances of errors whenever we modify the file because we only specify something in one place instead of in two places. Much of the value of build utilities lies in this kind of small savings.

## Further shortcuts to Make
If you obey a few conventions, you can shorten the Makefile. Some of these conventions are meant to allow you to construct more elaborate software systems but, for this example, just use them to keep counting occurrences of fee, fie, foe, and fum. Execute the following commands.

```bash
cd ~/422/cw2
mkdir -p ~/422/cw3/include
mkdir ~/422/cw3/src
cp -p countWords.c ~/422/cw3/src/
cp -p lexer.l ~/422/cw3/src/
cd ~/422/cw3/include/
```

Next, create the following two header files, both in the `include` subdirectory. First is `counter.h` as follows.

```c
#ifndef COUNTER_H_
#define COUNTER_H_
extern void
counter(int count[4]);
#endif
```

\noindent The other header file should be called `lexer.h` and created in the same subdirectory.

```c
#ifndef LEXER_H_
#define LEXER_H_
extern int feeCount, fieCount, foeCount, fumCount;
extern int yylex(void);
#endif
```

Next, change to the `src` subdirectory and create a new file called `counter.c` as follows.

```c
#include <lexer.h>
#include <counter.h>
void counter(int counts[4]) {
  while (yylex())
    ;
  counts[0]=feeCount;
  counts[1]=fieCount;
  counts[2]=foeCount;
  counts[3]=fumCount;
}
```

Next, modify `countWords.c` so it looks like the following code. You may want to start from scratch but there are some things that are the same as the previous `countWords.c` file so you may prefer to modify that. It is your choice.

```c
#include <stdio.h>
#include <counter.h>
int main(int argc, char ** argv) {
  int counts[4];
  counter(counts);
  printf("%d %d %d %d\n",
    counts[0],counts[1],counts[2],counts[3]);
}
```

Finally, the last thing to do in the `src` subdirectory is to modify the `lexer.l` program. This file differs only slightly from the previous `lexer.l` so you are definitely better off modifying it than starting from scratch.

```lex
%{
#include <lexer.h>
%}

	int feeCount=0;
	int fieCount=0;
	int foeCount=0;
	int fumCount=0;
%%
fee	feeCount++;
fie	fieCount++;
foe	foeCount++;
fum	fumCount++;
.
\n
```

Now you are ready to write the Makefile and build the system. The Makefile is quite a bit shorter than what you've done so far, even though you've added more files to the system. Change to the parent directory, `cd ..` and type the following into a file named `Makefile`.

```Makefile
VPATH=src include
CPPFLAGS = -I include

countWords : counter.o lexer.o -lfl
countWords.o : counter.h
counter.o : counter.h lexer.h
lexer.o : lexer.h
```

\noindent Now the entire directory structure should look like this.

```
cw3/
  include/
    counter.h
    lexer.h
  src/
    counter.c
    countWords.c
    lexer.l
  Makefile
```

Say `cd ~/422/cw3` and if you then run the command `find`, you should see output like this. If you don't, some file is missing.

```bash
.
./src
./src/countWords.c
./src/lexer.l
./src/counter.c
./Makefile
./include
./include/counter.h
./include/lexer.h
```

Now run `make` while you're in the `~/422/cw3` directory and you should see output like this.

```bash
cc  -I include  -c -o countWords.o src/countWords.c
cc  -I include  -c -o counter.o src/counter.c
lex  -t src/lexer.l > lexer.c
cc  -I include  -c -o lexer.o lexer.c
cc   countWords.o counter.o lexer.o
     /usr/lib/x86_64-linux-gnu/libfl.so   -o countWords
```

Test your output by saying something like the following at the terminal prompt.

```bash
echo 'fee fie' | ./countWords
```

What you have done is to take further advantage of Make's propensity to make assumptions if you follow conventions. Notice that, in this latest Makefile, you didn't include any commands. In every case, `make` assumed a command based on the target and prerequisite. If our program files, including `lexer.l`, `counter.c`, and `countWords.c` all have basenames the same as their target and prerequisite counterparts, they will be found and used automatically.

The foregoing is just a cursory introduction to Make. It can be used in many elaborate ways to build software and is in common use today. The other build utilities we'll discuss are attempts to improve on Make. Generally, later build utilities try to add ease of use rather than features. Make has most of the features.

## Apache Ant
A more contemporary build utility is Apache Ant, developed in the early twenty-first century as a Java-specific replacement for Make. Apache Ant uses XML to describe the build process and relationships between files.

## Hello World with Apache Ant
Follow the tutorial at Apache Ant's website to construct a Java Hello World program with Apache Ant. Following is most of that tutorial, slightly modified to work in our VM.

Start by making the directory structure.

```bash
cd ~/422 && mkdir 05build && cd 05build
mkdir -p src/oata
cd src/oata
```

Then create the `HelloWorld.java` file in the `src/oata` folder and put the following code into it.

```Java
package oata;
public class HelloWorld {
  public static void main(String[] args) {
    System.out.println("Hello World");
  }
}
```

Verify that it works by saying the following at a terminal prompt.

```bash
cd ../..
mkdir -p build/classes
javac -sourcepath src -d build/classes \
  src/oata/HelloWorld.java
java -cp build/classes oata.HelloWorld
```

If this is correct, you should see the string "Hello World" in the terminal. Now create a runnable jar file containing this code by saying the following at a terminal prompt.

```bash
echo "Main-Class: oata.HelloWorld" >myManifest
mkdir build/jar
jar cfm build/jar/HelloWorld.jar myManifest -C \
  build/classes .
java -jar build/jar/HelloWorld.jar
```

Here again you should see the string "Hello World" displayed in the terminal. What you have just accomplished is a manual process for creating software---next try to automate that process.

## The Ant build process
The build process includes compiling, running, and, in this case, putting the code into a jar file. Generally you would only use Apache Ant for a large enough project that it would be worthwhile to create a jar file. Apache Ant uses XML to describe the build process and the relationships between files so verify you are in the `05build` directory and write the following XML into a file called `build.xml`.

```XML
<project>
  <target name="clean">
    <delete dir="build"/>
  </target>
  <target name="compile">
    <mkdir dir="build/classes"/>
    <javac srcdir="src" destdir="build/classes"/>
  </target>
  <target name="jar">
    <mkdir dir="build/jar"/>
    <jar destfile="build/jar/HelloWorld.jar"
          basedir="build/classes">
      <manifest>
        <attribute name="Main-Class"
	          value="oata.HelloWorld"/>
      </manifest>
    </jar>
  </target>
  <target name="run">
    <java jar="build/jar/HelloWorld.jar" fork="true"/>
  </target>
</project>
```

Ant assumes the filename `build.xml` so you can now run Ant in this folder by saying

```bash
ant compile
ant jar
ant run
```

I'm only asking you to do it this way to see where any errors exist more easily. It would be slightly more convenient in the long run to say

```bash
ant compile jar run
```
\noindent although even this is longer than we might like. Recall that you could run Make by saying `make` so you can probably imagine that you can alter the `build.xml` file so you can do the same with Ant. You can actually do a lot of the same things with Ant that you did with Make, so alter your `build.xml` to use some shortcuts just as you did before. Modify the `build.xml` so it looks as follows.

```XML
<project name="HelloWorld" basedir="." default="main">
  <property name="src.dir" value="src"/>
  <property name="build.dir" value="build"/>
  <property name="classes.dir"
           value="${build.dir}/classes"/>
  <property name="jar.dir"
           value="${build.dir}/jar"/>
  <property name="main-class"
           value="oata.HelloWorld"/>

  <target name="clean">
    <delete dir="${build.dir}"/>
  </target>
  <target name="compile">
    <mkdir dir="${classes.dir}"/>
    <javac srcdir="${src.dir}"
           destdir="${classes.dir}"/>
  </target>
  <target name="jar" depends="compile">
    <mkdir dir="${jar.dir}"/>
    <jar destfile="${jar.dir}/${ant.project.name}.jar"
           basedir="${classes.dir}">
      <manifest>
        <attribute name="Main-Class"
		  value="${main-class}"/>
      </manifest>
    </jar>
  </target>
  <target name="run" depends="jar">
    <java jar="${jar.dir}/${ant.project.name}.jar"
         fork="true"/>
  </target>
  <target name="clean-build" depends="clean,jar"/>
  <target name="main" depends="clean,run"/>
</project>
```

Now you can just say `ant` in the `05build` directory to clean, compile, jar, and run. You can be sure of your current directory by saying `pwd`.

## Contemporary build utilities
It is safe to say that most contemporary build utilities use either XML or Makefiles as a basis for describing dependencies. So Make and Ant represent a good introduction to the world of build utiltiies. But contemporary utilities may differ in many ways.

Both utilities we've examined have issues that drive the popularity of newer utilities. First, consider Make. This utility is shipped with Unix and assumes the build occurs on Unix. In other words, Make was written without considering the possibility that a developer might want to seamlessly port code from one OS to another. Make offers a facility to do a lot of low-level tasks using OS-specific programs. Make also lacks any built-in intelligence about many aspects of the build process. Although many Makefiles are complex, the complexity is more a result of the need to be explicit about many issues than because complexity is a desirable feature.

Second, consider Ant. Like Make, Ant may suffer from necessary but undesirable complexity as a result of its XML syntax. This syntax is declarative and can overcome system-specific issues as a result. (Historically, Ant was developed because of proprietary restrictions on a version of Make, not because the developers wanted to improve Make, though.) But the very property that overcomes system-specificity can result in overly complicated declarations. A subtler problem with Ant is that its early popularity prevented improved versions from taking hold because of their propensity to break existing Ant build files.

## Gradle
This build utility differs in a major way from Ant and Make. It uses a domain-specific language extended from Groovy, a Java variant. That means you can write Java-like code in the build utility. This may be a more comfortable environment for software developers who are used to programming in Java or a Java-like language. Following is a tutorial based on the official Gradle tutorial, available on Youtube or at gradle.org.

## Gradle documentation
Gradle documentation can be found on the virtual machine at `/usr/share/doc/gradle` in html form.

## Gradle hello world
As your first exposure to Gradle, switch to the 422 folder in the virtual machine and write a `build.gradle` file, the default filename that Gradle looks for when you invoke it. In this `build.gradle` file, you will start by writing a task, the basic unit of work in Gradle. All your file needs to begin is the single line,

```java
task helloWorld
```

Now you can run gradle but you won't see any results beyond the following.

```
Starting a Gradle Daemon (subsequent builds will be faster)
> Task :help
Welcome to Gradle 4.3.1.
To run a build, run gradle <task> ...
To see a list of available tasks, run gradle tasks
To see a list of command-line options, run gradle --help
To see more detail about a task, run gradle help --task <task>

BUILD SUCCESSFUL in 4s
1 actionable task: 1 executed
```

Notice that gradle found one task, although there was no work associated with that task. What was that task? Notice that you have been prompted to say `gradle tasks` to get a list of valid tasks. I found that I had to run `gradle tasks --all` to get the desired result but your mileage may vary. Running that gave me a long list of tasks, including `helloWorld` under other tasks. You can also say

```bash
gradle helloWorld
```

\noindent
which will give a \textsc{build successful} message but nothing else. There is not yet any work associated with the task. You can associate some Groovy code with the task to convince yourself that a Gradle build is a program. Modify the `build.gradle` file as follows.

```java
/*
 * A task is an object.
 * A task has an API.
 * A task has a list of activities.
 * A Gradle build is a program
 */

task helloWorld
helloWorld {
  doLast {
    println "Hello, World"
  }
}
```

One method available via the task API is the `doLast` method, which appends an activity to the end of the list of activities. Now if you say

```bash
gradle helloWorld
```

\noindent
you will run a fragment of Groovy code and the familiar Hello, World phrase will be printed to the console, along with some other less important information. To get rid of the other information, you can append the `-q` option to gradle, meaning quiet.

```bash
gradle -q helloWorld
```

Next, divide this very simple task into two even simpler tasks to illustrate the notion that one task can depend on another task. Edit the `build.gradle` file as follows.

```java
/*
 * A task is an object.
 * A task has an API.
 * A task has a list of activities.
 * A Gradle build is a program
 */

task hello

task world

world {
  doLast {
    println "World"
  }
}

hello {
  doLast {
    print "Hello, "
  }
}
```

Now run the following three commands and note the different output from each.

```bash
gradle -q hello
gradle -q world
gradle -q hello world
```

Rather than invoking both tasks, now just invoke one by first introducing a dependency into the `build.gradle` file as follows.

```java
/*
 * A task is an object.
 * A task has an API.
 * A task has a list of activities.
 * A Gradle build is a program
 */

task hello

task world

world {
  dependsOn << hello
  doLast {
    println "World"
  }
}

hello {
  doLast {
    print "Hello, "
  }
}
```

Now you can say `gradle -q world` with the same effect as if you had invoked both tasks.

Next, invoke a dependency in a different way. Modify the `build.gradle` file as follows.

```java
/*
 * A task is an object.
 * A task has an API.
 * A task has a list of activities.
 * A Gradle build is a program
 */

task hello
task world
task helloWorld {
  dependsOn = [world, hello]
}

world {
  dependsOn << hello
  doLast {
    println "World"
  }
}

hello {
  doLast {
    print "Hello, "
  }
}
```

Now issue the following command.

```bash
gradle -q helloWorld
```

You should see the same result as above. There are three things to notice about this. First, you declared the task and described it in one step instead of in two steps as you did before. Second, you used different notation to express the dependency. Third, you did not get rid of the other dependency you previously introduced but that did not seem to bother Gradle.

Gradle produces a directed acyclic graph (often abbreviated \textsc{dag}) of the activities to be performed in a build. The term *acyclic directed graph* matters. It is directed in the sense that there is a direction to every edge in the graph. (An edge is a synonym for arc or link.) The graph is acyclic in the sense that there are no *loops* in the graph. An example of a loop would be $a \rightarrow b \rightarrow a$ where $a$ leads to $b$ and $b$ leads back to $a$.

In this case, the two statements of dependency are not contradictory. What if they were? For example, suppose hello depends on world and world depends on hello. The build would fail and the error message would tell you that there is a circular dependency. Try it. It is worthwhile to sometimes read error messages you expect. Modify the file as follows.

```java
/*
 * A task is an object.
 * A task has an API.
 * A task has a list of activities.
 * A Gradle build is a program
 */

task world
task hello

task helloWorld {
  dependsOn = [world, hello]
}

world {
  dependsOn << hello
  doLast {
    println "World"
  }
}

hello {
  dependsOn << world
  doLast {
    print "Hello, "
  }
}
```

Next, try jumbling the order of task declarations and specifications and inclusions. You should see that it has no effect on the order in which `hello` and `world` are processed. Why is that? It seems that, in the absence of any specific directive, Gradle processes tasks in lexical order. You can enforce an order by modifying the file as follows.

```java
/*
 * A task is an object.
 * A task has an API.
 * A task has a list of activities.
 * A Gradle build is a program
 */

task world
task hello

task helloWorld {
  dependsOn = [world, hello]
  hello.mustRunAfter world
}

world {
  doLast {
    println "World"
  }
}

hello {
  doLast {
    print "Hello, "
  }
}
```

\noindent
You can probably guess that there is also a `mustRunBefore` method available.

What about the dependency notations? Can you modify them? Yes, modify the file as follows.

```java
/*
 * A task is an object.
 * A task has an API.
 * A task has a list of activities.
 * A Gradle build is a program
 */

task helloWorld {
  dependsOn << world << hello
}

task world {
  doLast {
    println "World"
  }
}

task hello {
  doLast {
    print "Hello, "
  }
}
```

It doesn't work! But you can make it work by either (a) declaring `hello` and `world` before referring to them in `helloWorld` or (b) moving the description of `helloWorld` to after the other two declarations. Modify the file as follows.

```java
/*
 * A task is an object.
 * A task has an API.
 * A task has a list of activities.
 * A Gradle build is a program
 */

task world {
  doLast {
    println "World"
  }
}

task hello {
  doLast {
    print "Hello, "
  }
}

task helloWorld {
  dependsOn << world << hello
}
```

\noindent
You can say

```java
  dependsOn = [ world ] << hello
```

\noindent or

```java
  dependsOn << [ world , hello ]
```

\noindent
On the other hand, you can not use

```java
  dependsOn <<  world = [ hello ]
```

\noindent
and you may find it enhances readability to use one style at a time.

## Gradle plugin
Lots of plugins come with Gradle, including the java plugin you are going to use next. Create the following directory structure within the 422 directory. Then change to it and edit a new file.

```bash
cd ~/422
mkdir -p poetry/src/main/java/org/gradle/poetry
cd poetry/src/main/java/org/gradle/poetry
vi Poetry.java
```

Put the following code into the new file.

```java
package org.gradle.poetry;
import java.util.ArrayList;
import java.util.List;

public class Poetry {
  public List<String> raven() {
    List<String> lines = new ArrayList<String>();
    lines.add("Once upon a midnight dreary,");
    lines.add("while I pondered, weak and weary,");
    lines.add("Over many a quaint and curious");
    lines.add("volume of forgotten lore --");
    lines.add("While I nodded, nearly napping,");
    lines.add("suddenly there came a tapping,");
    lines.add("As of some one gently rapping,");
    lines.add("rapping at my chamber door --");
    lines.add("'Tis some visitor, I muttered,");
    lines.add("tapping at my chamber door --");
    lines.add("Only this and nothing more.");
    return lines;
  }
  public void emit(List<String> lines) {
    for (String line : lines) {
      System.out.println(line);
    }
  }
  public static void main(String[] args) {
    Poetry p = new Poetry();
    p.emit(p.raven());
  }
}
```

In order to build this program, write a `build.gradle` file in the root of this project.

```bash
cd ~/422/poetry
vi build.gradle
```

The contents of this file should be as follows.

```java
/*
 Compile java
 Run tests
 Copy static resources
 Format test results
 Build a JAR
 Create a top-level task that does all these things
 */

 apply plugin: 'java'
```

Now say `gradle tasks` and you will see that many more tasks are available. These include the tasks enumerated above as well as many others.

Now build the project by saying `gradle build`. Notice that, when this succeeds, you have a much larger directory structure. One way to view the structure is to install `tree` and run it. You may install it by saying `sudo apt install tree`.
You should notice that there is now a `Poetry.class` file in the `build` subtree. You may run it by saying (note the space)

```bash
java -cp build/classes/main/ org.gradle.poetry.Poetry
```

\noindent
but this will prove cumbersome if you add a lot of dependencies and need to extend the classpath. An easier way would be to have a task in gradle to run the command. This will prove especially easier if you later add dependencies or do other things that add to the complexity of running the code. Modify the `build.gradle` file as follows.

```java
/*
 Compile java
 Run tests
 Copy static resources
 Format test results
 Build a JAR
 Create a top-level task that does all these things
 */

apply plugin: 'java'

task raven(type: JavaExec) {
  main = 'org.gradle.poetry.Poetry'
  classpath = sourceSets.main.runtimeClasspath
}
```

Next, encode the stanza using Base64. This makes little sense from a poetic point of view but it demonstrates how Gradle is able to assist you in obtaining and using external modules. First, modify the Java code in three places. First, import the Base64 module. Second, tell the emit method to encode the line. Third, add the encode method. Your Java program should look like this.

```java
package org.gradle.poetry;
import java.util.ArrayList;
import java.util.List;
import org.apache.commons.codec.binary.Base64;

public class Poetry {
  public List<String> raven() {
    List<String> lines = new ArrayList<String>();
    lines.add("Once upon a midnight dreary,");
    lines.add("while I pondered, weak and weary,");
    lines.add("Over many a quaint and curious");
    lines.add("volume of forgotten lore --");
    lines.add("While I nodded, nearly napping,");
    lines.add("suddenly there came a tapping,");
    lines.add("As of some one gently rapping,");
    lines.add("rapping at my chamber door --");
    lines.add("'Tis some visiter, I muttered,");
    lines.add("tapping at my chamber door --");
    lines.add("Only this and nothing more.");
    return lines;
  }
  public void emit(List<String> lines) {
    for (String line : lines) {
      System.out.println(encode(line));
    }
  }
  public String encode(String text) {
    Base64 codec = new Base64();
    return new String(codec.encode(text.getBytes()));
  }
  public static void main(String[] args) {
    Poetry p = new Poetry();
    p.emit(p.raven());
  }
}
```

If you were operating entirely manually, you would now need to find and download the encoding mechanism and specify the correct classpath for it to be used. Instead, tell Gradle two pieces of information and you can compile and run the program as before. Modify the `build.gradle` file so it looks as follows.

```java
/*
 Compile java
 Run tests
 Copy static resources
 Format test results
 Build a JAR
 Create a top-level task that does all these things
 */

apply plugin: 'java'

repositories {
  mavenCentral()
}
dependencies {
  compile 'commons-codec:commons-codec:1.6'
}
task raven(type: JavaExec) {
  main = 'org.gradle.poetry.Poetry'
  classpath = sourceSets.main.runtimeClasspath
}
```

The repository called `mavenCentral` is at a URL known to Gradle so you don't have to specify where it is. 
It is at [Maven Central](https://repo1.maven.org/maven2/) in case you want to browse it.

The codec to be obtained from there is stored in a standardized format, allowing Gradle to get it without you knowing the details. In case you happen to want the details, you can browse to the above URL and drill down to the codec. Version 1.6 is from 2011 but it still works. You could substitute the most recent version, 1.9, and get the same result.

