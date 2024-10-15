// import 'package:flutter/material.dart';
//
// class CalculatorModel with ChangeNotifier {
//   String _display = '0';
//   String _operand1 = '';
//   String _operand2 = '';
//   String _operator = '';
//
//   String get display => _display;
//
//   void input(String value) {
//     if (isOperator(value)) {
//       if (_operator.isEmpty) {
//         _operator = value;
//         _operand1 = _display;
//         _display = '0';
//       }
//     } else if (value == '=') {
//       if (_operand1.isNotEmpty && _operator.isNotEmpty && _display.isNotEmpty) {
//         _operand2 = _display;
//         _calculate();
//       }
//     } else if (value == 'C') {
//       _clear();
//     } else {
//       _display = (_display == '0') ? value : _display + value;
//     }
//     notifyListeners();
//   }
//
//   bool isOperator(String value) {
//     return value == '+' || value == '-' || value == '*' || value == '/';
//   }
//
//   void _calculate() {
//     double num1 = double.parse(_operand1);
//     double num2 = double.parse(_operand2);
//     double result;
//
//     switch (_operator) {
//       case '+':
//         result = num1 + num2;
//         break;
//       case '-':
//         result = num1 - num2;
//         break;
//       case '*':
//         result = num1 * num2;
//         break;
//       case '/':
//         result = num2 != 0 ? num1 / num2 : 0.0;
//         break;
//       default:
//         result = 0;
//     }
//
//     _display = result.toString();
//     _operator = '';
//     _operand1 = '';
//     _operand2 = '';
//   }
//
//   void _clear() {
//     _display = '0';
//     _operand1 = '';
//     _operand2 = '';
//     _operator = '';
//   }
// }
import 'package:flutter/material.dart';

class CalculatorModel with ChangeNotifier {
  String _display = '0';
  String _operand1 = '';
  String _operand2 = '';
  String _operator = '';

  // Getter for display text
  String get display => _display;

  // Handle input and call appropriate methods
  void input(String value) {
    if (isOperator(value)) {
      _handleOperatorInput(value);
    } else if (value == '=') {
      _handleCalculation();
    } else if (value == 'C') {
      _clear();
    } else {
      _handleNumberInput(value);
    }
    notifyListeners();  // Notify listeners whenever the state changes
  }

  // Check if input is an operator (+, -, *, /)
  bool isOperator(String value) {
    return value == '+' || value == '-' || value == '*' || value == '/';
  }

  // Handle operator input
  void _handleOperatorInput(String operator) {
    if (_operator.isEmpty) {
      _operator = operator;
      _operand1 = _display;  // Store the first operand
      _display = '0';        // Reset display for second operand
    }
  }

  // Handle number input
  void _handleNumberInput(String number) {
    if (_display == '0') {
      _display = number;
    } else {
      _display += number;  // Append the number to the current display
    }
  }

  // Perform calculation when '=' is pressed
  void _handleCalculation() {
    if (_operand1.isNotEmpty && _operator.isNotEmpty) {
      _operand2 = _display;  // Store the second operand
      _calculate();          // Perform the actual calculation
    }
  }

  // Perform the actual calculation
  void _calculate() {
    double num1 = double.tryParse(_operand1) ?? 0;
    double num2 = double.tryParse(_operand2) ?? 0;
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
        result = (num2 != 0) ? num1 / num2 : double.nan;  // Handle division by zero
        break;
      default:
        result = 0;
    }

    _display = _formatResult(result);  // Update display with formatted result
    _clearOperands();                  // Clear operands after calculation
  }

  // Format the result (e.g., remove unnecessary decimals)
  String _formatResult(double result) {
    return result.toStringAsFixed(result.truncateToDouble() == result ? 0 : 6).replaceAll(RegExp(r'([.]*0)(?!.*\d)'), '');
  }

  // Clear operands and operator after a calculation
  void _clearOperands() {
    _operand1 = '';
    _operand2 = '';
    _operator = '';
  }

  // Clear all inputs
  void _clear() {
    _display = '0';
    _operand1 = '';
    _operand2 = '';
    _operator = '';
  }
}
