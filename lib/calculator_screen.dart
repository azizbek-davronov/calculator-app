import 'dart:async';
import 'package:calculator_app/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String number1 = ''; // . 0-9
  String operand = ''; // / * - +
  String number2 = ''; // . 0-9

  Map<String, bool> buttonStates = {};
  void handleTap(String btnValue) {
    setState(() {
      buttonStates[btnValue] = true;
    });

    Timer(const Duration(milliseconds: 100), () {
      setState(() {
        buttonStates[btnValue] = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: NavBar(),
      appBar: AppBar(),
      body: SafeArea(
        bottom: false,
        child: Consumer<ThemeProvider>(
          builder: (context, themeProvider, child) {
            return Column(
              children: [
                //output
                Expanded(
                  child: SingleChildScrollView(
                    reverse: true,
                    child: Container(
                      alignment: Alignment.bottomRight,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        '$number1$operand$number2'.isEmpty
                            ? '0'
                            : '$number1$operand$number2',
                        style: const TextStyle(
                          fontSize: 72,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                //buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildButton(Colors.grey, "AC", Colors.black),
                    buildButton(Colors.orange, "( )", Colors.white),
                    buildButton(Colors.orange, "%", Colors.white),
                    buildButton(Colors.orange, "/", Colors.white),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildButton(Colors.grey[800]!, "7", Colors.white),
                    buildButton(Colors.grey[800]!, "8", Colors.white),
                    buildButton(Colors.grey[800]!, "9", Colors.white),
                    buildButton(Colors.orange, "*", Colors.white),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildButton(Colors.grey[800]!, "4", Colors.white),
                    buildButton(Colors.grey[800]!, "5", Colors.white),
                    buildButton(Colors.grey[800]!, "6", Colors.white),
                    buildButton(Colors.orange, "-", Colors.white),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildButton(Colors.grey[800]!, "1", Colors.white),
                    buildButton(Colors.grey[800]!, "2", Colors.white),
                    buildButton(Colors.grey[800]!, "3", Colors.white),
                    buildButton(Colors.orange, "+", Colors.white),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildButton(Colors.grey[800]!, "0", Colors.white),
                    buildButton(Colors.grey[800]!, ".", Colors.white),
                    buildButton(Colors.grey[800]!, "<", Colors.white),
                    buildButton(Colors.grey, "=", Colors.black),
                  ],
                ),
                const SizedBox(height: 12),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget buildButton(Color bgColor, String btnValue, Color btnValueColor) {
    bool isChange = buttonStates[btnValue] ?? false;

    return GestureDetector(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        height: 84,
        width: 84,
        decoration: BoxDecoration(
          borderRadius:
              isChange ? BorderRadius.circular(21) : BorderRadius.circular(42),
          color: isChange ? Colors.white38 : bgColor,
        ),
        child: Center(
          child: Text(
            btnValue,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 36,
                color: btnValueColor),
          ),
        ),
      ),
      onTap: () {
        btnTap(btnValue);
        handleTap(btnValue);
      },
    );
  }

  void btnTap(String btnValue) {
    if (btnValue == '<') {
      delete();
      return;
    }

    if (btnValue == 'AC') {
      clearAll();
      return;
    }
    if (btnValue == '%') {
      convertToPercentage();
      return;
    }

    if (btnValue == '=') {
      calculate();
      return;
    }

    if (btnValue != '.' && int.tryParse(btnValue) == null) {
      if (operand.isNotEmpty && number2.isNotEmpty) {
        calculate();
      }
      operand = btnValue;
    } else if (number1.isEmpty || operand.isEmpty) {
      // number1 = '1.2'
      if (btnValue == '.' && number1.contains('.')) return;
      if (btnValue == '.' && (number1.isEmpty || number1 == '0')) {
        // number1 = '' | '0'
        btnValue = '0.';
      }

      number1 += btnValue;
    } else if (number2.isEmpty || operand.isNotEmpty) {
      // number2 = '1.2'
      if (btnValue == '.' && number2.contains('.')) return;
      if (btnValue == '.' && (number2.isEmpty || number2 == '0')) {
        // number2 = '' | '0'
        btnValue = '0.';
      }
      number2 += btnValue;
    }
    setState(() {});
  }

  void delete() {
    if (number2.isNotEmpty) {
      // number2 = 12345 => number2 = 1234
      number2 = number2.substring(0, number2.length - 1);
    } else if (operand.isNotEmpty) {
      operand = '';
    } else if (number1.isNotEmpty) {
      // number1 = 12345 => number1 = 1234
      number1 = number1.substring(0, number1.length - 1);
    }
    setState(() {});
  }

  void clearAll() {
    setState(() {
      number1 = '';
      operand = '';
      number2 = '';
    });
  }

  void convertToPercentage() {
    if (number1.isNotEmpty && operand.isNotEmpty && number2.isNotEmpty) {
      calculate();
    }
    if (operand.isNotEmpty) {
      return;
    }
    final number = double.parse(number1);
    setState(() {
      number1 = '${number / 100}';
      operand = '';
      number2 = '';
    });
  }

  void calculate() {
    if (number1.isEmpty) return;
    if (operand.isEmpty) return;
    if (number2.isEmpty) return;

    final double num1 = double.parse(number1);
    final double num2 = double.parse(number2);
    var result = 0.0;
    switch (operand) {
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
        result = num1 / num2;
        break;
      default:
    }
    setState(() {
      number1 = '$result';
      if (number1.endsWith('.0')) {
        number1 = number1.substring(0, number1.length - 2);
      }
      operand = '';
      number2 = '';
    });
  }
}
