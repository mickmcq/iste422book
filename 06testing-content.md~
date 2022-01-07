
# Testing
Let's examine testing using a popular unit testing framework with annotations, JUnit. First we'll examine annotations, then unit testing, then the JUnit implementation itself.

## Java annotations
Java annotations are syntactic metadata you can add to source code for various purposes besides testing. An annotation begins with an *at* sign. For example, the built-in annotation `@Override` checks that a method is an override.

An annotation may be processed at compile time.
An annotation may be embedded in a class file and retrieved at runtime. An annotation may simply be informational but it can also support reflection, meaning that it can be used to allow a program to examine and modify its structure or behavior at runtime.

In addition to built-in annotations, you may create your own. The annotation concept is central to many programming frameworks, including the one we're going to study under this topic.

## Unit testing
The practice of unit testing is to automate testing every important small *unit* of code, especially after changes, to ensure that intended functionality is not broken by changes. The set of *units* in a given test is called the test coverage.

Annotations may be used to target specific functionality in unit tests.

## FIRST acronym
The *Clean code handbook*, @Martin2008, offers an acronym to illustrate the values inherent in unit testing

- Fast: many hundreds or thousands per second
- Isolates: failure reasons become obvious
- Repeatable: run in any order at any time
- Self-validating: no manual evaluation required
- Timely: written before the code

You may google Brett Schuchert or Tim Ottinger to find more details about the meaning of this acronym.

## Test-driven development
The T in the FIRST acronym suggests a popular and controversial approach to software development, creating tests as the first and motivating activity in software development. You can tell that it is controversial by reading bloggers like David Hansson and James Coplien. The main issue Hansson takes with it seems to be that it is inadvertently used as a design tool and leads to unintended monstrosities of design. Like many good ideas in software development, it may work best if practiced in moderation and where it is obviously needed. Test-driven development necessarily treats tests as design building blocks. If testing is a form of design, it must be subject to all the problems faced in making design choices. Design choices don't simply vanish with a test-driven approach.

## More unit testing values
Unit tests should be independent of each other. Two tests should not be testing the same thing.

Tests should expose designs that are resistant to testing, since such design may be harder and more expensive to debug than more transparent designs.

Unit tests should form a kind of documentation about what code is supposed to be doing.

Unit tests should limit time wasted on vestigial features, since the most expedient response to a test is to focus on passing it and nothing else.

Test failure may reveal a problem with the test as well as the code being tested.

## JUnit
JUnit is a very successful example of a unit testing framework. While it was originally written by Kent Beck for another language, Smalltalk, and originally called SUnit, it gained widespread popularity when ported to Java as JUnit. It has since been ported to many other languages and is known generically as xUnit where the x is replaced by the first letter of the name of the targeted language. Wikipedia currently lists dozens of xUnit frameworks among over a hundred total unit testing frameworks under its article on unit testing frameworks.

## xUnit components
Kent Beck described the generic components in an article *Simple Smalltalk Testing*, available in various formats online, including @Beck1997. More detail is available in Wallace library in the book *xUnit test patterns* by Gerard Meszaros, @Meszaros2007. The components distilled by Wikipedia include

- Test Fixture: or preconditions or context, is the known good state before the tests
- Test parent class: basis for all test classes
- Test suite: the set of all test classes related to a precondition
- Test runner: an executable program setting up preconditions, running the tests and reporting results, and returning to good state
- Test assertions: functions predicated on logical conditions that evaluate to true if the code behaves correctly, allows throwing an exception that ends a test if incorrect behavior or state is attained
- Test formatter: allows output to be read by either human or other programs

## Assertions in JUnit
These are annotations as previously described. The annotations are added to the code to be tested. The supported annotations include `@Before`, `@Test`, and `@After`. The following test fixture example can be found in Wikipedia.

```java
import org.junit.*;

public class FoobarTest {
    @BeforeClass
    public static void setUpClass() throws Exception {
        // Code executed before the first test method       
    }

    @Before
    public void setUp() throws Exception {
        // Code executed before each test    
    }
 
    @Test
    public void testOneThing() {
        // Code that tests one thing
    }

    @Test
    public void testAnotherThing() {
        // Code that tests another thing
    }

    @Test
    public void testSomethingElse() {
        // Code that tests something else
    }

    @After
    public void tearDown() throws Exception {
        // Code executed after each test   
    }
 
    @AfterClass
    public static void tearDownClass() throws Exception {
        // Code executed after the last test method 
    }
}
```

## Try JUnit
Make a directory called `06junit` and switch to it.
Create a file called `Calculator.java` and write the following code into it.

```Java
public class Calculator {
  public int evaluate(String expression) {
    int sum = 0;
    for (String summand: expression.split("\\+"))
      sum += Integer.valueOf(summand);
    return sum;
  }
}
```

Then create a file called `CalculatorTest.java` and write the following code into it.

```Java
import static org.junit.Assert.assertEquals;
import org.junit.Test;
public class CalculatorTest {
  @Test
  public void evaluatesExpression() {
    Calculator calculator = new Calculator();
    int sum = calculator.evaluate("1+2+3");
    assertEquals(6,sum);
  }
}
```

Now you must download the file `06junit.tar` from myCourses and open it in this directory. First use a browser to download it to the Downloads folder, then issue the following commands.

```bash
cd ~/422/06build
tar xvf ~/Downloads/06junit.tar
ls
```

\noindent You should see two new files called `junit-4.12.jar` and\linebreak `hamcrest-core-1.3.jar`. Now you can compile and run the programs using the following commands.

```bash
javac -cp .:junit-4.12.jar CalculatorTest.java
javac Calculator.java
java -cp .:junit-4.12.jar:hamcrest-core-1.3.jar \
    org.junit.runner.JUnitCore CalculatorTest
```

## Integrating test and build
By now it has no doubt occurred to you to integrate testing into the build process. As an example, create the following integration of JUnit with Ant. Execute the following commands at a terminal prompt. These commands assume that you have downloaded `06junit.tar` from myCourses.

```bash
cd ~/422
mkdir 07junitWithAnt && cd 07junitWithAnt
mkdir lib src test
cd lib
tar xvf ~/Downloads/06junit.tar
cd ..
```

Now create a file called `build.xml` and write the following code into it.

```XML
<project name="JunitTest" default="test" basedir=".">
   <property name="testdir" location="test" />
   <property name="libdir" location="lib" />
   <property name="srcdir" location="src" />
   <property name="full-compile" value="true" />
   <path id="classpath.base"/>
   <path id="classpath.test">
     <pathelement
           location="${libdir}/hamcrest-core-1.3.jar" />
     <pathelement location="${libdir}/junit-4.12.jar" />
     <pathelement location="${testdir}" />
     <pathelement location="${srcdir}" />
     <path refid="classpath.base" />
   </path>
   <target name="clean" >
      <delete verbose="${full-compile}">
         <fileset dir="${testdir}" includes="**/*.class" />
      </delete>
   </target>
   <target name="compile" depends="clean">
      <javac srcdir="${srcdir}" destdir="${testdir}" 
         verbose="${full-compile}">
         <classpath refid="classpath.test"/>
      </javac>
   </target>
   <target name="test" depends="compile">
      <junit>
         <classpath refid="classpath.test" />
         <formatter type="brief" usefile="false" />
         <test name="TestMessageUtil" fork="true"/>
      </junit>
   </target>
</project>
```

Next, change to the `src` directory and write the following code into a file called `MessageUtil.java`.

```Java
/*
 * This class prints the given message on console.
 */
public class MessageUtil {

   private String message;

   //Constructor
   //@param message to be printed
   public MessageUtil(String message){
      this.message = message;
   }

   // print the message
   public String printMessage(){
      System.out.println(message);
      return message;
   }

   // add "Hi!" to the message
   public String salutationMessage(){
      message = "Hello" + message;
      System.out.println(message);
      return message;
   }
}
```

Finally, create a file called `TestMessageUtil.java` in the same directory and write the following code into it.

```Java
import org.junit.Test;
import org.junit.Ignore;
import static org.junit.Assert.assertEquals;

public class TestMessageUtil {

   String message = " World";	
   MessageUtil messageUtil = new MessageUtil(message);
   
   @Test
   public void testPrintMessage() {	
      System.out.println("Inside testPrintMessage()");     
      assertEquals(message,messageUtil.printMessage());
   }

   @Test
   public void testSalutationMessage() {
      System.out.println("Inside testSalutationMessage()");
      /* use the following to make the test succeed */
      message = "Hello" + " World";
      /* use the following to make the test fail */
      /* message = "Hello" + " Weird"; */
      assertEquals(message,messageUtil.salutationMessage());
   }
}
```

Now you can change to the directory containing the `build.xml` file and say `ant`. The output should conclude with something like the following.

```
test:
    [junit] Testsuite: TestMessageUtil
    [junit] Tests run: 2, Failures: 0, Errors: 0,
            Skipped: 0, Time elapsed: 0.079 sec
    [junit] 
    [junit] ------------- Standard Output -----------
    [junit] Inside testSalutationMessage()
    [junit] Hello World
    [junit] Inside testPrintMessage()
    [junit]  World
    [junit] ------------- ---------------- ----------

BUILD SUCCESSFUL
```

## Test bed development
You can use tools like Mockaroo to build test beds that include unusual data and data following expected patterns. Explore Mockaroo as an exercise. If it still allows a free download of some data, take advantage of that.

