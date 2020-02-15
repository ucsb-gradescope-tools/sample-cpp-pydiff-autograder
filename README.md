A sample autograder for a C++ assignment to show how diff-based autograding works using the Python unittest framework.

# Local Testing

To generate the reference output, without comparing to a student solution:

> ./MAKE-REFERENCE.sh

The reference output will be in the reference-output directory. Each test has an associated .err and .out file, containing the stdout and strderr respectively. For example, the output for test `test_a` would be in test_a.out and test_a.err. If any extra output files are specified for any of the tests, these files will also be in reference-output.

To grade the solution in STUDENT-SOLUTION-1 (or any other directory):

> ./MAKE-REFERENCE.sh

> ./grade.sh STUDENT-SOLUTION-1

The results will be in results.json.

# Components

## REFERENCE-SOLUTION

A reference solution which will be used to generate the expected outcome for all tests. Like student solutions, this solution will be run with all files from EXECUTION-FILES in the same directory.

## MAKE-REFERENCE<i></i>.py

A Python script that creates the expected output for the tests defined in `tests/test_assignment.py`. **Leave this unchanged when creating your own autograder.**

## BUILD-FILES

Files that should be present when the assignment is being built, e.g. a Makefile.

## tests/test_assignment.py

Defines the tests that will be used to grade the assignment. All diff-based tests should follow the form:

```
@weight(value)
def test_mytest(self):
    self.compareOutput("command")
``` 

Where `value` is the point value of the test, and `command` is a bash command (e.g. "./assignment"). When the test is run, compareOutput asserts that the output of the student solution and reference solution are the same. If they are not, the test fails.

By default, only stdout is checked. compareOutput takes several optional parameters which change the output that is checked:

* `stdout`: Boolean. True by default. If true, the stdout of the student solution is checked against the stdout of the reference solution. If they are different, no points are awarded for this test.

* `stderr`: Boolean. False by default. If true, the stderr of the student solution is checked against the stderr of the reference solution. If they are different, no points are awarded for this test.

* `extra_outfiles`: String array. Empty by default. If not empty, the listed files after running the reference solution are compared to the listed files after running the student solution. For example, if the assignment is supposed to create file "hello.txt", you would call compareOutput with `extra_outfiles=["hello.txt"]`. If the files do not match, no points are awarded for this test.

For a list of possible test annotations (e.g. for indicating whether a test should be visible to a student), see [this page](https://github.com/gradescope/gradescope-utils/tree/master/gradescope_utils/autograder_utils).

## build<i></i>.sh
A bash script for building the assignment. When the assignment is being built, it will have the files in BUILD-FILES in the same directory.

## apt-get<i></i>.sh
A bash script for installing any necessary dependencies for the assignment, e.g. g++.

## requirements<i></i>.txt (optional)
A list of this project's Python requirements.

## requirements3<i></i>.txt (optional)
A list of this project's Python3 requirements.

## grade<i></i>.sh

A bash script for grading the student submission. **Leave this unchanged when creating your own autograder.**
