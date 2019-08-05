
# Efficient code

## Efficiency concepts
One definition of *efficient* is to achieve maximum productivity subject to some limit on wasted effort or expense. Using that definition suggests several resources you don't want to waste when you code. One is runtime: you want the program to run no more slowly than it must. Another is developer time: you want to spend as little time as possible developing the code. A third is maintenance time: you want maintenance to be achievable in as little time as possible. Are there other forms of efficiency? You could group the above under the umbrella of resources and then you might include machine resources. Are there more?

You might be able to obtain one of the above efficiencies at the cost of another. For example, a faster machine may minimize the effect of underperforming code. You might be able to reduce development time through more hastily written, poorly thought through code that will be harder to maintain.

Obtaining any of the above efficiencies may come at the cost of other resources. For example, organizations have standards and must often follow regulations or laws that are time-consuming to take into account.Increasingly, laws and rules meant to protect confidentiality require programming time. Safety regulations may require extra coding as more and more systems find their way into different aspects of our lives.

Different computing domains demand different trades between the above efficiencies. For example, local computing on an Apple Watch is more machine-constrained than desktop computing. Networked computing is increasingly metered so the machine costs are becoming more salient. For example Amazon's Elastic Compute 2 environment (EC2) offers different levels of machine performance at different prices.

When you have large programming teams and high turnover, reducing maintenance time may be the most desired efficiency. In public-facing web apps, time to market is the most critical variable, so minimizing development time is by far the most important efficiency.

## Examples of runtime efficiency
Following are some examples concerning runtime efficiency, mostly with loops. Bear in mind that correcting these mistakes may take time and energy away from other kinds of efficiency. It is obviously better to get it right the first time when possible.

## Redundant function calls
The following checks the size of an array in each iteration. Instead, the array length should be assigned to a temporary variable before beginning the loop.

```perl
for ($i=0;$i<count($myArray);$i++) {
  # do something that doesn't affect the array
}
```

The following performs the same computation over and over again inside a loop. It seems obvious that it should be changed to lowercase outside the loop, but things like this happen.

```perl
$constString="This is some constant text";
for ($i=0;$i<$size;++$i) {
  print trim(strtolower($constString));
  # do something unrelated
}
```

## Function call overhead
If a function does too little as in the following case, it may make more sense to do the computation inline instead.

```perl
function average($x,$y) {
  return ($x+$y)/2;
}
...
for ($i=0;$i<$size;++$i) {
  $arr[$i]=average($a[$i],$b[$i]);
  ...
}
```

## Creating and destroying objects
This incurs some overhead so it may be best done outside loops and modify its properties inside the loop. First, a less efficient approach:

```perl
for ($i=0;$i<$size;++$i) {
  $pt = new Point($i,$arr[$i]);
  # do something with $pt
}
```

A more efficient approach:

```perl
$pt = new Point();
for ($i=0;$i<$size;++$i) {
  $pt->x =$i; $pt->y=$arr[$i];
  # do something with $pt
}

```

## Reducing work in a function
If special cases of a function may limit the work undertaken by a function, code those cases at the beginning of the function to avoid the later work.

```perl
function toUpperSubstr($string,$start,$end) {
  if ($string=="") return "";
  if ($end<0||$end<$start) return $string;
  # do the actual work
}
```

## Network communication
It may improve runtime efficiency to group network communications together, as in grouping requests for data. Using a system that supports callbacks, such as Node.js, may make network communications consume less runtime. Chunking data may improve a client's perception of runtime by returning some result before a final result is complete. For example pages of a report may be delivered and consumed as intermediate stages before an entire report is complete.

## Inadvertent duplication
A slideshow about efficiency calls the following an example of inadvertent duplication. Without reading further, explain why this is an example of inadvertent duplication.

```java
class Line {
  Point start;
  Point end;
  Double length;
  ...
}
```
One issue that I have noticed in my Beginning Java course is that some of the students are uncomfortable with concepts such as geometry that are needed in programming but assumed to have been covered elsewhere. So it may make sense to be explicit about examples like this one. For instance, the author of the example may have meant that it is duplication to define a line class because Java already has the Line2D class and its subclasses.

On the other hand, the author could have meant that it is duplication to encode the length in an instance variable since length can be inferred from the start and end points. Therefore, length should more properly be determined by a method. The Java Line2D and Line2D.Double classes, by the way, do not have a method to determine line length. You might extend those methods, in which case the above example should probably have an *extends* modifier.

## Refactoring

Refactoring is the act of improving code without changing its external behavior.

Martin Fowler’s *Refactoring, Improving the Design of Existing Code* is the definitive reference. Following are some partial entries from Fowler's catalog of refactorings. These are examples of refactoring, not the complete definitions given in Fowler's catalog, which occupies six chapters of the above-mentioned volume.

### Extract a method from a code fragment
Suppose you have a code fragment that makes sense grouped together.

```java
printStuff() {
   printBanner();
// print details
   System.out.println("Name: "   + this.name);
   System.out.println("Amount: " + this.amount);
}
```
may be refactored as
```java
printStuff() {
   printBanner();
   printDetails();
}
printDetails() {
   System.out.println("Name: "   + this.name);
   System.out.println("Amount: " + this.amount);
}
```

### Explain the meaning of a construct
Simplify a complicated fragment so that a casual reader may immediately comprehend the intention.

```java
if ( (platform.toUpperCase().indexOf("MAC") > -1 ) &&
     (platform.toUpperCase().indexOf("IE")  > -1 ) &&
                                  wasInitialized() &&
                                      (resize > 0) ) {
   //do something only under this set of conditions
}
```
may be refactored as
```java
final boolean isMac
     = platform.toUpperCase().indexOf("MAC") > -1;
final boolean isIE
     = platform.toUpperCase().indexOf("IE")  > -1;
final boolean wasResized
     = (resize > 0);
if (isMac && isIE && wasInitialized() && wasResized) {
   //do something only under this set of conditions
}
```

### Simplify a compound condition
The author of this example may have left the rest of the exercise to the reader. It might be worthwhile to add that this refactoring requires some additional methods. It may be the case that, if we wrote those out, we might write them differently. See what you think.

```java
if (date.before(SUMMER_START)||date.after(SUMMER_END))
 charge=quantity*this.winterRate+this.winterServiceCharge;
else
 charge= quantity * this.summerRate;
```
may be refactored as
```java
if (isSummer(date))
    charge = calcSummerCharge(quantity);
else
    charge = calcWinterCharge(quantity);
```
Might it make more sense to write a method to replace the if and the two methods posited above? Or would that contradict some of the examples below? Would it turn out that very little of the code depended on the parameters? It depends on what else is going on in the code. Given the little we see here, there are two rates, one conditional service charge, and two dates defining the two seasons. If that is everything, I would group the rates and service charge into a method called by `calcCharge(date,quantity)` and the dates and season calculation into another method called by `getSeason(date)` from within the other method.

### Replace error code with exception
Note. This is not strictly an example of refactoring because it does change behavior.  It may be that the author of this example was thinking about the idea that neither the code nor the exception are seen 'externally'.  It certainly makes sense to avoid passing error codes.
```java
int withdraw(int amount) {
   if (amount > this.balance)
  return -1;
   else
       this.balance -= amount;
       return 0;
}
```
may be 'refactored' as

```java
void withdraw(int amount) throws BalanceException {
   if (amount > this.balance) throw new BalanceException();
   this.balance -= amount;
}
```

### Pull up a field or method
Suppose that two subclasses have the same field or method.
Move the field or method to the parent class.
Use this approach if the field or method exists in all subclasses.
The field or method may have different names so 
ensure that the meaning is the same in each case.

### Push down a field or method
Suppose the behavior of a parent method or field is relevant for only some of the subclasses.
Move the field or method to the appropriate subclasses

### Extract a superclass
Suppose that two classes have similar features.
Create a superclass and move common features to the superclass.
This approach may lead to using the pull up refactoring approaches mentioned above.

### Extract a subclass
A class has features that are used only in some instances.
Create a subclass for that set of features.
This approach may lead to using the push down refactoring approaches mentioned above.

### Add parameters
Suppose that two methods perform similar operations.
Create a parameter-driven method that accomplishes the tasks of both methods.
The goal is to abstract the operation and drive it with parameters
rather than simply using if statements.

```java
class Employee {
  void tenPercentRaise() {
    this.salary *= 1.1;  
  }
  void fivePercentRaise() {
    this.salary *= 1.05;  
  }
}
```
may be refactored as
```java
  void raise (double factor) {
    this.salary *= (1+factor);
  }
```

### Replace temp with query
Temporary variables interfere with a lot of refactoring practices. Replace them with a query as shown in Fowler's example below, where `basePrice` is a temporary variable.

```java
double basePrice = _quantity * _itemPrice;
if (basePrice > 1000)
  return basePrice * 0.95;
else
  return basePrice * 0.98;
```
\noindent may be refactored as

```java
if (basePrice() > 1000)
  return basePrice() * 0.95;
else
  return basePrice() * 0.98;
...
double basePrice() {
  return _quantity * _itemPrice;
}
```

## Why you should refactor
Improve the design of code.
Make software easier to understand.
Make it easier to find bugs.
Speed up the entire programming process.

## When you should refactor
Refactor the third time you do something similar to two other cases.
Refactor when you add functionality.
Refactor when you fix a bug.
Refactor when you do a code review.

## Avoid refactoring
Avoid refactoring if code should be completely rewritten from scratch.
Avoid refactoring if too close to a deadline because you won't realize the benefits of refactoring until after the deadline.

## Signs you should refactor
Following is a list of signs that it is time to refactor, known as *smells* in Fowler's parlance. The notion of *code smells* is waning but these are phenomena you should look up and be ready to be quizzed about. The first one is done for you to give you an idea of the depth to which you should plumb in looking them up.

### Duplicated code
Fowler's suggested refactorings for duplicated code follow.

If the same code occurs in two (or more) methods of one class, extract a method and invoke that method from both (or more) places.

If the same code occurs instead in two sibling subclasses, pull up a method to the superclass.

If the same code occurs in two unrelated classes called A and B, extract a class called C from class A. Then remove the corresponding code from class B and invoke class C in both class A and class B.


Following are examples I might ask about on test. You can find descriptions of these code smells on many websites, such as *Refactoring Guru*.

### Divergent change

### Feature envy

### Data clumps

### Primitive obsession

### Switch statements

