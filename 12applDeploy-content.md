
# Application deployment

Here, application deployment is a fancy term meaning transfer of a completed application from the developer to the user. Here, completed means that the developer believes that a complete stranger might really use the application as it is.
Finally, user means someone who may then embrace or reject the application.

Thinking about application deployment and application deployment strategy may require the developer to consider various possibilities, including that a new user adopts the application, an old user updates the application, or that an irate user tries to uninstall the application.

## Dedicated installers
Much of the work of deployment can be foisted off on dedicated install programs. In order to use them, you have to work on your search skills. You have to be able to find installers quickly and evaluate the suitability of any candidates without expending too much time. Following is an example where a student and I looked for an installer and tried to evaluate the health of a community focused on a particular installer. In this example, you see URLs we visited during a search for package installers:

\begin{sloppypar}
\url{https://www.google.com/search?q=app+installer+for+windows&ie=utf-8&oe=utf-8}

\url{https://stackoverflow.com/search?q=good+windows+application+installer+software}

\url{http://www.innosetup.com/isinfo.php}

\url{http://www.innosetup.com/newsgroups.php}

\url{http://news.jrsoftware.org/read/thread.php?group=jrsoftware.innosetup}
\end{sloppypar}

In recent semesters, many groups have used *PackJacket* as an installer for the final project. This is in part because it is free but also because it is cross platform. Finally, there are some Youtube tutorials. You must search for *packjacket installer* or some similar qualifier because an identically-named popular nerd clothing item has sparked plenty of Youtube dork-out videos.

## Deployment environment
The target for the course's final project works with MySQL but would like to be able to work with other databases. How does this affect installation? Should you check to determine whether a particular database is running? Ask the person installing the application about the databases they use? What can you do?

Under any Unix-like operating system, you could use a utility like `ps` or `top` or related system calls to determine whether `mysqld`, the MySQL server, is running. For example, `mysqladmin variables` can be used to query a running copy of `mysqld`. Presumably, similar information can be gathered on Windows.

What other items do you want to know that you could find out during an installation process?

You can ask the user / installer where to put things and what to do if the install program can't do things (administrative permissions) that it wants to do.

You can check for resources. Check network, storage, graphics, processor speed, memory, and other resources. Then the question is how to proceed after these checks? The installer can give up, issue a warning, or try to keep going until stopped cold by failure.

The above describes things the installer can do without the help of the person receiving the install and also dialog with the person receiving the install. One issue is that the person receiving the install may not be the user. The user may be in a locked-down environment and have to request installation by a system administrator.

## System administration
The receiver of application deployment may not be the user but instead the system administrator. In many locked-down enterprise environments, the user is not permitted to install anything. The system administrator must swoop down on the user and try to embarrass the user into making do with whatever is already installed instead of ever installing anything new. (Except Microsoft updates and lowest-cost "antivirus" package updates, of course---if only Ambrose Bierce were alive to catalog these updates.)

The system administrator may face the problem of allowing installs that conflict with each other.

## Holman (2016)
Zach Holman of Github fame authored a lengthy post called *How to Deploy Software* in February 2016. The following sections summarize some of the points made in that post. The entire post is available at
[https://zachholman.com/posts/deploying-software](https://zachholman.com/posts/deploying-software).

## Packages
Holman mentions several popular deployment packages

- Capistrano in Ruby
- Fabric in Python
- Shipit in Node.js
- AWS in general

The point is that there are plenty of good tools. If there is a problem, it is not a lack of tools. As I write this there have been major outages at Google and Github in the last 72 hours. If the top people in the world have trouble with deployments, then tools are not the entire solution.

## Workflow
Holman argues that the startups seeking his advice are too obsessed with particular tools and don't have a sense of what makes a good deployment. He dismisses release managers, deployment days, all hands on deck, and similar drastic measures. Instead, Holman argues for better fundamental processes.

## Testing
The most fundamental process Holman advocates is the development of a good, fast test suite. How fast is fast? Here are the results of his informal Twitter poll in February 2016, asking "How long does your test suite take to run at your company?" The 1,052 responses are summarized in Table \ref{taHowLongTests}.

\begin{table}
  \begin{longtable}{rl}
  19\% & less than a minute\\
  30\% & 1--5 minutes\\
  35\% & 5--30 minutes\\
  16\% & 30+ minutes\\
  \end{longtable}
  \caption{how long test suites run}\label{taHowLongTests}
\end{table}

How can you speed up tests? There are packages, such as parallel_tests and test-queue for Ruby. These aim at parallelizing builds but are limited by interdependence of tests. You have to make tests independent of each other to achieve meaningful time savings.

## Feature Flags
Also known as feature toggles, this allows you to deploy code that is only experienced by a small fraction of users, say, your team. This practice is not without controversy but is a popular way to limit the damage when bad code ships. Inevitably, bad code does ship even if you have the world's top programmers. The practice of limiting new code to a small group of users is often called a *canary launch*, as an analogy to the use of canaries in mines to signal the presence of toxic gases. The users experiencing the new code are the *canaries* who must be monitored for danger signals.

\begin{figure}
\includegraphics[width=4in]{fiAttemptsMismatches.png}
\caption{attempts vs mismatches}\label{fiAttemptsMismatches}
\end{figure}

Github released a library called Scientist (ported to many popular languages) to collect and display statistics on feature flag use. The *attempts vs mismatches* graph in Figure \ref{fiAttemptsMismatches} illustrates the differences between new and legacy codepaths. If the behavior for the new codepath is a mismatch to the legacy behavior, the new code needs to be changed and redeployed until the red line on the graph dwindles to nothing.

Libraries to assist with feature flags include

- Rollout in Ruby
- Togglz in Java
- fflip in JavaScript
- LaunchDarkly (no product yet?)
- GroundControl in iOS

The controversy around feature flags is that they leave a lot of small branches with toggles that are not being used any more after the deployment has been declared a success. Therefore, the last stage of deployment should be cleanup and this is especially important if feature flags are involved. Some environments, such as Github, allow retrieval of deleted branches so it can be a useful practice to automatically delete any old stale branches that have been merged into the master branch.

## Branches
Holman refers to branches, meaning a branch in version control, as the simplest unit of deployment and advocates small branches, pushed to the code host quickly. Pull requests, merge requests or whatever code review practices should follow immediately.

## Code Review
Holman advocates the following three principles for code review in *any* organization, bearing in mind that code review practices vary widely.

- Your branch is your responsibility
- Start reviews early and often
- Someone needs to review

Smaller branches are more likely to receive scrutiny. Large branches are too intimidating for many people. People are happy to criticize 6 lines, hesitant about 60 lines, and unavailable to review 600 lines.
This tendency is illustrated in "Parkinsons Law of Triviality" also known as "Bike Shedding" [https://en.wikipedia.com/wiki/Law_of_Triviality](https://en.wikipedia.com/wiki/Law_of_Triviality), which states that it is human nature that trivial problems or changes get more attention than larger and more imporant ones. The article goes into reasons why this occurs.

## Branch deployment
Holman estimates that a team of ten could deploy 7--15 branches each day, assuming a small branch size. He recommends deploying each branch *before* merging. This way, if something goes wrong, the master branch can always be redeployed. Only when the new branch appears to be successful should it be merged into the master branch. Therefore, the deployment tooling must allow you to deploy a branch to production before merging.

## Blue green deployment
Holman cites a 2010 (modified 2015) article by Martin Fowler at

\begin{sloppypar}
  \noindent\url{http://martinfowler.com/bliki/BlueGreenDeployment.html}
\end{sloppypar}

Fowler says that *One of the challenges with automating deployment is the cut-over itself, taking software from the final stage of testing to live production. You usually need to do this quickly in order to minimize downtime. The blue-green deployment approach does this by ensuring you have two production environments, as identical as possible. At any time one of them, let's say blue for the example, is live. As you prepare a new release of your software you do your final stage of testing in the green environment. Once the software is working in the green environment, you switch the router so that all incoming requests go to the green environment - the blue one is now idle.*

Fowler recommends cutting back to the blue environment if something goes wrong with the new deploy. Depending on circumstances, it may make sense to send input to both environments for a while, or to put the application in read-only mode for a while.

Numerous benefits may be realized with this system. At one time, it would have been necessary to replicate hardware to achieve identical systems but increasingly virtualization may be used. The system also may be used to prepare for disaster recovery since the same virtual machines may be deployed to remote locations.

## Controlling Deployment
Holman discusses four tools for controlling deployment: audit trails, deploy locking, deploy queueing, and permissions.

### Audit trails
Holman regards audit trails as a prerequisite for control of the deployment process. He recommends the following packages to assist with audit trail management.

- Amazon CodeDeploy
- Dockbit
- Deployment API (Github)

He further recommends some time series databases and services.

- InfluxDB
- Grafana
- Librato
- Graphite

Holman recommends examining any metrics along with deployment metrics in a time series as, among other things, a way to explain the source of otherwise mysterious symptoms of trouble.

### Deploy locking
Deploy locking is another tool for controlling deployments. Only allowing one deployment at a time makes sense. Not only must you lock deployments but you must make the locking visible to all developers who may want to deploy code. Holman recommends chat and names Dockbit and SlashDeploy as tools with support for chatrooms.

### Deploy queueing
Deploy queueing is a natural complement to deploy locking. To implement it, you need a way to add names to the queue and a mechanism for *taking cuts* since a first-come first-served queueing discipline does not handle every contingency.

### Permissions
Holman recommends two factor authentication to provide permissions and dual sign-ons. In the case of dual sign-ons he recommends that one of the authenticators be required to be a senior engineer to ensure that someone senior is party to all deployments.
