import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({this.height, this.weight});

  final int height;
  final int weight;

  double _bmi;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return "OverWeight";
    } else if (_bmi > 18.5) {
      return "Normal";
    } else {
      return "UnderWeight";
    }
  }
  String getInterpretations() {
    if (_bmi >= 25) {
      return "Higher than Normal , I guess you should Exercise more";
    } else if (_bmi > 18.5) {
      return "looks Normal to me , Good job !";
    } else {
      return "You should try and eat a bit more";
    }
  }
}
