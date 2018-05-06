import unittest
import inspect
import shutil
import os
from gradescope_utils.autograder_utils.json_test_runner import JSONTestRunner
from tests.test_assignment import TestAssignment
import sys

if __name__ == '__main__':
    if os.path.exists("../reference-output"):
        shutil.rmtree("../reference-output")
    os.makedirs("../reference-output")

    suites = unittest.defaultTestLoader.discover('tests')
    for suite in suites:
        for test_class in suite:
            for test in test_class:
                test.reference = True
                test()