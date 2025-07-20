import 'package:flutter/material.dart';

class CalculatorKeypad extends StatelessWidget {
  final void Function(String) onKey;
  const CalculatorKeypad({super.key, required this.onKey});

  @override
  Widget build(BuildContext context) {
    final buttons = [
      ['7', '8', '9', '÷'],
      ['4', '5', '6', 'x'],
      ['1', '2', '3', '-'],
      ['0', '.', '+/-', '+'],
      ['C', '='],
    ];
    return Column(
      children: buttons.map((row) {
        return Expanded(
          child: Row(
            children: row.map((label) {
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: '÷x-+'.contains(label)
                          ? Colors.blueAccent
                          : label == '='
                          ? Colors.green
                          : label == 'C'
                          ? Colors.red
                          : Colors.white,
                      foregroundColor:
                          '÷x-+'.contains(label) || label == '=' || label == 'C'
                          ? Colors.white
                          : Colors.black87,
                      textStyle: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 2,
                      padding: const EdgeInsets.symmetric(vertical: 18),
                    ),
                    onPressed: () => onKey(label),
                    child: Text(label),
                  ),
                ),
              );
            }).toList(),
          ),
        );
      }).toList(),
    );
  }
}
