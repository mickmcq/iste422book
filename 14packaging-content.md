
<!--
  [font=Myriad Web Pro 300px]
  [text-color=#B0FFFF]
  [shading-color=#111122]
  [stage-color=#111122]
  [#111122]
  -- [text-color=orange]
  packages
  # packaging is useful
  #   in many fields
  # in software it can
  #   modularize concerns

-->

# Packages
Packaging is a useful idea in many domains. In software application development it is an opportunity to modularize or to separate concerns.
(See Wikipedia, Steve Zilora's presentations, and Edsger W. Dijkstra, *On the role of scientific thought*, 1982, for some source material for this section.)

<!--

  --
  separation of concerns
  # term coined by Djikstra
  # concerns are whatever
  #   affects information

-->

## Separation of Concerns
This is a term coined by Dijkstra and is a design principle for separating software into sections so that each section addresses a separate concern.
Concerns are sets of information affecting code. We have more cohesive code if one concern affects each module of code. We have less coupling if one concern affects each module of code.

<!--
  --
  coupling and cohesion
  # We want separation of concerns
  #   between modules
  # We want one concern per module

-->

In object oriented programming, classes are modules. The goal is low coupling between classes & high cohesion within classes. Many design principles contribute to separation of concerns. For example, a design pattern like MVC (Model View Controller) separates concerns by separating processing, content, and presentation. Service-oriented design separates concerns into services.

Application of this design principle supports reuse of code because it is self-contained. It eases maintenance because individual changes affect only local code within the class being changed. It enables upgrading portions of an application while leaving other portions untouched. If there is little coupling between classes, entire classes can be swapped in and out without a ripple effect, improving the flexibility of development.

Not only is this a design principle for the construction of classes, it can also serve more broadly. In a layered architecture such as we teach in IST, each layer represents at least one separation of concerns. Each layer may be, say, one or several libraries. In a broader sense, separation of concerns plays a role in logistical distribution control systems, controlling the flow of information and resources throughout the supply chain.

## Namespaces
As your code library grows, so does the chance of re-defining a function or class name that has been declared before. 
The problem increases when you attempt to add third-party components or plugins. 
What if two or more code sets implement a *Database* or *User* class?

A namespace is similar to a drawer in which you can put all kinds of things and then label the drawer.
Declare a function, class, interface and constant definitions with the same name in separate namespaces without receiving fatal errors.
 A namespace is a hierarchically labeled code block holding regular PHP/C# code.

### PHP as a namespace example
Namespaces in PHP obey the following conventions.
All constant, class, and function names are placed in the global space by default.
You don’t have to use namespaces.
Namespaced code is defined using a single namespace keyword at the top of your PHP file. 
It must be the first command in the file and no non-PHP code, HTML, or white-space can precede the command.
A namespace name should obey the same rules as other identifiers in PHP.

```php
<?php 
   // define this code in the 'MyProject' namespace 
namespace MyProject; 
   // ... code ...
```
\noindent
The code following this line will be assigned to the MyProject namespace. 
You can’t nest namespaces or define more than one namespace for the same code block.
You can define different namespaced code in the same file (but it is not recommended).

```php
<?php 
namespace MyProject1; 
   // PHP code for the MyProject1 namespace 
namespace MyProject2; 
   // PHP code for the MyProject2 namespace 
   // Alternative syntax 
namespace MyProject3 { 
   // PHP code for the MyProject3 namespace 
} 
?>
```
\noindent
If you want to assign a code block to the global space, you use the namespace keyword without appending a name:

```php
<?php 
namespace {
   // Global space!
}
...
?>
```
\noindent
How do you call code from a namespace in PHP?
To instantiate a new object, call a function or use a constant from a different namespace, use the backslash notation.
 This can be resolved from three different view points:

- Unqualified name
- Qualified name
- Fully qualified name

### Unqualified name
This is the name of a class, function or constant without including a reference to any namespace.

```php
<?php
namespace MyProject;
class MyClass {
   static function static_method() {
      echo 'Hello, world!';
   }
}
 
// Unqualified name, resolves to the namespace you are
// currently in (MyProject\MyClass)
MyClass:static_method();
```

### Qualified name
Access the sub-namespace hierarchy using the backslash notation.
This is relative to the namespace you are currently in.

```php
<?php
namespace MyProject;
require 'myproject/database/connection.php';
// Qualified name, instantiating a class from a
// sub-namespace of MyProject
$connection = new Database\Connection();
```

### Fully qualified name
The unqualified and qualified names are both relative to the namespace you are currently in. 
They can only be used to access definitions on that level or deeper into the namespace hierarchy.
To access something at a higher level in the hierarchy, use the fully qualified name, i.e., an absolute path rather than relative. 
Prepend your call with a backslash.

```php
<?php
namespace MyProject\Database;
 
require 'myproject/fileaccess/input.php';
 
// Trying to access the MyProject\FileAccess\Input class
// This time it will work because we use the fully qualified
//  name, note the leading backslash
$input = new \MyProject\FileAccess\Input();
```

## JARs
Java Archives or Jars, are a form of packaging for Java. To understand them, we have to review packaging, package creation, using packages, and package directory structure in Java. Then we can discuss Jar files and their manifests.

### Packages
Packages are similar to namespaces in other languages.
They are used in Java mainly to prevent naming conflicts but have other uses.
They can be defined as a grouping of related types (e.g. classes, interfaces, enumerations and annotations ) that provides access protection and name space management.
Java has many existing packages (e.g. java.lang, java.net, etc.)

You can define your own packages to bundle groups of classes/interfaces, etc. 
It is a good practice to group related classes so you can easily tell that they are related.
Packaging creates a new namespace so no name conflicts with names in other packages.

### Package creation
To create a package, choose a name for the package.
 Put a `package` statement with that name at the top of every source file that you want to include in that package.
The `package` statement should be the first line in the file. 
Use lowercase names for your packages to avoid conflicts with the names of classes or interfaces.
There can be only one `package` statement in each source file, and it applies to all types in the file. 
If you don’t include a `package` statement, all types will be put into an unnamed package.

### Using packages
If another class wants to include classes within the same package, they can just use them.
If the desired class is not in the same package, the class that wants to use the other class must

- use the fully qualified name, e.g., `payroll.Employee`.
- include the other package using the import keyword and the wild card `*`, e.g., `import payroll.*;` 
- import the class itself using the import keyword, e.g.,
 `import payroll.Employee;` 

You can use any number of import statements but they must be after the package statement and before the class declaration.

### Package directory structure
What happens when a class is placed in a package?
The name of the package becomes a part of the name of the class.
The name of the package must match the directory structure where the corresponding class file(s) exist.
Depending upon your development environment, you may have to create the directory structure or it may be created for you.
There needs to be a directory structure that follows the package structure.

As a simple example, consider `package payroll;`.
It only needs a payroll directory, i.e., `/payroll/Employee.class`

As a complex example, consider one for Acme, and the usual custom of using a company's Internet domain name, i.e.,

```java
package com.acme.payroll;
```
\noindent with a directory structure

```java
/com/acme/payroll/Employee.class
```
\noindent If you don’t use reverse domain name, the structure is still the order of the package name, so

```java
package myaccountingprogram.payroll;
```
\noindent uses a directory structure

```java
/myaccountingprogram/payroll/Employee.class
```
\noindent These locations need to be added to the classpath.

### Jar file definition
A Jar file is a way to place multiple files in one archive.
A Jar file can be  implicitly referenced by putting it into an
*extension directory* which is the lib/ext subdirectory underneath the installed JRE location by default.
Wildcards can be used in the classpath to refer to all jar files in a directory, e.g., `lib/*`.
A Jar file can hold more than code, e.g., properties files and configuration files.

### Jar file benefits

- Security – Digital signature
- Decreased download time – one transmission
- Compression – efficient storage
- Packaging for extensions
- Package sealing – All files in 1 jar, version consistency
- Package Versioning – Holds data about contained files
- Portability – Jars are standard part of Java’s core

### Jar format
Java archives are stored in the zip format. This is a widely used format and a lossless form of compression. Because of this, zip utilities may be used to do limited processing of Jar files, although this should probably be restricted to viewing and extracting since zip utilities lack features needed to build Jar files. Instead, use the `jar` tool or a tool based on it to manipulate Jar files.

### The jar tool
Every Java installation includes a tool called `jar` for manipulating Jar files.

\begin{figure}
\includegraphics[width=4in]{fiJarTool.png}
\caption{man page for the jar tool}\label{fiJarTool}
\end{figure}

By saying `man jar` at the terminal, you can see the uses of this tool as shown in figure \ref{fiJarTool}. The main activities are to create, update, extract, list table of contents, and add index. You can see by the synopsis that `c` means create, `u` means update, `x` means extract, `t` means list table of contents, and `i` means index.

The usual practice of `man` page synopses is to list optional argument in square brackets. Thus you can see that `v` for verbose is optional. What is not optional for most of the commands is `f` for file, which is followed by the name of the Jar file. Because `man` pages are a valuable but hard-to-read form of documentation, it is worthwhile to learn their syntax so you can get the most out of them. In the terminal window I usually rely on, the `jar (1)` page presents about a dozen screens of information. A section called *OPTIONS* describes the options in detail and a section called *EXAMPLES* provides examples of common use. Frequently when you google information about a tool like `jar`, some of the first few hits will be versions of the `man` page or at least based on the `man` page.

### The Jar file manifest
This contains information about the jar file.
It consists of a set of name-value pairs.
Java can sometimes be touchy about carriage returns and whitespace so use a build utility or IDE to create the JAR file. The pathname of the manifest in a Jar file is `META-INF/MANIFEST.MF`.

Utilities that manipulate Jar files look at the manifest for information. If the Jar file is to be executable, the most important information is the name of the entry point, the class to be executed when the Jar file is run. That class is listed as

```java
Main-Class: Bla
```
\noindent if `Bla` is the fully qualified name of the class to be executed. In the final project for this course, you might want that line to read

```java
Main-Class: RunEdgeConvert
```
\noindent so that the EdgeConvert program is run. Bear in mind that this assumes `RunEdgeConvert` to be the fully qualified name. If you create an elaborate packaging structure, your invocation must match that structure. You can specify the entry point when you run a Jar file from the terminal.
For example, if you package the final project in a jar file called `EdgeConvert.jar` you might run the program by saying

```bash
java -cp EdgeConvert.jar RunEdgeConvert
```
\noindent at the terminal. If you have a correctly formed manifest file in the Jar file, you can rely on Java to find the main class by saying

```bash
java -jar EdgeConvert.jar
```

If you want to double-click the Jar file in a graphical file explorer, you have to rely on a utility to look in the manifest and identify that `RunEdgeConvert` is the main class. On Mac OS X and Windows, such utilities are built into the Finder and Explorer, respectively. On Linux you would need to add such a utility via a package installer.

### Package sealing
The manifest can provide notification of package sealing, meaning that all classes defined in the package are archived in the Jar file. This can provide version consistency or security. This involves a name-value pair in the manifest saying `Sealed: true` This line must follow a line establishing the package name and ensures that Java will only use classes from this Jar file whenever a program requires classes with this package name.

### Package versioning
Several lines in the manifest file can provide version information, including both specification and implementation name-value pairs for title, version, and vendor. These should appear directly after a package name.

### Specification of dependencies
You can specify other needed Jar files in the manifest file. These must all be specified on one line with spaces instead of colons, e.g.,

```java
Class-Path: . acme.jar path/to/bla.jar
```

## DLLs
Microsoft uses Dynamic Link Libraries, DLLs. Each library is a set of classes and other resources, possibly including images, strings, and more.
DLLs are external to a program. A program needs to reference a DLL to use it. A DLL is loaded into memory only when needed, although it may be loaded at program startup. A DLL may be purged from memory when needed.

DLLs were originally conceived as modules that could be located in a central location to promote reuse.
It turned out not to be possible to coordinate the efforts of developers of Windows applications.
According to Wikipedia (see [https://en.wikipedia.org/wiki/DLL_Hell](https://en.wikipedia.org/wiki/DLL_Hell), the complications that result are 
known as DLL Hell. It even rhymes.
It is a Windows-specific form of dependency hell, which unfortunately does not rhyme.

Microsoft today promotes several solutions to dependency problems with DLLs, including
the .NET framework,
Microsoft Virtual PC, and
Microsoft Application Virtualization, and
side-by-side assembly (see [https://en.wikipedia.org/wiki/ Dynamic-link_library](https://en.wikipedia.org/wiki/Dynamic-link_library)).

