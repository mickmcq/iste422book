
# Development methodologies

## Developing information systems

Businesses spend billions of dollars developing 
information systems. Almost all of the knowledge used to 
do so has been developed in the past fifty years and is 
considered immature and unstable in comparison with 
other fields of study.

## Representational state transfer

Representational state transfer is the approach to the 
architecture of the World Wide Web. It is the most 
fault-tolerant approach to system development in history 
and businesses are increasingly seeking opportunities to 
adopt it. It is not appropriate for certain business 
functions, however, and recent research indicates that 
many businesses experience failure with other approaches 
that they adopt because these approaches are marketed as 
representational state transfer. Hence, in \the\year\ it 
remains useful for general business professionals to 
understand enough about representational state transfer 
to be able to recognize prospects for its successful 
adoption in business and to distinguish between viable 
prospects and others.

## Development method rationale

Why do you need a development method?
You need a development method because experience shows that polishing repeatable processes works in many, many domains. Can you name some? Evidence-based medicine is an example. The project management body of knowledge (PMBOK) is another. The military decision making process (MDMP) is a third. Just in time (JIT), also known as Toyota Production System (TPS), and later known as lean manufacturing is one that has received extensive study.

Business leaders widely believe that repeatable, tunable processes are critical to management. Repeatable methods for developing information systems have been tried and studied since the 1970s and, while still an immature area, a few characteristics of development methods have emerged as prominent.

## Waterfall model

Most information systems courses teach two families of development methods. The older of these is the waterfall model. It is also called the SDLC, which stands for Systems Development Lifecycle Model.

In this course, we use the SDLC abbreviation in its other sense, that of a generic placeholder referring to any development model. The waterfall model has the following two characteristics.

First, it occurs in clearly defined and scheduled stages. The stages are named, planned, and staffed in advance. They usually have the following names or a similar set of names: requirements gathering, analysis, design, implementation, maintenance, and sunset.

Second, each party to a given project signs a formal agreement at the end of each stage, indicating that the stage has been completed to their satisfaction. This aspect gives rise to the word *waterfall* because, once the agreement is signed, there is no option to return to a previous stage. The water has flowed from that shelf down to the next shelf and can not be put back. It is this characteristic that most certainly determines the circumstances under which the model will be used. The stages are often listed to resemble a waterfall as shown below.

The waterfall model is all about administrative distance between participants and stakeholders and the need for written agreements that results. Administrative distance may lead to contracts, rules, or even laws. In the nuclear power plant case, everyone in range of fallout becomes a stakeholder and the administrative distance between citizens and operators escalates rapidly to the passing of laws.

When you think of the difference between, say, two divisions of a firm on the one hand and citizens and operators of a nuclear power plant on the other hand, it may strike you that the power imbalances surrounding written agreements vary a lot. No vendor and no customer is all-powerful (except whoever owns the Plants vs Zombies franchise---they may have unlimited power). Not only do the power imbalances between stakeholders differ, they are not always easy to measure. They may vary over time and the signals may not be easy to read until after reading them matters.

## Waterfall model picture

\begin{center}
\begin{itemize}
\item []{\color[rgb]{0.3,0.4,0.5} Initiation}
\ensuremath{\rightarrow}
  {\color{pink}Application Description}\ensuremath{\searrow}

\item
[]\ensuremath{\phantom{XX}\hookrightarrow}{\color[rgb]{0.3,0.4,0.5}Analysis}
  \ensuremath{\rightarrow}
  {\color{pink}Requirements Specification}\ensuremath{\searrow}

\item []\ensuremath{\phantom{XXXX}\hookrightarrow}
    {\color[rgb]{0.3,0.4,0.5}Design}\ensuremath{\rightarrow}
    {\color{pink} System Design}\ensuremath{\searrow}

\item []\ensuremath{\phantom{XXXXXX}\hookrightarrow}
      {\color[rgb]{0.3,0.4,0.5}Implementation}\ensuremath{\rightarrow}
      {\color{pink} Product}
\end{itemize}
\end{center}

## Circumstances favoring the waterfall

These characteristics mean that the waterfall model will only be used in circumstances where there is a clear separation of customer and developer organizations. The developers report through a different command chain than do the customers of the project. This approach should be used when there is the likelihood of lawsuits following disagreements. It should be used in cases where there is no clear common single point of authority over the developer and customer organizations to mediate disputes. Finally, it is most often used when large sums of money are involved and there must be clear consequences for failure specified at the beginning of the project.

This approach generally seems counterintuitive to students and its failures are legion. The so-called Obamacare website may be a current example, depending on which account you believe.

## Abysmal record, yet still common

It may surprise students to know that this was the very first and therefore longest-lived development method despite its abysmal record. It may make a worthwhile project to try to figure out why smart people keep selecting it. The reason may be that, increasingly, cooperation between autonomous, conflicting groups is needed for progress. The likelihood of disagreement may rise when a group feels powerful enough to successfully challenge another group and this likelihood is then doubly likely to arise if both groups feel powerful enough to successfully challenge each other. Also, business disagreements are often settled by litigation and preparation for litigation may be more prudent than preparation for mutual success.

## Trust issues

Last, and most obvious, is that every method developed since the waterfall model relies in part on trust between all parties and the absence of formal communication. Will the legal department recommend such an approach? This is a question asked at the start of each large project when deciding on the best approach.

Now, here's an important question. Do we live in a magic fairyland with rivers of chocolate where the children laugh and dance and sing? No. But organizations can't publicly admit that. Organizations insist they don't need the waterfall model because everyone plays nicely. But they must not really believe that because the second most popular development method after the waterfall model is to mix the waterfall model with an iterative process! So we function as a trusting team but then one day we all sign an agreement and can't go back. This is the nature of RUP (Rational Unified Process) and many similar models. They want the benefit of trust and informality, but they punctuate it with periodic diabolical contract-language agreements to end one phase and begin another.

## Iterative model

The second method for development usually taught is the iterative model. This model follows a simple cycle without a predetermined number of repetitions: design, build, evaluate. One example follows in Figure \ref{fiIterativeModel}. This example substitutes the word prototype for build and lists some common techniques for each phase. Note that many texts refer to prototyping and the iterative model as two different development methods. In this picture, prototyping is used as a generic term for building something that is not the finished product. The notion of prototyping as a development method uses a more restrictive definition of the word prototype.

\begin{figure}[htbp]
\begin{center}
\tikzstyle{background rectangle}=[rounded corners,fill=yellow!10]
\definecolor{protocolor}{rgb}{0.9,0.50,0.55} 
\definecolor{designcolor}{rgb}{0.9,0.1,0.0} 
\definecolor{evalcolor}{rgb}{0.3,0.4,0.5} 
\definecolor{arrowcolor}{rgb}{0.7,0.8,0.9} 
\begin{tikzpicture}[show background rectangle] 
\node (p) at (0,2)
  [shape=ellipse,draw=none,fill=protocolor,text=white,scale=0.85]
  {\sf prototype};
\node (pa) at (-1.5,2.6)
  [shape=rectangle,draw=none,fill=protocolor!60,text=white,scale=0.5]
  {\sf lowfi, hifi};
\node (d) at (4,3)
  [shape=ellipse,draw=none,fill=designcolor,text=white,scale=0.85]
  {\sf design};
\node (da) at (4.7,4.3)
  [shape=rectangle,draw=none,fill=designcolor!60,text=white,text
  width=4cm,scale=0.5]
  {\sf contextual inquiry, personas, scenarios, sketching};
\node (e) at (2,0)
  [shape=ellipse,draw=none,fill=evalcolor,text=white,scale=0.85]
  {\sf evaluate};
\node (ea) at (4,-0.8)
  [shape=rectangle,draw=none,fill=evalcolor!60,text=white,text
  width=5cm,scale=0.5]
  {\sf heuristic evaluation, user testing};
\draw [->,very thick,arrowcolor] (d) to [bend right=45] (p);
\draw [->,very thick,arrowcolor] (p) to [bend right=45] (e);
\draw [->,very thick,arrowcolor] (e) to [bend right=45] (d);
\end{tikzpicture} 
\end{center}
\caption{iterative model}\label{fiIterativeModel}
\end{figure}

## Expense of the iterative model

This method is inherently more expensive than the waterfall model for a given size of computer program.  That is often difficult for students to understand because the waterfall model is usually employed when larger computer programs are contemplated. Therefore it must seem that the average cost of a program developed via the waterfall model is more expensive than the average cost of a program developed via the iterative model. Such an intuition is good but it ignores the fact that people know the iterative model costs more per line of computer code, so they simply don't use it on large programs except under certain specific conditions.

## Lack of planning detail in iterative model

The expense of the iterative model involves several factors. One is that it is more flexible, not planned out in as much detail. It's easier to save money if you can plan each person's schedule six months in advance.  In an iterative project there are always more meetings and these meetings are often spontaneous results of unanticipated discoveries.

## Extra products of the iterative model

Another aspect of the expense of the iterative model is that it produces many intermediate results that are not intended to be part of the final project. To illustrate, consider one of the cardinal rules of the iterative approach: that each cycle should occupy no more than *n* days. Typically, *n=5* so that the evaluation step occurs on a weekly basis. This means that something must be designed and built every week. The tools used to design and build things quickly typically lead to proof of concept prototypes that can not be directly used in a production version of a system. Often, these tools involve crayons, construction paper, and flippy movies and no computer-based artifacts at all. The purpose of these prototypes is to ensure that each member of the team has a mental model of the system that agrees with the mental models of other members, both customer and developer.

## Getting everyone on the same page

A simple way to phrase the foregoing is that much of the expenditure of the iterative model is to get everyone on the same page. This very regularly turns out to be a non-trivial task. A good project for students is sometimes to develop a paper prototype after talking to customers and then to *overhear* the customer reaction to the paper prototype when shown it by others. Although customers may not want to hurt the feelings of the students when face-to-face, student groups have found that they will typically unleash a firestorm of disapproval over the most surprising things when reacting to a third party.

## Other models

Cynically, I must insist that many models have arisen as opportunities for consultants to extract money from rudderless firms. Even the best advances in development methods seem to have less than noble origins. Reactions to perceived problems underly most models. In other domains, ideas that have arisen as reactions are often deprecated in favor of ideas arising from fundamental insights. It may be that software has simply not been practiced long enough for fundamental insights to have emerged.

Risk reduction inspired the spiral model. Environmental instability inspired agile models. Formation of an alliance between three major commercial groups inspired the RUP model.

Wikipedia has a well-edited group of pages on these and other software development methods. The root page is named *Software Development Process*.

## Spiral model
For the spiral model, I suggest reviewing the Wikipedia *spiral model* article, which may be more accessible to the contemporary reader than the original work of Barry Boehm, the inventor of the paradigm. The Wikipedia article lists the six features of a successful application of the spiral model.

First, define artifacts concurrently. Sequential development risks that artifacts won't fit together.

Second, perform four basic activities in every cycle of the spiral. The four basic activities include (1) evaluation of success conditions, (2) examination of design alternatives, (3) enumeration and analysis of risks of each alternative, and (4) obtaining commitment for another cycle from all relevant stakeholders.

Third, use risk to determine effort. This requires a comprehensive understanding of different types of risk, including the risk due to poor quality, the risk due to delayed market entry, the risk due to lack of scalability, the risk due to technical lock-in, and perhaps others.

Fourth, use risk to determine the degree of detail. There must be enough detail to reduce the risk interoperability problems, such as those between hardware and software or different contractors. Details that might increase risk should not be specified, such as adherence to skeuomorphism when support for it is being removed from UI design tools and replaced by support for flat design.

Fifth, use anchor point milestones. These provide three points at which a project should be abandoned because three basic risks are now insurmountable: direction, architecture, and operational capability. These milestones reflect the fact that certain characteristics of a project develop naturally. Early on, an approach develops and the project follows it to the end. Later, an architecture (if only we could use the correct word, design!) emerges and is followed to the end. Finally, the project attains operational capability that is sufficient to launch. (I, Mick, am skeptical of this characteristic. It allegedly differs from the milestones of the waterfall approach, but how?)

Sixth, focus on the entire life cycle of the system. Presumably a software product is integrated into the larger world.

## Other other models

All development methods have themes, roles, interactions between people in different roles, and events of various kinds. The Wikipedia coverage of them makes for a good introduction and includes references to the authors who have championed these methods. You will likely work with a few of these methods during your career and you will learn vastly more about the methods you use than you will about the others. The easiest thing to discuss in the classroom is the themes of the development methods.

## Weight
One theme that emerged in reaction to the waterfall model was *weight*, defined as the ratio of effort expended that seems rigid and remote from the operational solution to effort that seems flexible and close to the operational solution. For example, developers can usually agree that coding the operational solution is very close to the operational solution. They may also agree that review of agreements by attorneys is remote from the operational solution. From the standpoint of the line developers, the waterfall model is a very heavyweight model. (Note that it is the least expensive model per line of code. Weight is not equivalent to monetary cost.) Many other models advertise themselves as *lightweight*, stripping away activities that seem rigid or remote.

The shape of an organizational chart may provide a clue to organizational culture and the likelihood of acceptance of heavy or light weight projects. If the org chart is tall and narrow, like a Douglas fir tree, long reporting chains are likely. IBM offers a famous example of long reporting chains. There it has been quipped that IBM does not release products but that they instead escape from IBM's gravitational field.

A flat wide org chart, looking like a mimosa tree, often appeals to students. Lightweight projects with few approvals may be welcome in such a culture. On the other hand, consider BP as an example of a flat wide org chart. After BP apparently dumped 210 million gallons of oil into the Gulf of Mexico, the CEO stood on the deck of his yacht and told reporters with a straight face that it was not BP's fault because non-BP contractors were involved. Another example was the ill-fated People's Express Airline. While initially successful, it was brought down relatively quickly by higher-cost carriers. It has been alleged that its flat structure led to piecemeal, uncoordinated efforts to recover.
Thus, there may be inherent risks in a culture favoring a light weight development process and these risks may not play out in ways that are obvious in day-to-day work.

## Co-locating team members and work
For example, intensive co-location of team members and frequent meetings is a theme present in various methods. Here, intensive means that you can't get away from the other team members. Some methods use a warroom approach where a physical location devoted to the project is not to be used for anything else and is available to project members 24/7. Core project members are expected to work exclusively in the warroom.

The idea of core project members implies that there are some relevant people outside the core. If you think of development from the point of view of stakeholders, it is easy to imagine that the economic support for a project comes from stakeholders not in the core team. So it makes sense to ask of any method how it helps identification of and interactions between different classes of stakeholders.

## The stakeholder problem
Let me give a non-software example of the stakeholder problem. My department was told that funding had been secured for a new building that we would share with a few other departments. My superiors were told that we could help shape this new building if we participated early and often. To make a long story short, one of the departments was as large as all the others put together. That department refused to have any input into the planning. When the planning was finished with input from all other departments, the largest department simply announced that the plan was unworkable and that we would need to start over. Leadership felt compelled by the size of the largest department to hurriedly replan with little time remaining since heavy equipment and contractors had already been scheduled. Because the replan was hasty, the core group decided that there could not be much input from anyone. This suited the largest department. The largest department simply made sure their needs were met, leaving almost no time for other departments to review and ask for revisions.

That building project was a catastrophe for almost all the department leaders involved. It wasted a great deal of their time and tarnished their reputations with their subordinates and weakened them and their departments and reminded everyone of the power of the largest department. Because the final building was hastily planned it was not satisfying to many of the initial occupants. I personally found it grating that the larger organization went ahead and courted the sheep, er, press, which dutifully reported it as innovative and forward-thinking without any evidence that it was. Nevertheless, it is difficult to imagine what the larger organization could have done. The building cost 150 million USD. It had to be declared a success if at all possible.

Can we truly identify the fault in that project? Should (or could) the top leadership have been more forceful in making the largest department cooperate from the beginning? Should the leaders of the small departments have given up immediately? Should they have started, then curtailed or stopped participating when it became clear that the largest department would not participate? This is an interesting problem because we can not answer any of these questions with certainty. We do not know what might have happened or whether the outcome was inevitable no matter what course of action our leaders took.

## Division of work
Each development method has some approach to dividing a large complicated project into small pieces. For example, the scrum method uses the *sprint*, a time-constrained period of highly structured effort, as the basic unit of team work. (The name *scrum* comes from rugby and, if you play rugby, may seem ironic.) For the iterative and spiral models, a cycle of design, build, evaluate, is the basic unit of work. For the waterfall model, the stages of (1) requirements gathering, (2) analysis, (3) design, (4) build, and (5) maintenance are the units of work, although different variations of waterfall differ in the number and names of steps.

Figure \ref{fiScrumProcess}
by Lakeworks - Own work, GFDL, \url{https://commons.wikimedia.org/w/index.php?curid=3526338} shows the scrum process.

\begin{figure}[htbp]
  \begin{center}
  \includegraphics[width=4in]{fiScrumProcess.png}
  \end{center}
  \caption{scrum process}\label{fiScrumProcess}
\end{figure}

For new product software projects, the sprint makes a great deal of sense as a managed activity. Yet half of all software effort in the world is maintenance. So practitioners of scrum, when doing maintenance projects, may abandon the *sprint* feature of scrum, yet keep other features intact.

In particular, scrum uses a notion of *product backlog* to identify remaining work and to set work priorities to satisfy the customer. The *product backlog* idea assumes that the customer understands the work or has one or more representatives who can bear the designation *product owner* and therefore maintain the *product backlog*. Can you think of any ways that this approach could go wrong? Note that it depends on customer knowledge and two-way communication between the customer and the project team, mediated by the product backlog.

## Pair programming
Some methods claim *ownership* of certain themes. One important theme arising in different methods is for two programmers to work together with a single keyboard and display. This technique requires the two programmers to be peers, with similar levels of skill. They should be compatible, able to engage each other's attention. Neither should hold the keyboard the entire time. They should switch roles from time to time. They should be expected to identify more errors and to identify them faster than either could alone. They should be able to generate more alternatives than could either alone. On the other hand, they will generate fewer lines of code than they would working independently.

The use of pairs may not be restricted to programming. Some UI designers, for instance, work in the same manner. Instead of writing code together, the pair works together with wireframing or other prototyping software.

## Test-driven development

Test-driven development focuses on requirements by writing tests before 
writing code to be tested. The developer must clearly understand the requirements in order to write appropriate tests. The test-driven approach supposes that much of the effort in development is in refactoring. Figure \ref{fiTDDlifecycle} By Xarawn - own work CC BY-SA 4.0 \url{https://commons.wikimedia.org/w/index.php?curid=44782343}
illustrates the prominence of refactoring in test-driven development.

\begin{figure}[htbp]
  \begin{center}
  \includegraphics[width=4in]{fiTDDlifecycle.png}
  \end{center}
  \caption{test-driven development lifecycle}\label{fiTDDlifecycle}
\end{figure}

## Other themes
You could do a great deal of reading on each popular method, as well as some obscure methods. I would like you to start with the Wikipedia introductions, linked from the Wikipedia article titled *Software Development Process* and think about the themes that could support one or another method.

The uneven quality of Wikipedia articles is well known. One advantage I have in reading these articles is that I have read many of the authoritative works on which they are based. Let me help you by identifying some of the major authors mentioned in the Wikipedia articles. While URLs are subject to link rot, names of authors may serve you over a long time period:

Kent Beck,
Barry Boehm,
Grady Booch,
Fred Brooks,
Edsger Dijkstra,
Martin Fowler,
Jim Highsmith,
Ivar Jacobson,
James Martin,
Steve Mellor,
Bertrand Meyer,
David Parnas,
James Rumbaugh, and
Niklaus Wirth.

## Agile Manifesto

The Agile Manifesto, published in 2001, promoted 12 principles listed in the Wikipedia article as follows.

 1. Customer satisfaction by early and continuous delivery of useful software
 2. Welcome changing requirements, even late in development
 3. Working software is delivered frequently (weeks rather than months)
 4. Close, daily cooperation between business people and developers
 5. Projects are built around motivated individuals, who should be trusted
 6. Face-to-face conversation is the best form of communication (co-location)
 7. Working software is the principal measure of progress
 8. Sustainable development, able to maintain a constant pace
 9. Continuous attention to technical excellence and good design
10. Simplicity—the art of maximizing the amount of work not done—is essential
11. Self-organizing teams
12. Regular adaptation to changing circumstance

These principles are so broad and so relevant to a variety of methods that *Agile* promoted itself to a position of parent over various methods. Not everyone accepts this retroactive declaration of parenthood but the widespread acceptance of these principles, however broadly they are stated, means that the term agile is applicable to most non-waterfall methods in contemporary practice.

## DevOps
Our department offers a course on DevOps, but we should discuss it at least briefly here. DevOps can be construed as a development methodology although its practitioners often refer to it as much more.

@Wiedemann2019 provide three common definitions of DevOps. They note that these definitions focus on the outcomes or foundations of the discipline rather than its components.

- DevOps is a software development and delivery methodology that provides $\ldots$ increased speed and stability while delivering value to organizations.
- DevOps, whether in a situation that has operations engineers picking up development tasks or one where developers work in an operations realm, is an effort to move the two disciplines closer.
- DevOps, a compound of development and operations, is a software development and delivery approach designed for high velocity.

@Wiedemann2019 claim that the most common presentation of the components of DevOps is embodied in the acronym CALMS as follows.

- Culture. Integration of mutual trust, willingness to learn, continuous improvement, constant flow of information, open-mindedness to changes, and experimentation between developers and operations.
- Automation. Implementing deployment pipelines with a high level of automation (most notably continuous integration / continuous delivery) and comprehensive test automation.
- Lean. Applying lean principles such as minimization of work in progress, as well as shortening and amplification of feedback loops to identify and minimize value flow breaks to in-crease efficiency.
- Measurement. Monitoring the key system metrics such as business or transactions metrics and other key performance indicators.
- Sharing knowledge in the organization and across organizational boundaries. Team members should learn from each other’s experiences and proactively communicate.

@Wiedemann2019 go on to stipulate that three things are necessary in any DevOps solution.

- Strong leadership
- A custom solution for each organization
- A holistic view of automation, process, and culture

This suggests that you should not have a consultant come in and sell you a DevOps packaged approach, that the leadership must come from a high level in the organization, and the changes must be drastic and encompassing.
