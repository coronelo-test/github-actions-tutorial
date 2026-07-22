# pylint: disable=missing-module-docstring
from src.calculator import Calculator

# pylint: disable=missing-function-docstring
def main() -> None:
    calc = Calculator()
    print(f"Result: {calc.sum(2, 3)}")

if __name__ == "__main__":
    main()
