
# Diagramming development

Application development teams use diagrams to communicate. As teams grow larger, the likelihood that they will use standardized diagrams grows. Vastly many scholars and industrial consultants have proposed countless formal diagrams to describe systems. No one diagram can describe all aspects of a system. Most formal methods use at least two or three types of standardized diagrams to describe states, data flows, work flows, and relationships, including entity, component, and inheritance relationships. Historically, the first diagrams were informal and subject to ambiguous interpretation. In this section, we review basic ideas about the following diagram types: system flow charts, swim lane diagrams, data flow diagrams, and state transition diagrams.

## Automation and feedback loops

The concept of automation involves four things:

- input,
- processing,
- output, and
- feedback.

- key characteristic of automation:
    - feedback is automatic and
    - modifies processing based on monitoring output.

- Not necessarily electronic, could be mechanical

## System without automation

\begin{center}
\tikzstyle{background rectangle}=[rounded corners,fill=bkgroundcolor]
    \begin{tikzpicture}[show background rectangle]
    %                                Entities
    \node[entity] (e00) at (0,0)     {input};
    \node[entity] (e01) at (5.0,0)   {output};
    %                                Processes
    \node[process] (e02) at (2.45,0) {process};
    %                                Flows
    \draw[flow,->] (e00) -- (e02);
    \draw[flow,->] (e02) -- (e01);
  \end{tikzpicture}
\end{center}

- simple system: input, processing, and output
    - missing feedback
    - not automated system

## System without automation example
\subt{Copier without feedback}

- person selects 4 to indicate 4 copies
- puts original in
- third copy jams
- design of the copier could allow
    - keep feeding paper in
    - whole system could stop and signal a warning
- person could remove jammed paper
- press restart
- initiates the fourth copy
    - even though the third copy was never completed
- or pressing restart clears memory
- person determines how many copies remain

## System with automation example
\subt{Copier with feedback}

- person selects 4 to indicate 4 copies
- puts original in
- third copy jams
- design of the copier causes
    - input is aware two copies completed
    - when it resumes, reattempt third copy

- system with feedback needs no person to monitor
- responds to problems
- needs the person to remove jammed paper
    - person signals paper jam has been corrected
- system does not need a person to tell it what to do next

## System with automation example

\bigskip

\begin{center}
\tikzstyle{background rectangle}=[rounded corners,fill=bkgroundcolor]
\begin{tikzpicture}[show background rectangle]
    %                                  Entities
    \node[entity] (e00) at (0,0)       {input};
    \node[entity] (e01) at (4.9,0)     {output};
    %                                  Processes
    \node[process] (e02) at (2.4,0)    {process};
    \node[process] (e03) at (2.4,0.77) {feedback};
    %                                  Flows
    \draw[flow,->] (e00) --  (e02);
    \draw[flow,->] (e02) --  (e01);
    \draw[flow,->] (e01) .. controls (4.8,0.84) and (4.4,0.91) .. (e03);
    \draw[flow,->] (e03) .. controls (0.4,0.91) and (0.1,0.84) .. (e00);
  \end{tikzpicture}
\end{center}

\bigskip

- ellipse $\Rightarrow$ process (verb)
- rectangle $\Rightarrow$ entity (noun)
- diagram $\Rightarrow$ sentence in system language

## Diagramming systems
\subt{systems are big $\ldots$ really big}

- Systems are too large to 
    - be specified,
    - be designed, or
    - be built by individuals.

- Systems are often large enough to divide
   - among individuals on a team, and
   - multiple teams.

\textit{How can teams 
communicate with others about the information systems 
they develop or use?}

## Diagrams of systems
\subt{rules diminish ambiguity, support general discussion}

- Not practical to read programs
- All other descriptions have some ambiguity

- formal diagrams describing one aspect of system
    - formal means rules
    - formality reduces ambiguity

- each aspect represents a diagram type
- aspects include
    - components,
    - control flow,
    - data flow,
    - use cases,
    - states,
    - inheritance,
    - project management

## No one uses every diagram type

- Every systems development method
features at least two types

- Most have three types
- Most popular method, UML, has nine types

- No description of a system is complete without associated diagrams

- No system is completely described by one diagram

- Key characteristic of different systems development 
methods
    - don't agree which aspects are essential
    - don't agree which diagrams are essential
    - all agree that more than one is essential

## Diagram types

- Entity relationship diagram (data modeling)
- State transition diagrams (system status)
- Data flow diagram (how data flows through system)
- Control flow diagram (how control flows through
  system)
- Use case diagrams (how system is used)
- Systems flow charts (doodling)
- Swim lane diagram (responsibility handoffs)

## Diagram elements
\subt{most basic element relationships: network, db, tree}

\begin{center}
\tikzstyle{background rectangle}=[rounded corners,fill=bkgroundcolor]
\begin{tikzpicture}[show background rectangle]
    %                                 Entities
    \node[entity] (e00) at (0,0)      {\Large A};
    \node[entity] (e01) at (3.8,0)    {\Large B};
    %                                 Flows
    \draw[flow,-]
      (e00) -- node[flowtext] {undirected link}
      (e01);
  \end{tikzpicture}
\end{center}

\begin{center}
\tikzstyle{background rectangle}=[rounded corners,fill=bkgroundcolor]
\begin{tikzpicture}[show background rectangle]
    %                                 Entities
    \node[entity] (e00) at (0,0)      {\Large A};
    \node[entity] (e01) at (3.8,0)    {\Large B};
    %                                 Flows
    \draw[flow,->]
      (e00) -- node[flowtext] {directed link}
      (e01);
  \end{tikzpicture}
\end{center}

\begin{center}
\tikzstyle{background rectangle}=[rounded corners,fill=bkgroundcolor]
\begin{tikzpicture}[show background rectangle]
  font=\sffamily,
    %                                 Entities
    \node[entity] (e00) at (0,0.5)    {\Large A};
    \node[entity] (e01) at (3.8,0)    {\Large B};
    %                                 Flows
    \draw[flow,->]
      (e00) -- node[flowtext] {parent-child}
      (e01);
  \end{tikzpicture}
\end{center}

## Diagram customs

\begin{center}
\begin{tabular}{lll}
\it concept & \it term & \it shape \\ \midrule
things & entities & rectangles \\
verbs  & processes & circles or ellipses \\
info, control, time & flows & lines
\end{tabular}
\end{center}

## System flow charts

The first diagramming system used by computer makers was 
called the system flow chart. This is a diagram 
typically containing arrows, circles, ovals, diamonds, 
parallelograms, and a variety of other eclectic symbols.  
They could be used with absolutely no training and may 
mean almost anything. This flexibility was ideal at the 
dawn of the computer era, over fifty years ago. As time 
passed, though, the flexibility of the system flow chart 
became a point of criticism. Anyone could say that any 
flow chart meant anything. The flow chart could support 
or refute any argument depending on local 
interpretation.

## System flow charts were rejected
\subt{$\ldots$ for a while}

The second generation of computer hardware and software 
developers, roughly in the nineteen seventies, 
completely rejected flow charts in favor of other, more 
specialized diagrams. During this era, a relatively 
small part of the population was concerned with 
computers, each of which still cost more than a year's 
wages for most people.

## System flow charts were born again

More recently, as the number of people concerned with 
developing hardware and software exploded, the systems 
flow chart experienced a renaissance, given that so many 
people became involved in development
*without it being their primary activity*.  For these 
people, systems are often low-cost and expected to be 
disposable. Many people now develop systems that only 
they themselves use, so the objections to flow charts as 
unsuitable for a community of teams of users evaporated.

## System flow chart flexibility entails ambiguity

Still, it is important to understand the cost of the 
flexibility of systems flow charts. When a business 
person uses a flow chart to describe an idea to a 
systems professional, the professional has far greater 
latitude for interpretation than with any other kind of 
diagram. A frequent source of friction between customers 
and developers is miscommunication and systems flow 
charts are a frequent vehicle for miscommunication.

*The only symbol used consistently* across every flow 
chart this author has ever seen is the use of the 
diamond to represent a decision, with lines coming out 
of it to represent different choices. Apart from this, 
rules (like legends for maps) may be useful for given 
flow charts. Good examples of flow charts can be found 
in the web comic XKCD, for instance at 
[xkcd518](http://xkcd.com/518/).

The above reference to xkcd 518 is not really
frivolous. Read the box labeled Hey, I should
try installing FreeBSD! Then carefully read the hover
text After 8 drinks you switch the torrent from FreeBSD
to Microsoft Bob. C'mon, it'll be fun! These are
important clues about the dangers of either believing or
not believing you understand flow charts.

## Swim lane diagram example
This is an example from an authentication system.
Each row represents a software team.
Each blue circle represents a responsibility.
Each red circle represents a delivery of output.
Each letter represents an accompanying paragraph explaining the task.

\begin{center}
\tikzstyle{background rectangle}=[rounded corners,fill=bkgroundcolor]
  \begin{tikzpicture}[show background rectangle,xscale=0.45,yscale=0.56]
  \definecolor{entitycolor}{rgb}{ 0.27,0.5,0.7}
  \definecolor{startptcolor}{rgb}{0.27,0.5,0.7}
  \definecolor{endptcolor}{rgb}{  1.0,0.3,0.3}
  \definecolor{horzcolor}{rgb}{   0.27,0.5,0.7}
  \definecolor{flowcolor}{rgb}{   0.27,0.5,0.7}
  \tikzstyle{surround} = [
    fill=blue!2,
    thick,
    draw=none,
    rounded corners=2mm
  ]
  \tikzstyle{entity} = [
    fill=entitycolor,
    anchor=base east,
    text=white,
    shape=rectangle,
    opacity=0.9,
    draw=none,
    inner sep=2pt,
    font=\sffamily\scriptsize
  ]
  \tikzstyle{startpt} = [
    fill=startptcolor,
    anchor=base,
    text=white,
    shape=circle,
    minimum size=5pt,
    opacity=0.9,
    inner sep=1pt,
    font=\sffamily\scriptsize\itshape
  ]
  \tikzstyle{endpt}   = [
    fill=endptcolor,
    anchor=base,
    shape=circle,
    minimum size=5pt,
    opacity=0.8,
    inner sep=1pt,
    font=\sffamily\scriptsize\itshape
  ]
  \tikzstyle{horz} = [
    ultra thick,
    opacity=0.3,
    draw=horzcolor
  ]
  \tikzstyle{flow} = [
    very thick,
    opacity=0.8,
    draw=flowcolor
  ]
  %                              Entities
  \node[entity] at (0,5) (e005) {User (Browser)};
  \node[entity] at (0,4) (e004) {Weblogin (CoSign)};
  \node[entity] at (0,3) (e003) {Swordfish};
  \node[entity] at (0,2) (e002) {MCommunity};
  \node[entity] at (0,1) (e001) {kpasswdq};
  \node[entity] at (0,0) (e000) {Kerberos};
  %                              Column  1 weblogin form      fm user to cosign
  \node[startpt] (e015) at  (1,5) {A}           edge[horz,-] (e005);
  \node[endpt]   (e014) at  (1,4) {\phantom{X}} edge[horz,-] (e004);
  \draw[flow,->] (e015) --  (e014);
  %                              Column  2 weblogin form      fm cosign to user
  \node[endpt]   (e025) at  (2,5) {\phantom{X}} edge[horz,-] (e015);
  \node[startpt] (e024) at  (2,4) {B}           edge[horz,-] (e014);
  \draw[flow,->] (e024) --  (e025);
  %                              Column  3 uniqname           fm user to swordfish
  \node[startpt] (e035) at  (3,5) {C}           edge[horz,-] (e025);
  \node[endpt]   (e033) at  (3,3) {\phantom{X}} edge[horz,-] (e003);
  \draw[flow,->] (e035) --  (e033);
  %                              Column  4 query              fm swordfish to mcomm
  \node[startpt] (e043) at  (4,3) {D}           edge[horz,-] (e033);
  \node[endpt]   (e042) at  (4,2) {\phantom{X}} edge[horz,-] (e002);
  \draw[flow,->] (e043) --  (e042);
  %                              Column  5 name parts         fm mcomm to swordfish
  \node[endpt]   (e053) at  (5,3) {\phantom{X}} edge[horz,-] (e043);
  \node[startpt] (e052) at  (5,2) {E}           edge[horz,-] (e042);
  \draw[flow,->] (e052) --  (e053);
  %                              Column  6 passwd chg form    fm swordfish to user
  \node[endpt]   (e065) at  (6,5) {\phantom{X}} edge[horz,-] (e035);
  \node[startpt] (e063) at  (6,3) {F}           edge[horz,-] (e053);
  \draw[flow,->] (e063) --  (e065);
  %                              Column  7 passwd chg attempt fm user to swordfish
  \node[startpt] (e075) at  (7,5) {G}           edge[horz,-] (e065);
  \node[endpt]   (e073) at  (7,3) {\phantom{X}} edge[horz,-] (e063);
  \draw[flow,->] (e075) --  (e073);
  %                              Column  8 passwd chg attempt fm swordfish to kpasswdq
  \node[startpt] (e083) at  (8,3) {H}           edge[horz,-] (e073);
  \node[endpt]   (e081) at  (8,1) {\phantom{X}} edge[horz,-] (e001);
  \draw[flow,->] (e083) --  (e081);
  %                              Column  9 qualityinf         fm kpasswdq  to swordfish
  \node[endpt]   (e093) at  (9,3) {\phantom{X}} edge[horz,-] (e083);
  \node[startpt] (e091) at  (9,1) {I}           edge[horz,-] (e081);
  \draw[flow,->] (e091) --  (e093);
  %                              Column 10 qualityresult      fm swordfish to user
  \node[endpt]   (e105) at (10,5) {\phantom{X}} edge[horz,-] (e075);
  \node[startpt] (e103) at (10,3) {J}           edge[horz,-] (e093);
  \draw[flow,->] (e103) -- (e105);
  \draw[flow,->,opacity=0.5,densely dotted] (e105) .. controls (10,7) and (7,7) .. (e075);
  %                              Column 11 final chg          fm user      to swordfish
  \node[startpt] (e115) at (11,5) {K}           edge[horz,-] (e105);
  \node[endpt]   (e113) at (11,3) {\phantom{X}} edge[horz,-] (e103);
  \draw[flow,->] (e115) -- (e113);
  %                              Column 12 doublecheck        fm swordfish to kpasswdq
  \node[startpt] (e123) at  (12,3) {L}           edge[horz,-] (e113);
  \node[endpt]   (e121) at  (12,1) {\phantom{X}} edge[horz,-] (e091);
  \draw[flow,->] (e123) --  (e121);
  %                              Column 13 finalresult        fm kpasswdq  to swordfish
  \node[endpt]   (e133) at  (13,3) {\phantom{X}} edge[horz,-] (e123);
  \node[startpt] (e131) at  (13,1) {M}           edge[horz,-] (e121);
  \draw[flow,->] (e131) --  (e133);
  %                              Column 14 doublecheck        fm swordfish to kerberos
  \node[startpt] (e143) at  (14,3) {N}           edge[horz,-] (e133);
  \node[endpt]   (e140) at  (14,0) {\phantom{X}} edge[horz,-] (e000);
  \draw[flow,->] (e143) --  (e140);
  %                              Column 15 finalresult        fm kerberos  to swordfish
  \node[endpt]   (e153) at  (15,3) {\phantom{X}} edge[horz,-] (e143);
  \node[startpt] (e150) at  (15,0) {O}           edge[horz,-] (e140);
  \draw[flow,->] (e150) --  (e153);
  %                              Column 16 feedback           fm swordfish to user
  \node[endpt]   (e165) at (16,5) {\phantom{X}} edge[horz,-] (e115);
  \node[startpt] (e163) at (16,3) {P}           edge[horz,-] (e153);
  \draw[flow,->] (e163) -- (e165);
  %                              Background Box
  %\begin{pgfonlayer}{background} 
  %  \node[surround] (background) [fit = (e004) (e000) (e165)] {};
  %\end{pgfonlayer}
\end{tikzpicture}
\end{center}

## Swim lane diagram example from Hanna Jung

\subt{Example from a great designer's portfolio}

\begin{center}
\includegraphics[width=4in]{swimlanesNotes.jpg}
\end{center}

## Swim lane diagram issues

- What is the number one problem with course
  registration?
    - I claim it is having to stick around for an extra
     term because you didn't get into a class
    - Is that really a course registration problem?
    - It is a problem of managing scarce resources under
     uncertainty: rooms, teachers, students,
     requirements
    - Departments are responsible for courses
    - schools are responsible for degrees
    - Registrar is responsible for connecting students,
     departments, facilities, and schools
    - Each have responsibilities

## Swim lane diagram perspectives

- Each role has responsibilities, whether they
  acknowledge them or not
- Students have the responsibility to seek guidance,
  whether from academic advisors, peers, instructors, or
  other sources, such as ratemyprofessor
- Saying *do it or don't* is not a good representation
  of responsibility
- Just because somebody skips a step doesn't mean it
  is okay

## Data flow diagram example

\begin{center}
\begin{tikzpicture}[scale=0.2,
  font=\sffamily,
  every matrix/.style={ampersand replacement=\&,column
  sep=1.25cm,row sep=1.25cm},
  source/.style={draw,thick,rounded corners,fill=eecolor,inner sep=.3cm},
  process/.style={draw,thick,circle,fill=prcolor},
  sink/.style={source,fill=eecolor},
  datastore/.style={draw=dscolor,very thick,font=\sffamily,shape=datastore,inner sep=.3cm},
  dots/.style={gray},
  to/.style={->,>=stealth',shorten >=1pt,semithick,font=\sffamily\footnotesize},
  every node/.style={align=center}]

  % Position the nodes using a matrix layout
  \matrix{
    \node[source] (hisparcbox) {electronics};
      \& \node[process] (daq) {DAQ}; \& \\

    \& \node[datastore, inner sep=.1cm] (buffer) {buffer}; \& \\

    \node[datastore, inner sep=.1cm] (storage) {storage};
      \& \node[process] (monitor) {monitor};
      \& \node[sink] (datastore) {datastore}; \\
  };

  % Draw the arrows between the nodes and label them.
  \draw[to] (hisparcbox) -- node[midway,above] {raw events}
      node[midway,below] {level 0} (daq);
  \draw[to] (daq) -- node[midway,right] {raw event data\\level 1} (buffer);
  \draw[to] (buffer) --
      node[midway,right] {raw event data\\level 1} (monitor);
  \draw[to] (monitor) to[bend right=50] node[midway,above] {events}
      node[midway,below] {level 1} (storage);
  \draw[to] (storage) to[bend right=50] node[midway,above] {events}
      node[midway,below] {level 1} (monitor);
  \draw[to] (monitor) -- node[midway,above] {events}
      node[midway,below] {level 1} (datastore);
\end{tikzpicture}
\end{center}

## Diagramming data flows

Perhaps the most enduring diagramming form and the one 
that appears in the most methods is the diagramming of 
information or data flows.  A DFD, which stands for Data 
Flow Diagram, must contain exactly four symbols and 
these four symbols must obey certain rules.  The four 
symbols are flow, process, data store, and entity.

## Data flow

\begin{center}
\begin{tikzpicture}
\draw[flow,->]
      (0,0) -- node[above=0.5pt]
      {\small \textit{receipt}}
      (2,0);
\end{tikzpicture}
\end{center}

A data flow is an arrow with a head at one end. It must 
not have arrows at both ends. It must be labeled with a 
name for the data that is flowing. It may start or stop 
at a process, store, or entity, but it may not pass 
between two entities or data stores. In other words, if one end is an 
entity, the other end must be a process. Similarly, if
one end is a data store, the other end must be a
process. The label must refer to data, not physical
objects. The above example may correspond to money flowing but
we diagram the flow of data related to that money.

## Process

\begin{center}
\begin{tikzpicture}
    \node[process,text width=1.5cm] (rec) at (0,0) {reconcile receipts};
\end{tikzpicture}
\end{center}

A process is a circle with a label naming a process
that operates on data.
It must have at least one flow entering it and at least 
one flow exiting it. No process may be a *magic 
wellspring*, having only arrows coming out of it, nor a 
*black hole*, having only arrows going into it.

## Data store

\begin{center}
\begin{tikzpicture}[
   datastore/.style={draw=dscolor,very thick,font=\sffamily,shape=datastore,inner sep=.1cm}
  ]
    \node[datastore,text width=1.5cm] (rec) at (0,0) {receipts box};
\end{tikzpicture}
\end{center}

A data store is a pair of horizontal lines with a label 
naming the data store. This is some place where data is 
stored. It need not be in a computer. It may be an 
*inbox* on a physical desk. It may be a filing cabinet.
Like a process, it must have at least one flow entering 
it and at least one flow exiting it. No data store may 
be a *magic wellspring*, having only arrows coming out 
of it, nor a *black hole*, having only arrows going into 
it.

## External entity

\begin{center}
\begin{tikzpicture}
    \node[entity,text width=3.0cm] (rec) at (0,0)
    {brick-and-mortar customer};
\end{tikzpicture}
\end{center}

An external entity is represented by a rectangle with a 
label naming something outside the system that is 
somehow connected to the system.
Like a process or data store, it must have at least one 
flow entering it and at least one flow exiting it. No 
external entity may be a *magic wellspring*, having only 
arrows coming out of it, nor a *black hole*, having only 
arrows going into it.

## External entity restrictions

It may seem counterintuitive to place the same in / out 
restriction on external entities as on system 
components. After all, an external entity might be a 
customer. We might send a refund to a customer with no 
expectation that the customer send us something in 
return. In practice, the restriction is often relaxed.  
When that happens, it is often the source of trouble.  
For instance, suppose that an unscrupulous employee 
notices that no feedback loop exists for customer 
refunds and uses that knowledge to develop an 
embezzlement scheme, misdirecting refunds.
How could you diagram a safeguard against this?

## External entity restrictions relaxed

Even though we have no control over external entities,
we can posit some data flows between them that we could
bring back into the system. For instance, unless we pay
cash, the customer will interact with a bank or
equivalent institution. That bank will interact with us
to obtain the funds. We can close the loop by
connecting *that* transaction to the previous
transaction.

## Example of needed rule violation

\begin{center}
\begin{tikzpicture}[xscale=0.9,yscale=0.9]
  \tikzstyle{entity}+=[text width=2.8cm]
  \tikzstyle{process}+=[text width=1.7cm]
\node[entity]  (e00) at (6,3.5) {Brick-and-mortar customer};
\node[entity]  (e01) at (6,0) {Financial institution};
\node[process] (e02) at (0,3.5) {Expedite refund};
\node[process] (e03) at (0,0) {Reconcile receipts};
\node[inviso]  (e04) at (-3,3.5) {};
\node[inviso]  (e05) at (-3,0) {};
\node[inviso]  (e06) at (1.4,4.5) {};
\node[inviso]  (e07) at (1.2,-1) {};
\draw[flow,->] (e02) -- node[flowtext] {receipt} (e00);
\draw[flow,->] (e02) -- node[flowtext] {receipt copy} (e03);
\draw[flow,->] (e00) -- node[flowtext] {info on check} (e01);
\draw[flow,->] (e01) -- node[flowtext] {request for funds} (e03);
\draw[flow,->] (e04) -- node[flowtext] {refunds} (e02);
\draw[flow,->] (e03) -- node[flowtext] {issues} (e05);
\draw[boundaryline,bend left=20] (e06) to (e07);
\end{tikzpicture}
\end{center}

## Needed rule violation explained

- The preceding picture has two features needing
  explanation
- First, there are flows leading to and from
    outside the picture
    - Some mechanism is needed to handle diagrams too
      large to fit in one picture or spanning different
      systems
    - The main mechanism is called leveled data flow
      diagrams (next topic)
- Second, there is a dashed line separating the
  processes from the external entities
    - This is a widely used Microsoft extension to data
      flow diagrams to separate regions with differing
      security levels
    - The idea is that, if information crosses such a
      boundary, those responsible for the system must
      consider the different situation on each side

## Leveled data flow diagrams

The data flow diagram described above would not be so 
popular without one additional aspect, called leveling.  
Every data flow diagram is assumed to occur at some 
level that can be *exploded* into lower levels, exposing 
more and more detail. It is typical for a set of leveled 
data flow diagrams to span hundreds of pages, each page 
with a single diagram, connected in the form of a tree 
with a single process, the name of the entire system, in 
the first diagram.

## Leveled data flow diagram numbers

In addition to the symbols mentioned above: flow, 
process, store, and entity, leveled data flow diagrams 
have a level number and every process circle has a level 
number as part of its name, functioning like an atlas, 
where each edge of a map contains a page number of a 
connecting map and highlighted sections contain page 
numbers of detailed maps.

In the rule violation example, the two flows with a
missing end would be defined in a different diagram and
the diagram exactly one level above the one we looked at
would direct us to the number of the diagram or diagrams
containing the other ends of those two flows.

## Diagramming state transitions

One effective way to describe many business systems is 
to describe their states. An easy way to see this is to 
think of the automated cashier in a grocery store.
The most frequent state in which that system finds 
itself is *waiting*. Other states include *reading an 
item placed on its sensor*, *reading a swiped credit 
card*, *sending a message to a customer*, and so on.  
This is an example of a system with a finite number of 
states. It should be possible to draw a diagram or set 
of diagrams listing each possible state and showing 
which states may precede or follow any other given 
state.

## Differences between state transition diagrams and dfds

In contrast to the dfd (data flow diagram), which mainly 
occurs in two forms, state transition diagrams have been
proposed and used in vastly many forms in different 
business, scientific, and government communities.

All state transition diagrams have in common that each
state represents a state no matter how that state
was reached. In other words, it does not matter how a
system enters a particular state. There are not
different conditions within a state.

## State transition diagram symbols

The simplest state transition diagram contains only the
following symbols.

1. An unlabeled dot points to the initial state.
2. Labeled circles describe each possible state the
   system may attain.
3. If the system has an ending state, a dot surrounded
   by a circle is pointed to by any state that leads to
   the end state.
4. Arrows, possibly labeled with actions, point from each
   state to each state that may be reached from that
   state, including the state itself if an action
   returns it to that state.

## State transition diagram examples

Following are two examples of state transition diagrams.
Each example has some context about why a state
transition diagram may be a useful representation.
Without experience of business information systems, it
may not be at all obvious \textit{why} these examples
are applicable. Further reading would be required to
understand why. These examples just illustrate how such
diagrams are constructed.

## Farmer's puzzle

State Transition Diagram Example 1, The Farmer's Puzzle.
Many variations of the following puzzle are used to
illustrate various information concepts, including
artificial intelligence concepts like forward chaining
and backward chaining, as well as problem representation
concepts.

## Puzzle statement

\textit{A farmer goes to market with a fox, a chicken, and a
vegetable, hoping to sell all three. The farmer must
cross a river to reach the market, using a boat that can
only accommodate the farmer and one of the three items
to be sold. Unfortunately, the fox will eat the chicken
if left unsupervised and the chicken will eat the
vegetable if left unsupervised. How can the farmer get
all three items across and continue to the market?}

## Solving the puzzle

Solving the puzzle is a separate task from drawing the
state transition diagram but the tasks are related
because representing a problem is often a key to solving
a problem. We'll use a different method to solve the
puzzle before demonstrating the state transition
diagram.
First, you have to represent the problem. To do so, you
begin by deciding what aspects of the puzzle need
to be represented. The candidate objects include the
farmer, the fox, the chicken, the boat, and the two
sides of the river.  All the objects are on the near
bank of the river at the start of the problem and all
the objects are on the far bank of the river at the end
of the problem. A common way for people to begin solving
the problem is to make a table with all the items in the
left column in the first row of the table and all the
items in the right column in the last row of the table,
then to start fill in intermediate rows. Following is an
example of the beginning of such a table.

## Puzzle table

\begin{center}
\begin{tabular}{p{1.8in}p{1.8in}}          \toprule
  \it near  & \it far   \\ \midrule
  farmer, fox, chicken, vegetable, boat & \\ \midrule
  $\cdots$  & $\cdots$  \\ \midrule
  & farmer, fox, chicken, vegetable, boat \\ \bottomrule
\end{tabular}
\end{center}

## Puzzle states

The above table can be expanded to list all the
intermediate states of the farmer's journey. One thing
that becomes obvious if you add a few rows is that there
should be no entries listing the fox and the chicken on
one riverbank without the farmer and that there should be no
entries listing the chicken and the vegetable on one 
riverbank without the farmer. The following version of
the table adds one additional entry from the beginning of
the problem, respecting this rule.

## An additional state

\begin{center}
\begin{tabular}{p{1.8in}p{1.8in}}          \toprule
  \it near  & \it far   \\ \midrule
  farmer, fox, chicken, vegetable, boat & \\ \midrule
  fox, vegetable & chicken, farmer, boat \\ \midrule
  $\cdots$  & $\cdots$  \\ \midrule
  & farmer, fox, chicken, vegetable, boat \\ \bottomrule
\end{tabular}
\end{center}

## Forward chaining

The above version of the table is an example of
\textit{forward chaining} since you moved forward from
the beginning of the problem toward the end of the
problem, using the only obvious legal move. It's the
only obvious legal move because, if the farmer takes
anything but the chicken across in the first trip,
someone will be eaten during the unsupervised time while
the farmer is away. We can also employ a complementary
technique called \textit{backward chaining} in the same way.

## Backward chaining

The very last thing the farmer must bring across
the river before moving on must also be the chicken,
since any other configuration on the far bank leads to
someone being eaten. The following table shows the
situation we arrive at by employing one iteration of
forward chaining and one iteration of backward chaining,
with the middle of the solution still incomplete.

## Both chaining forms

\begin{center}
\begin{tabular}{p{1.8in}p{1.8in}}          \toprule
  \it near  & \it far   \\ \midrule
  farmer, fox, chicken, vegetable, boat & \\ \midrule
  fox, vegetable  & chicken, farmer, boat \\ \midrule
        $\cdots$  & $\cdots$  \\ \midrule
  chicken, farmer, boat  & fox, vegetable \\ \midrule
  & farmer, fox, chicken, vegetable, boat \\ \bottomrule
\end{tabular}
\end{center}

## Combinatorial explosion

One reason to employ both forward chaining and backward
chaining in solving a problem is the issue of
\textit{combinatorial explosion}. If we draw the problem
from the beginning as a tree, with a new branch for
every possible state, we will have to draw a vast number
of branches after only a few transitions. The same is
true if we begin at the end and try to trace our way
back to the beginning. But if we begin at both ends, we
reduce the size of the problem. The problem as shown in
the above table is to get from the second state to the
next-to-last state. For many problems, including this
one, it is easier to find a path between these two
intermediate states than from beginning to end.

Looking at the above table, a solution may become
obvious. For those who have not seen it yet, let's add
one more legal step at each end and see.

## A more complete table

\begin{center}
\begin{tabular}{p{1.8in}p{1.8in}}          \toprule
  \it near  & \it far   \\ \midrule
  farmer, fox, chicken, vegetable, boat & \\ \midrule
  fox, vegetable  & chicken, farmer, boat \\ \midrule
  fox, vegetable, farmer, boat  & chicken \\ \midrule
        $\cdots$  & $\cdots$  \\ \midrule
  chicken & fox, vegetable, farmer, boat  \\ \midrule
  chicken, farmer, boat  & fox, vegetable \\ \midrule
  & farmer, fox, chicken, vegetable, boat \\ \bottomrule
\end{tabular}
\end{center}

## Obvious solution now

Looking at the above table,
we can see that the farmer must
take the chicken back to the near bank, which is a key
to solving the problem. Now it should seem easy to move
forward from the third row or to move backward from the
third-to-last row. The only issue is that we have a
choice of moving the vegetable across first or moving
the fox across first. This choice is not as trivial as
it may seem but for now, let's just move the fox first. That
move determines both the next row going forward and the
corresponding row going backward, giving the following
completed table.

## Final table

\begin{center}
{\scriptsize
\begin{tabular}{p{1.8in}p{1.8in}}          \toprule
  \it near  & \it far   \\ \midrule
  farmer, fox, chicken, vegetable, boat & \\ \midrule
  fox, vegetable  & chicken, farmer, boat \\ \midrule
  fox, vegetable, farmer, boat  & chicken \\ \midrule
  vegetable  & chicken, fox, farmer, boat \\ \midrule
  chicken, vegetable, farmer, boat  & fox \\ \midrule
  chicken  & fox, vegetable, farmer, boat \\ \midrule
  chicken, farmer, boat  & fox, vegetable \\ \midrule
  & farmer, fox, chicken, vegetable, boat \\ \bottomrule
\end{tabular}
}
\end{center}

## Limited solution representation

The above table represents a complete solution but it
has a couple of limitations. First, it only represents
one complete solution. The farmer could have taken the
vegetable across before the fox and this approach has no
obvious way to show that except to either include a
second table or to modify the structure of this table to
show that some rows are optional. Besides these two
options, the farmer can legally return to any previous state.
There's no obvious way to capture this fact using a
table except by adding a separate list showing which
rows can lead to which other rows.

## Second limitation

A second limitation is that the above table actually
contains more symbols than are needed to represent the
states of the problem. We don't really need to see both
columns since, in any row, every object that is not in
one column is in the other column. Second, the farmer
and the boat are not both needed because they are always
in the same place.

## State transition diagram

Both these limitations can be overcome by representing 
the solution as a state transition diagram. The
following diagram shows the state of the near bank only
and uses the symbols $F, C, V, B$ for the fox,
chicken, vegetable, and boat. The solution does have a
start state, pointed to by a solid dot. The solution
also has a final state, pointing to a circled dot.

In addition to overcoming the above limitations, the state
transition diagram has the property that it is compact
enough that we can scan it quite easily for violations
of the rule that fox must not be left unsupervised with the
chicken and the chicken must not be left unsupervised
with the vegetable. Since systems large enough to merit
state transition diagrams may contain dozens or even
hundreds of states, compactness can be a crucial
property.

## Farmer's puzzle as state transition diagram

\begin{center}
\begin{tikzpicture}[scale=1.4]
  \tikzset{
        small dot/.style={fill=dotcolor,draw=transcolor,circle,scale=0.8},
        trans/.style={->,very thick,fill=none,draw=transcolor}
  }
  \tikzstyle{every
  state}=[fill=statecolor,draw=statecolor,text=statetextcolor,font=\normalsize,scale=0.8]
  \path [use as bounding box] (-4.5,-1.75) rectangle (3,2.0);
  \begin{pgfonlayer}{nodelayer}
    \node [small dot] (0) at (-4.0, -0.05) {};
    \node [state,scale=0.7] (1) at (-3.75, 0.75) {$F, C, V, B$};
    \node [state] (2) at (-3, 1.75) {$F, V$};
    \node [state,scale=0.8] (3) at (-2, 0.75) {$F, V, B$};
    \node [state] (4) at (-2, -0.75) {$V$};
    \node [state] (5) at (-0.5, 1.25) {$F$};
    \node [state,scale=0.8] (6) at (-0.75, -1.5) {$V, C, B$};
    \node [state,scale=0.8] (7) at (0.75, 0.5) {$F, C, B$};
    \node [state] (8) at (0.75, -1) {$C$};
    \node [state] (9) at (2, -0.5) {$C, B$};
    \node [state,scale=0.7] (10) at (2.25, 0.3) {\Huge \CIRCLE};
  \end{pgfonlayer}
  \begin{pgfonlayer}{edgelayer}
    \draw [trans] (0) to (1);
    \draw [trans, bend right=45, looseness=1.05] (1) to (2);
    \draw [trans, bend right, looseness=1.05] (3) to (4);
    \draw [trans, bend right] (3) to (5);
    \draw [trans, bend right] (4) to (6);
    \draw [trans, bend right, looseness=1.25] (6) to (8);
    \draw [trans, bend right, looseness=1.25] (8) to (9);
    \draw [trans] (9) to (10);
    \draw [trans, bend right, looseness=1.25] (5) to (7);
    \draw [trans, bend right, looseness=1.05] (7) to (8);
    \draw [trans, bend right] (2) to (1);
    \draw [trans, bend right=15] (2) to (3);
    \draw [trans, bend right] (4) to (3);
    \draw [trans, bend right=45] (6) to (4);
    \draw [trans, bend right=45, looseness=1.25] (8) to (6);
    \draw [trans, bend right] (9) to (8);
    \draw [trans, bend right] (7) to (5);
    \draw [trans, bend right=45, looseness=1.05] (5) to (3);
    \draw [trans, bend right] (3) to (2);
    \draw [trans, bend right=15] (8) to (7);
  \end{pgfonlayer}
\end{tikzpicture}
\end{center}

## Summarizing state transition diagrams

To summarize, the above state transition diagram
contains all the information in the preceding tables and
more. In addition, it obeys simple, well-known rules
that make it unambiguous when used to write software.

## Programming example

State Transition Diagram Example 2, A Computer Program.
The most common use of state
transition diagrams is so that teams working with
software can discuss the software in a precise formal
way even though most team members can not read the
actual computer programs under discussion. A maxim
popularized by blogger Joel Spolsky is that \textit{it
is easier to write computer programs than to read them}.
If this maxim is true, then even team members who can
read a given program will find it burdensome.

## Reading programs

The main use of Spolsky's maxim in practice is to warn
against rewriting existing programs, a strong temptation
if the maxim is true. Spolsky argues that existing
programs usually encode considerable business
information that may not be obvious and may be lost in
rewriting. Instead, Spolsky argues for identifying ways
for teams to communicate about existing programs rather
than rewriting them. This argument sometimes leads to
the use of diagrams, including state transition
diagrams.

## Some Python code

To illustrate, here is a fragment of code, written
in Python, a language named after the
group Monty Python. Python uses indentation to
group program statements, so Python reads all the
following as part of the function `cyclic()` and
the last two lines as being
\textit{inside} a `while` loop. In addition, Python
uses the `=` to assign values to symbols. So anything on
the left side of a `=` is a symbol that takes on the
value expressed on the right side of the symbol.

## Python code fragment
\subt{an infinite loop}

\begin{center}
\begin{lstlisting}[language=Python,tabsize=8,basicstyle=\small\ttfamily]
    cyclic()
        x=0
        y=0
        while (y<100)
            x=remainder(x+1,4)
            y=2x
\end{lstlisting}
\end{center}

## Narrative

A narrative description of the code fragment is as
follows. First, the code is encapsulated under the name
`cyclic()` and will be run whenever `cyclic()` appears
in the larger program of which this is a fragment. Next,
$x$ and $y$ are both set to represent 0.
Finally, a while loop begins that will continue as long as
$y$ is less than 100. Within each iteration of that
loop, $x$ is set to the reminder of the Euclidean
(integer) division of $x+1$ and 4. Next, $y$ is set to
be twice the value of the new value of $x$.

## Euclidean division

Euclidean (integer) division is an operation that
returns an integer quotient and an integer remainder
for the division of one whole number by another, rather
than including a decimal approximation of the result.
Euclidean division of 1 by 4 returns the quotient 0 and
remainder 1. Similarly,
2/4=(0,2),
3/4=(0,3), 
4/4=(1,0), 
5/4=(0,1), 
6/4=(0,2), 
7/4=(0,3), 
8/4=(2,0), 
et cetera.
Only the second
integer of the (quotient, remainder) pair is returned by
`remainder()`.

## Running the code

Running the Python code will begin with the following values
of $x$ and $y$, then repeat the same pattern infinitely,
until stopped by some external means.

\begin{center}
\begin{tabular}{rrrrrrrrrrrrrr}          \toprule
$x$ & 0 & 1 & 2 & 3 & 0 & 1 & 2 & 3 & 0 & 1 & 2 & 3 & $\cdots$ \\
\midrule
$y$ & 0 & 2 & 4 & 6 & 0 & 2 & 4 & 6 & 0 & 2 & 4 & 6 & $\cdots$ \\
\bottomrule
\end{tabular}
\end{center}

## Infinite loop

The above code is an example of an \textit{infinite
loop}. It is an overly simplified example of code used
as a counter to do one thing after another thing happens
every $n$ times. For instance, in a game program, it may
be necessary for the program to do something after each
of $n$ players has taken a turn.

## Infinite loop diagram

\begin{center}
\begin{tikzpicture}[scale=1.6]
  \tikzset{
        small dot/.style={fill=dotcolor,draw=transcolor,circle,scale=0.9},
        trans/.style={->,very thick,fill=none,draw=transcolor}
  }
  \tikzstyle{every state}=[
    inner sep=0pt,
    draw=statecolor,
    fill=statecolor,
    text=statetextcolor,scale=1.2
  ]
  \path [use as bounding box] (-2,-1.0)
  rectangle (2,1.0);
  \begin{pgfonlayer}{nodelayer}
    \node [state] (0) at (-1.25,  0.60) {$\genfrac{}{}{0pt}{}{x=0}{y=0}$};
    \node [state] (1) at (-1.25, -0.60) {$\genfrac{}{}{0pt}{}{x=1}{y=2}$};
    \node [state] (2) at  (1.25, -0.60) {$\genfrac{}{}{0pt}{}{x=2}{y=4}$};
    \node [state] (3) at  (1.25,  0.60) {$\genfrac{}{}{0pt}{}{x=3}{y=6}$};
    \node [small dot] (4) at (-0.7, 0.2) {};
  \end{pgfonlayer}
  \begin{pgfonlayer}{edgelayer}
    \draw [trans] (4) to (0);
    \draw [trans, bend right=45, looseness=1.25] (0) to (1);
    \draw [trans, bend right=15, looseness=1.05] (1) to (2);
    \draw [trans, bend right=45, looseness=1.25] (2) to (3);
    \draw [trans, bend right=15, looseness=1.05] (3) to (0);
  \end{pgfonlayer}
\end{tikzpicture}
\end{center}

## Properties of the diagram

The state transition above is
compact and conveys that the code represents an infinite
loop, something that is often not obvious when
examining a code fragment directly.
Note that the above diagram differs from the
previous diagram in that, since it represents
an infinite loop, there is no pointer to an end state.

## Abbreviated exercise: diagram a vending machine

Work individually or as a pair to diagram a simple
vending machine with the following properties.

- Each item costs fifty cents
- Machine accepts only nickels, dimes, quarters
- Any other coin or slug is rejected
- Accept a button push if machine has enough money to
  dispense a product
- Five uniquely identifiable buttons exist
- Respond to button push by turning the corresponding
  curl\-icue for 4 seconds

## Abbreviated exercise details

- The curlicue is a twisted piece of metal that holds
  items for sale in a window
- The customer is responsible for seeing that a given
  curlicue is empty and not pressing the button beneath
  it
- The rotation of the curlicue pushes the front item
  into a tray and moves any remaining items forward

## Abbreviated exercise goals

- The machine must be cheap to make (no artificial
  intelligence so only primitive tasks can be
  accomplished)
- The machine must not cost the company due to mistaken
  processing
- The machine must not irritate the customer due to
  mistaken processing

## Abbreviated exercise solutions

- Several solutions are possible
- Try to refrain from looking at the solution on the
  next slide until you have thought about the problem
  and tried various sketches for at least an hour
- Seriously, you will learn much more if you try without
  knowing more than than that
    - circles represent states and
    - arrows represent legal actions that transition
      from one state to another

## Abbreviated exercise hints

- Seriously, don't look at the next slide!
- If you really need a hint, think of the vending
  machine as a person and imagine that the vending
  machine can only interact with the real world by
  receiving two kinds of signals
    - when a coin is inserted in the slot
    - when a button is pressed signalling an item choice
- Try to avoid making the circles into actions!

## Abbreviated exercise solution example

\begin{center}
  \tikzset{
        small dot/.style={fill=dotcolor,draw=transcolor,circle,scale=0.5},
        trans/.style={->,very thick,fill=none,draw=transcolor}
  }
  \tikzstyle{every state}=[
    draw=statecolor,
    fill=statecolor,
    text=statetextcolor,scale=0.9
  ]
\tikzset{nodes={state}}
    \tikz { \graph [
      clockwise=12,
      edge=trans,
      radius=2.5cm,
    ]
    {10, 15, 20, 25, 30, 35, 40, 45, 50, h[transparent], wait, 5,
     wait->{5,25},
     5->{10,30},
    10->{15,35},
    15->{20,40},
    20->{25,45},
    25->{30,50},
    30->35,
    35->40,
    40->45,
    45->50,
    };
    \draw[trans,->,bend left=60] (wait) to (10);
    \draw[trans,->,bend left=60] (5) to (15);
    \draw[trans,->,bend left=60] (10) to (20);
    \draw[trans,->,bend left=60] (15) to (25);
    \draw[trans,->,bend left=60] (20) to (30);
    \draw[trans,->,bend left=60] (25) to (35);
    \draw[trans,->,bend left=60] (30) to (40);
    \draw[trans,->,bend left=60] (35) to (45);
    \draw[trans,->,bend left=60] (40) to (50);
    \node[state,at={(-4.5,0)}] (a) {A};
    \node[state,at={(-3.5,0)}] (b) {B};
    \node[state,at={(-2.5,0)}] (c) {C};
    \node[state,at={(-1.5,0)}] (d) {D};
    \node[state,at={(-0.5,0)}] (e) {E};
    \node[small dot,at={(-3.55, 1.75)}] (f) {};
    \draw[trans,<-] (a)--(50);
    \draw[trans,<-] (b)--(50);
    \draw[trans,<-] (c)--(50);
    \draw[trans,<-] (d)--(50);
    \draw[trans,<-] (e)--(50);
    \draw[trans,->] (a)--(wait);
    \draw[trans,->] (b)--(wait);
    \draw[trans,->] (c)--(wait);
    \draw[trans,->] (d)--(wait);
    \draw[trans,->] (e)--(wait);
    \draw[trans,->] (f)--(wait);
    }
\end{center}


## Full exercise: diagram a vending machine

*Note: this full exercise would be for a separate grade
equivalent to a quiz.*
Create a state transition 
diagram for a specific vending machine. Actually visit 
the vending machine and use it and take notes on the 
various states of the machine and the paths through 
them. Provide a diagram detailed enough for a programmer 
to write a program to control the vending machine.

## Vending machine description

Since some actual vending machines are too simple to be
useful in learning to draw state transition diagrams,
assume your vending machine has at least the following
minimum complexity. Feel free to ignore these rules if
you choose an actual vending machine that is more
complex.

## Vending machine properties

1. The vending machine must accept at least nickels,
   dimes, and quarters.
2. The vending machine must offer items of at least
   three different prices, 55\textcent, 65\textcent, and
   75\textcent.
3. The vending machine has items arranged in rows
   marked $A$--$E$ and columns marked 1--5 so that the
   customer must press a letter button and a number button
   to select an item.

\noindent
We conclude our discussion of state transition diagrams by looking at graph drawing.

[http://en.wikipedia.org/wiki/Graph_drawing](http://en.wikipedia.org/wiki/Graph_drawing)

## UML class diagrams
A UML class diagram is a bunch of boxes representing classes connected by lines representing relationships between classes. Each class is represented by a three-part box. The box contains the name of the class in the top part, the names and types of attributes in the second part, and the names, parameter lists, and return types of methods in the third part. (The following examples are all from the `pgf-umlcd` manual for drawing class diagrams in \LaTeX.)

\begin{center}
\begin{tikzpicture}[scale=0.8,every node/.style={scale=0.8}]
  \begin{class}[text width =8 cm]{ClassName}{0 ,0}
    \uattribute{name : attribute type}
    \uattribute{name : attribute type = default value}
    \operation{name ( parameter list ) : type of value returned}
    % virtual operation
    \operation[0]{name ( parameters list ) : type of value returned}
  \end{class}
\end{tikzpicture}
\end{center}

Normally, you also show the visibility of each attribute and method, using a plus sign to indicate public visibility and a minus sign to indicate private visibility. You can, for instance, look at the final project source code and see how to represent the visibility of all the methods and attributes in the classes of that project.

The usual types of visibility follow (but there are other uncommon ones):
\begin{itemize}
     \item[+]{Public}
     \item[\#]{Protected}
     \item[$-$]{Private}
     \item[$\sim$]{Package}
\end{itemize}

Here is an example of their usage. Note that *protected* means that the method is visible only within the class and its subclasses.
\begin{center}
 \begin{tikzpicture}[scale=0.8,every node/.style={scale=0.8}]
   \begin{class}[text width=7cm]{BankAccount}{0,-3}
     \uattribute{+ owner : String}
     \uattribute{+ balance : Dollars}
     \operation{+ deposit( amount : Dollars )}
     \operation{+ withdrawal( amount : Dollars )}
     \operation{\# updateBalance( newBalance : Dollars)}
   \end{class}
 \end{tikzpicture}
\end{center}

You may indicate an abstract class in one of several ways. You can use double angle brackets around the name, double angle brackets around the word abstract, or by writing the name in italics.

\begin{center}
 \begin{tikzpicture}[scale=0.8,every node/.style={scale=0.8}]
   \begin{abstractclass}[text width=5cm]{BankAccount }{0 ,0}
    \uattribute{owner : String}
    \uattribute{balance : Dollars = 0}
    \operation{deposit(amount : Dollars)}
    \operation[0]{withdrawal(amount : Dollars)}
   \end{abstractclass}
 \end{tikzpicture}
\end{center}

The same is true of interfaces.

\begin{center}
 \begin{tikzpicture}[scale=0.8,every node/.style={scale=0.8}]
   \begin{interface}{Person}{0,0}
    \uattribute{firstName : String}
    \uattribute{lastName : String}
   \end{interface}
 \end{tikzpicture}
\end{center}

Several relationships are important to show in UML class diagrams. These include inheritance, interface implementation, association (both bidirectional and unidirectional), aggregation, and composition.
Here is an example of each. Note that the symbol is always next to the parent or whole in an inheritance or part-whole relationship.

Inheritance is shown by an open triangle next to the parent or superclass in the relationship and a solid line to the child or subclass. You can, for instance, check the source code of the final project for the keyword `extends` to find an example of inheritance.

\begin{center}
  \begin{tikzpicture}[scale=0.6,every node/.style={scale=0.6}]
  \begin{class}[text width=5cm]{BankAccount}{0,0}
    \uattribute{owner : String}
    \uattribute{balance : Dollars = 0}
    \operation{deposit(amount : Dollars)}
    \operation[0]{withdrawal(amount : Dollars)}
  \end{class}
  \begin{class}[text width=7cm]{CheckingAccount }{-5,-5}
    \inherit{BankAccount}
    \uattribute{insufficientFundsFee : Dollars}
    \operation{processCheck ( checkToProcess : Check )}
    \operation{withdrawal ( amount : Dollars )}
  \end{class}
  \begin{class}[text width=7cm]{SavingsAccount}{5,-5}
    \inherit{BankAccount}
    \uattribute{annualInteresRate : Percentage}
    \operation{depositMonthlyInterest ( )}
    \operation{withdrawal ( amount : Dollars )}
  \end{class}
  \end{tikzpicture}
\end{center}

Interface implementation can be shown the same way except that you use a dashed or dotted line instead of a solid line.

\begin{center}
  \begin{tikzpicture}[scale=0.6,every node/.style={scale=0.6}]
  \begin{interface}{Person}{0,0}
    \uattribute{firstName : String}
    \uattribute{lastName : String} 
  \end{interface}
  \begin{class}{Professor}{-5,-5}
    \implement{Person} 
    \uattribute{salary : Dollars}
  \end{class}
  \begin{class}{Student}{5,-5}
    \implement{Person}
    \uattribute{major : String}
  \end{class}
  \end{tikzpicture}
\end{center}

Associations can be unidirectional or bidirectional and have cardinality. Here is an example of a bidirectional relationship. Notice that attributes shown on the line are not shown in the boxes. It's one or the other and preferrably on the line for clarity.

\begin{center}
  \begin{tikzpicture}[scale=0.6,every node/.style={scale=0.6}]
  \begin{class}[text width=7cm]{Flight}{0,0}
    \uattribute{flightNumber : Integer}
    \uattribute{departureTime : Date}
    \uattribute{flightDuration : Minutes}
    \uattribute{departingAirport : String}
    \uattribute{arrivingAirport : String}
    \operation{delayFlight ( numberOfMinutes : Minutes )}
    \operation{getArrivalTime ( ) : Date}
  \end{class}
  \begin{class}{Plane}{11,0}
    \uattribute{airPlaneType : String}
    \uattribute{maximumSpeed : MPH}
    \uattribute{maximumDistance : Miles}
    \uattribute{tailID : String}
  \end{class}
  \association{Plane}{assignedPlane}{0..1}{Flight}{0..*}{assignedFlights}
  \end{tikzpicture}
\end{center}

Unidirectional relationships need an arrow (not an open triangle) at one end.

\begin{center}
  \begin{tikzpicture}[scale=0.6,every node/.style={scale=0.6}]
  \begin{class}[text width=6cm]{OverdrawnAccountsReport}{0,0}
    \uattribute{generatedOn : Date}
    \operation{refresh ( )}
  \end{class}
  \begin{class}{BankAccount}{12,0}
    \uattribute{owner : String}
    \uattribute{balance : Dollars}
    \operation{deposit(amount : Dollars)}
    \operation[0]{withdrawal(amount : Dollars)}
  \end{class}
  \unidirectionalAssociation{OverdrawnAccountsReport}{overdrawnAccounts}{0..*}{BankAccount}
  \end{tikzpicture}
\end{center}

An aggregation is a part-whole relationship where the part can exist without the whole. This is a silly example but it illustrates the point because a wheel can exist without a car. The whole is denoted by an open diamond.

\begin{center}
  \begin{tikzpicture}[scale=0.7,every node/.style={scale=0.7}]
  \begin{class}{Car}{0,0}
  \end{class}
  \begin{class}{Wheel}{7.5,0}
  \end{class}
  \aggregation{Car}{wheels}{4}{Wheel}
  \end{tikzpicture}
\end{center}

A composition, on the other hand, is a part-whole relationship where the part can not exist without the whole. This case is a little more likely to be instantiated in code and you would probably not have a department without a company. The whole is denoted by a closed diamond.

\begin{center}
  \begin{tikzpicture}[scale=0.7,every node/.style={scale=0.7}]
  \begin{class}{Company}{0,0}
  \end{class}
  \begin{class}{Department}{10,0}
  \end{class}
  \composition{Company}{theDepartment}{1..*}{ Department}
  \end{tikzpicture}
\end{center}

If you package some classes, you can portray that in a class diagram by enclosing all the classes in a rectangle with a tab at the upper left corner.

\begin{center}
  \begin{tikzpicture}[scale=0.6,every node/.style={scale=0.6}]
  \begin{package}{Accounts}
  \begin{class}[text width=5cm]{BankAccount}{0,0}
    \uattribute{owner : String}
    \uattribute{balance : Dollars = 0}
    \operation{deposit(amount : Dollars)}
    \operation[0]{withdrawal(amount : Dollars)}
  \end{class}
  \begin{class}[text width=7cm]{CheckingAccount }{-5,-5}
    \inherit{BankAccount}
    \uattribute{insufficientFundsFee : Dollars}
    \operation{processCheck ( checkToProcess : Check )}
    \operation{withdrawal ( amount : Dollars )}
  \end{class}
  \begin{class}[text width=7cm]{SavingsAccount }{5 , -5}
    \inherit{BankAccount}
    \uattribute{annualInteresRate : Percentage}
    \operation{depositMonthlyInterest ( )}
    \operation{withdrawal ( amount : Dollars )}
  \end{class}
  \end{package}
  \end{tikzpicture}
\end{center}

