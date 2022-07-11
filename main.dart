void main() {
  Calculator c = Calculator();
  List<History> history = [];

  print(c.division(6, 5, history));
  print(c.addition(6, 5, history));
  print(c.subtraction(6, 5, history));
  print(c.multiplication(6, 5, history));
  print(history.toString());
}

class History {
  var a;
  var b;
  var op;

  History(this.a, this.b, this.op);

  String toString() {
    return "Performed ${this.op} operation on ${this.a} and ${this.b}";
  }
}

class Calculator {
  int addition(int a, int b, List<History> history) {
    History h = new History(a, b, "addition");
    history.add(h);
    return a + b;
  }

  int division(int a, int b, List<History> history) {
    History h = new History(a, b, "division");
    history.add(h);
    double ans = a / b;
    return ans.toInt();
  }

  int subtraction(int a, int b, List<History> history) {
    History h = new History(a, b, "subtraction");
    history.add(h);
    return a - b;
  }

  int multiplication(int a, int b, List<History> history) {
    History h = new History(a, b, "multiplication");
    history.add(h);
    return a * b;
  }
}
