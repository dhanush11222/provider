import 'package:flutter/material.dart';

class CalculatorModel with ChangeNotifier {
  String _display = '0';
  String _operand1 = '';
  String _operand2 = '';
  String _operator = '';

  String get display => _display;

  void input(String value) {
    if (isOperator(value)) {
      if (_operator.isEmpty) {
        _operator = value;
        _operand1 = _display;
        _display = '0';
      }
    } else if (value == '=') {
      if (_operand1.isNotEmpty && _operator.isNotEmpty && _display.isNotEmpty) {
        _operand2 = _display;
        _calculate();
      }
    } else if (value == 'C') {
      _clear();
    } else {
      _display = (_display == '0') ? value : _display + value;
    }
    notifyListeners();
  }

  bool isOperator(String value) {
    return value == '+' || value == '-' || value == '*' || value == '/';
  }

  void _calculate() {
    double num1 = double.parse(_operand1);
    double num2 = double.parse(_operand2);
    double result;

    switch (_operator) {
      case '+':
        result = num1 + num2;
        break;
      case '-':
        result = num1 - num2;
        break;
      case '*':
        result = num1 * num2;
        break;
      case '/':
        result = num2 != 0 ? num1 / num2 : 0.0;
        break;
      default:
        result = 0;
    }

    _display = result.toString();
    _operator = '';
    _operand1 = '';
    _operand2 = '';
  }

  void _clear() {
    _display = '0';
    _operand1 = '';
    _operand2 = '';
    _operator = '';
  }
}
