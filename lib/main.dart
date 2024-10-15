//
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'calculator_model.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (_) => CalculatorModel(),
//       child: MaterialApp(
//         title: 'Calculator App',
//         debugShowCheckedModeBanner: false,
//         theme: ThemeData(
//           primarySwatch: Colors.blue,
//         ),
//         home: CalculatorScreen(),
//       ),
//     );
//   }
// }
//
// class CalculatorScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final calculator = Provider.of<CalculatorModel>(context);
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Calculator'),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           Expanded(
//             child: Container(
//               alignment: Alignment.bottomRight,
//               padding: EdgeInsets.all(24),
//               child: Text(
//                 calculator.display,
//                 style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
//               ),
//             ),
//           ),
//           buildButtonRow(['7', '8', '9', '/']),
//           buildButtonRow(['4', '5', '6', '*']),
//           buildButtonRow(['1', '2', '3', '-']),
//           buildButtonRow(['0', 'C', '=', '+']),
//         ],
//       ),
//     );
//   }
//
//   Widget buildButtonRow(List<String> buttons) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: buttons.map((String value) {
//         return CalculatorButton(value: value);
//       }).toList(),
//     );
//   }
// }
//
// class CalculatorButton extends StatelessWidget {
//   final String value;
//
//   CalculatorButton({required this.value});
//
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: ElevatedButton(
//           style: ElevatedButton.styleFrom(
//             padding: EdgeInsets.all(24), // Adjust padding as needed
//             backgroundColor: Colors.grey[200],
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(8), // Slight rounding for square look
//             ),
//             fixedSize: Size(80, 80), // Set a fixed size to ensure square shape
//           ),
//           onPressed: () {
//             Provider.of<CalculatorModel>(context, listen: false).input(value);
//           },
//           child: Text(
//             value,
//             style: TextStyle(fontSize: 24, color: Colors.black),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'calculator_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CalculatorModel(),
      child: MaterialApp(
        title: 'Calculator App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: CalculatorScreen(),
      ),
    );
  }
}

class CalculatorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final calculator = Provider.of<CalculatorModel>(context); // Access the model

    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.all(24),
              child: Text(
                calculator.display,  // Display from model
                style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          buildButtonRow(['7', '8', '9', '/']),
          buildButtonRow(['4', '5', '6', '*']),
          buildButtonRow(['1', '2', '3', '-']),
          buildButtonRow(['0', 'C', '=', '+']),
        ],
      ),
    );
  }

  // Build a row of buttons for calculator
  Widget buildButtonRow(List<String> buttons) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: buttons.map((String value) {
        return CalculatorButton(value: value);
      }).toList(),
    );
  }
}

class CalculatorButton extends StatelessWidget {
  final String value;

  CalculatorButton({required this.value});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(24), // Adjust padding as needed
            backgroundColor: Colors.grey[200],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            fixedSize: Size(80, 80), // Ensure square shape
          ),
          onPressed: () {
            Provider.of<CalculatorModel>(context, listen: false).input(value); // Pass input to model
          },
          child: Text(
            value,
            style: TextStyle(fontSize: 24, color: Colors.black),
          ),
        ),
      ),
    );
  }
}
