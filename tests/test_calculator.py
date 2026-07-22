# pylint: disable=missing-module-docstring
"""
This module contains tests for the Calculator class.
"""

from src.calculator import Calculator

# pylint: disable=missing-function-docstring
def test_calculator_sum():
    calc = Calculator()
    assert calc.sum(2, 3) == 5
