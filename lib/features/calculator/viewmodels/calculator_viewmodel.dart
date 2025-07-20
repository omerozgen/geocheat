import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/calculator_state.dart';

class CalculatorViewModel extends StateNotifier<CalculatorState> {
  double? _lastOperand;
  String? _lastOperator;
  CalculatorViewModel() : super(CalculatorState());

  void input(String value) {
    if (RegExp(r'^[0-9]$').hasMatch(value)) {
      if (state.shouldClear || state.display == '0') {
        state = state.copyWith(display: value, shouldClear: false);
      } else {
        state = state.copyWith(display: state.display + value);
      }
    } else if (value == '.') {
      if (!state.display.contains('.')) {
        state = state.copyWith(display: state.display + '.');
      }
    } else if ('+-x÷'.contains(value)) {
      // Art arda operatör basılırsa sadece sonuncusu geçerli olsun
      if (state.operator != null) {
        state = state.copyWith(operator: value, shouldClear: true);
      } else {
        state = state.copyWith(
          firstOperand: double.tryParse(state.display),
          operator: value,
          shouldClear: true,
        );
      }
    } else if (value == '=') {
      double? first = state.firstOperand;
      double? second = double.tryParse(state.display);
      String? op = state.operator;
      if (first != null && op != null) {
        double result = _calculate(first, second ?? 0, op);
        // Son işlemi kaydet
        _lastOperand = second;
        _lastOperator = op;
        state = CalculatorState(
          display: _formatResult(result),
          firstOperand: null,
          operator: null,
          shouldClear: true,
        );
      } else if (_lastOperator != null && _lastOperand != null) {
        // Son işlemi tekrarla
        double current = double.tryParse(state.display) ?? 0;
        double result = _calculate(current, _lastOperand!, _lastOperator!);
        state = CalculatorState(
          display: _formatResult(result),
          firstOperand: null,
          operator: null,
          shouldClear: true,
        );
      }
    } else if (value == 'C') {
      state = CalculatorState();
      _lastOperand = null;
      _lastOperator = null;
    } else if (value == '+/-') {
      // Negatif/pozitif çevir
      if (state.display.startsWith('-')) {
        state = state.copyWith(display: state.display.substring(1));
      } else if (state.display != '0') {
        state = state.copyWith(display: '-${state.display}');
      }
    }
  }

  double _calculate(double a, double b, String op) {
    switch (op) {
      case '+':
        return a + b;
      case '-':
        return a - b;
      case 'x':
        return a * b;
      case '÷':
        return b == 0 ? 0 : a / b;
      default:
        return b;
    }
  }

  String _formatResult(double value) {
    if (value % 1 == 0) {
      return value.toInt().toString();
    } else {
      return value.toStringAsPrecision(8);
    }
  }
}

final calculatorViewModelProvider =
    StateNotifierProvider<CalculatorViewModel, CalculatorState>(
      (ref) => CalculatorViewModel(),
    );
