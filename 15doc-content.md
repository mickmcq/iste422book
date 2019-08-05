
<!--
  [font=Myriad Web Pro 300px]
  [text-color=#B0FFFF]
  [shading-color=#111122]
  [stage-color=#111122]
  [#111122]
  -- [text-color=orange]
  documentation
  # documentation
  #   is important
  # it can differ from
  #   one place to another

-->

# Documentation

## Five worlds
Joel Spolsky claims that developers live in one of five worlds: shrink\-wrap, internal, embedded, games, and throwaway. Each world faces different problems with documentation.

<!--
  --
  Spolsky claims
  there are 5 worlds
  # Software developers all
  #  live in one of these
  #  five worlds

  --
  ✓ shrinkwrap
  ✓ internal
  ✓ embedded
  ✓ games
  ✓ throwaway
  # each world faces different
  #  documentation problems
-->

For example, I had a student who worked in a nuclear power plant. All software was heavily documented and regular code review sessions were held with specialists in documentation among others. There was no question about the amount of documentation because failure to document was a firing offense. It was a firing offense because regulators believe another Chernobyl is possible and regulators review the code as carefully as internal specialists. For regulators, poor documentation is not just a firing offense but an excuse to shut down the entire plant.

<!--
  --
  example:
  nuclear power plant
  # Former student worked in a
  #  nuclear power plant
  # Heavy documentation
  # Regular review sessions
  # Failure to document was
  #  a firing offense
  # Pitiless external regulators
  #  regularly reviewed docs
  # Regulators can shut down
  #  the entire plant

-->

The problem that my student noted with the documentation in the nuclear power plant was that it was difficult to control either the quality of the readers or writers of documentation. It was still possible for extensive documentation to be faulty and it was still possible for others, whether developers, reviewers, or regulators using the documentation to fail to read it properly.

<!--
  --
  power plant problems
  # Student said they couldn't
  #  control reading or writing
  # Still possible for extensive
  #  docs to be faulty and still
  #  possible for readers to fail
  #  to read properly

-->

So documentation is difficult to produce and difficult to evaluate. This means that, in some of the five worlds, there may be little attention to documentation. It may be that only when sufficient resources are available because of regulatory obligations or deep pockets, that developers try to produce adequate documentation. I have encountered the most extensive documentation in the regulatory environment and in regulated businesses. For example, a student in this class was employed by a very large financial institution and found the emphasis on documentation to be considerable. Even though deadlines were tight, resources were always available to try to improve documentation.

<!--
  --
  difficult to produce
  difficult to evaluate
  # Good documentation is hard
  #  both to make and judge
  # May place little emphasis
  #  on docs except if external
  #  regulation or deep pockets

  --
  financial institutions
  # Another student in this class
  #  worked for a major investment
  #  bank where, despite tight
  #  deadlines, resources for good
  #  documentation were always
  #  available.
  # Why? Large amounts of money
  #  riding on results

-->

We can't really do much about the problem of inadequate documentation or inadequate devotion of resources for documentation but we can discuss the problem of poorly read and written documentation. There is a long history of people thinking publicly about improving documentation.

<!--
  --
  can't solve $$ probs
  # We have to restrict ourselves
  #  to discussing what can be
  #  done to improve documentation
  #  if and when resources are
  #  available.

  --
  long history of writing
  about documentation
  # There have been many
  #  computer scientists
  #  and others thinking and
  #  writing about docs.
  # Let's look at four
  #  developments in that
  #  history.

-->

## Comments
The earliest and simplest form of documentation is the presence of comments interspersed throughout the code and read along with the code. 
Almost all programs are written in ASCII or UTF-8 and the facilities for formatting comments to make them more readable are limited.
For example, one problem with this form of documentation is the inclusion of graphics. 

<!--
  --[text-color=pink]
  comments
  # The first and simplest
  #  form of docs consists
  #  of comments interspersed
  #  throughout and read with
  #  the code.
  # Problems? Most programs
  #  are written in ASCII or
  #  UTF-8---few formatting
  #  tools.
  # Graphics are especially
  #  problematic

-->

Figure \ref{fiSICPfig2dot24} shows a picture from the influential book *Structure and Interpretation of Computer Programs* also known as *SICP*. The book was circulated in ASCII format for many years and the top picture shows how Figure 2.24 of that book was represented in ASCII format. I have used (in the distant past) ASCII diagrams in the comments of my own code.

<!--
  --[fiSICPfig2dot24.png]
  # Here are two versions of
  #  a picture from SICP
  # SICP is an influential
  #  book on programming
  # For years it was circulated
  #  in ASCII format and used
  #  diagrams like the top one

-->

\begin{center}
  \begin{figure}
    \includegraphics[width=4in]{fiSICPfig2dot24.png}
    \caption{two versions of a picture from SICP}\label{fiSICPfig2dot24}
  \end{figure}
\end{center}

Sarah Drasner has written about comments at
[Art of Comments](https://css-tricks.com/the-art-of-comments/).

<!--
  --
  more on comments at
  <tt>http://css-tricks.com/the-art-of-comments</tt>

-->

## Prettyprinting
Since at least the 1970s, utilities have existed to print code and documentation with some rudimentary formatting to make it easier to read. The first such utility may have been *grind*. This utility and its many descendants can interpret comment characters, such as `//` as introducing characters to be printed in a different font or color, to make them stand out or recede into the background depending on the task at hand. This makes it a little easier to focus on or ignore documentation as needed.

<!--
  --[text-color=pink]
  prettyprinting
  # Since the 1970s, there
  #  have been utilities to
  #  display code with some
  #  kind of formatting to
  #  make it more readable.
  # Such utilities usually
  #  recognize comments and
  #  can make them stand out
  #  or fade into the back-
  #  ground as needed

-->

Today, most useful IDEs and text editors have syntax highlighting facilities that recognize documentation and bring it into the foreground or push it into the background as desired.

<!--
  --
  syntax highlighting
  # A logical outgrowth of
  #  prettyprinting is syntax
  #  highlighting in editors
  #  and IDEs.
  # Some syntax highlighters 
  #  can alter symbols as well
  #  as changing fonts and
  #  colors.
  # Syntax highlighting pushes
  #  comments into the fore-
  #  ground or background.

-->

## Automatic documentation
The presence of comments to be ignored by a program in code presents an opportunity for another program to process the same code and take seriously that which is ignored by the target compiler. For example, an automatic documentation program called *Doxygen* looks for and formats any comment prefaced by three slashes instead of two slashes. The additional slash does not bother the target compiler but can be taken advantage of by *Doxygen* to provide more sophisticated assembling and formatting of comments meant to be read as a contiguous document.

<!--
  --[text-color=pink]
  automatic
  documentation
  # Comments meant to be
  #  ignored by the target
  #  compiler can instead be
  #  the material for another
  #  program that processes
  #  only the comments.
  # Doxygen is an example
  #  of an automatic documentation
  #  program that looks for comments
  #  preceded by three slashes
  #  instead of two and formats them

-->

Other automatic documentation systems go further. Java\-doc is an example of a genre of documentation programs that use tags ignored by compilers or repurposed by compilers to generate a complete set of documentation.

<!--
  --
  javadoc
  # Javadoc goes further, using
  #  tags ignored by compilers
  #  to create a system of html
  #  documentation.

-->

## Literate programming
The zenith of thinking about the problems of documentation was reached by the 1980s with the advent of literate programming. This was a movement started by Donald E. Knuth with the basic premise that it is as important for programs to be read by humans as for programs to be read by computers. Knuth believed that programs might be more easily read by humans if presented in a different order from the order in which they were presented to compilers. At the same time, it would not suffice to write the program twice, once for humans and once for compilers. Instead, it would be better to intersperse tags into the program that would allow it to be written once and assembled twice for its two different audiences, human and machine.

<!--
  --[text-color=pink]
  literate programming
  # By the 1980s, Knuth began
  #  the literate programming
  #  movement, claiming that it
  #  was as important for programs
  #  to be read by humans as by
  #  computers.

  --
  one file for people
  and computers
  # Knuth claimed that the best
  #  way to do this was to write
  #  both the text for people and
  #  for computers in one file.
  # Knuth invented a language in
  #  which to do this.

-->

Knuth's solution to this problem was to write a new programming language. Unfortunately, he called it Web (this was the 1980s) so it can be hard to find information about it today even though many versions of it exist now and are in practical use.

<!--
  --
  web (1980s)
  # Unfortunately, Knuth called the
  #  language web (this was the 1980s)
  #  so it can be hard to find info
  #  about it even though its offspring
  #  are still being used in 2018.

  --
  pascal + TeX
  # The original web language allowed
  #  the programmer to mix pascal and
  #  TeX in the same file, to be decoded
  #  by a pascal compiler and a tex
  #  interpreter to produce object code
  #  and a postscript document

-->

Knuth believed that sophisticated graphics should be mixed in with program source code to explain the workings of a program to a human. Other people used versions of Knuth's code to develop languages to describe graphics in words so that these graphics could be interleaved with the comments without the programmer needing to leave the source code file to create the graphics. The bottom picture in the SICP figure shows an example of the output of such a language.

<!--
  --
  graphics + code
  # Knuth believed that sophisticated
  #  graphics should be mixed in with
  #  program source code to explain the
  #  workings of a program to a person.

  --[fiSICPfig2dot24.png]
  # The bottom version of this picture
  #  was produced by writing words to
  #  describe what the picture should
  #  look like instead of a drawing
  #  program. This way, the picture
  #  can be stored in the source file.

-->

Knuth's language was meant to be used with a programming language and a documentation language. For example, I have used it with C as the programming language and LaTeX as the documentation language.

<!--
  --
  c + latex
  # There are many descendents of
  #  the original web language. For
  #  example, I have used a language
  #  called c-web to mix c with latex.
  # There end up being three languages
  #  in each source file and c-web
  #  untangles them into c code and
  #  latex documentation as a pdf

-->

The programmer writes the program, say in C, interspersed with the documentation, say in LaTeX, and includes statements in the Web language that tells how the program is to be put together in two separate ways, once as a pdf for humans and once as a series of C source files and header files for the compiler. The Web language comes with a program to produce these two outputs, one in the compiler's language and one in the documenter's language.

Web itself has never attained great popularity but has had enormous influence over the development of many of the document generators in the following list.

<!--
  --
  web's influence
  # Web itself was never popular
  #  but you can find many
  #  documentation generators
  #  based on it in use today

-->

\begin{sloppypar}
\noindent
\url{https://en.wikipedia.org/wiki/Comparison_of_documentation_generators}
\end{sloppypar}

My experience with Web and its descendants has been that there are three problems limiting its popularity. First, when nearing deadlines, it becomes tempting to fix bugs directly in the output file intended for the compiler. In this way, the .web file gets out of sync with the .c files and the documented version of the program differs from the production version. Second, when a team uses Web, if even one member does not know it or has trouble learning it, documentation and source code get out of sync. The third problem is, of course, the problem discussed at the beginning of this section. Even if the documentation produced by Web is complete, there is no guarantee that it has high quality or that those reading it are competent consumers of the information.

<!--
  --
  three problems
  # My experience is that there
  #  are three problems limiting
  #  the popularity of literate
  #  programming.

  --
  deadlines
  # First is that, near deadlines,
  #  it is tempting to skip the
  #  first step and just write program
  #  code, leaving the documentation
  #  part to be done later. This gets
  #  the source and documentation out
  #  of sync.

  --
  teamwork
  # Second is that, on a team, if
  #  even one member doesn't know
  #  literate programming, source
  #  and documentation get out of
  #  sync and others have to expend
  #  extra effort to get it back in
  #  sync.

  --
  no quality guarantee
  # The problem mentioned at the
  #  beginning of this talk was that
  #  there is no guarantee that the
  #  documentation produced by any
  #  method is of high quality. It
  #  is harder to evaluate documentation
  #  than to evaluate code.

-->

## Closing thought
The foregoing assumes that documentation is important. The blog
[Coding Horror](https://blog.codinghorror.com/if-it-isnt-documented-it-doesnt-exist/) famously made the claim that *if it isn't documented, it doesn't exist*, and a lively debate over the importance of documentation ensued. Some Agile advocates claim that non-software artifacts should approach zero. Others insist that documentation is an element of software and immune to that claim. Other views abound. FOr example, one blogger whose name I intentionally forgot claims that all documentation is bad therefore don't do it! Read the comments on the above blog post and think about it!

<!--
  --[text-color=pink]
  in closing
  # This talk has assumed that
  #  documentation is important.
  #  Is it?

  --
  <i>if it isn't documented,
  it doesn't exist</i>
  # This claim has been famously
  #  made at the blog Coding Horror.
  # But there is an opposing view
  #  in the agile community that
  #  documentation should not be
  #  necessary or even advisable.
  # What is your view?

  --
  can code document itself?
  # Some people, notably Robert
  #   Martin in Clean Code, believe
  #   that all code should document
  #   itself. Can it? Can it tell,
  #   for instance, why it was written?

  --
  is documentation doomed?
  # one blogger claims that documentation
  #   is human and therefore doomed to
  #   be bad so you shouldn't write any.
  #   What is wrong with that view?

  --
  END

-->
