import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../viewmodels/calculator_viewmodel.dart';
import '../widgets/calculator_display.dart';
import '../widgets/calculator_keypad.dart';

class CalculatorScreen extends ConsumerWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(calculatorViewModelProvider);
    final viewModel = ref.read(calculatorViewModelProvider.notifier);
    return Scaffold(
      appBar: AppBar(title: const Text('Hesap Makinesi'), elevation: 0.5),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              CalculatorDisplay(value: state.displayFull),
              const SizedBox(height: 24),
              Expanded(
                child: CalculatorKeypad(onKey: (val) => viewModel.input(val)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
