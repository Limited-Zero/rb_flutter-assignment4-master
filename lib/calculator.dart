// Import necessary packages
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// Define Calculator widget as a StatefulWidget
class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  CalculatorState createState() => CalculatorState();
}

// Define CalculatorState as the state of the Calculator widget
class CalculatorState extends State<Calculator> {
  // Create two TextEditingController objects for the two text fields
  final TextEditingController _number1Controller = TextEditingController();
  final TextEditingController _number2Controller = TextEditingController();
  double? _result;

  // Function to add the two numbers entered in the text fields
  void _addNumbers() {
    double number1 = double.tryParse(_number1Controller.text) ?? 0;
    double number2 = double.tryParse(_number2Controller.text) ?? 0;
    setState(() {
      _result = number1 + number2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Calc Tool (Adder)')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text fields for the numbers
            TextField(
              controller: _number1Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'First'),
            ),
            Container(
              width: 200,
              height: 100,
              margin: EdgeInsets.all(50),
              color: Colors.indigoAccent,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _number2Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Second'),
            ),
            const SizedBox(height: 16),
            // Button to initiate the calculation
            ElevatedButton(
              onPressed: _addNumbers,
              child: const Text('Calculate'),
            ),
            const SizedBox(height: 16),
            // Show the result if available
            if (_result != null)
              Text(
                '${_number1Controller.text} + ${_number2Controller.text} = $_result',
                style: const TextStyle(fontSize: 24),
              ),
            // Button to go back to home screen
            ElevatedButton(
              // Click HOME go to Home Page
              onPressed: () => context.go('/'),
              child: const Text('Home'),
            ),
          ],
        ),
      ),
    );
  }
}
