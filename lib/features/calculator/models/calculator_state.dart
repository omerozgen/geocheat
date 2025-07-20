class CalculatorState {
  final String display;
  final double? firstOperand;
  final String? operator;
  final bool shouldClear;

  CalculatorState({
    this.display = '0',
    this.firstOperand,
    this.operator,
    this.shouldClear = false,
  });

  CalculatorState copyWith({
    String? display,
    double? firstOperand,
    String? operator,
    bool? shouldClear,
  }) {
    return CalculatorState(
      display: display ?? this.display,
      firstOperand: firstOperand ?? this.firstOperand,
      operator: operator ?? this.operator,
      shouldClear: shouldClear ?? this.shouldClear,
    );
  }

  String get displayFull {
    if (firstOperand != null && operator != null) {
      String first = (firstOperand! % 1 == 0)
          ? firstOperand!.toInt().toString()
          : firstOperand!.toString();
      // Eğer yeni operatör seçildiyse ve ikinci operand girilmediyse sadece operatörü göster
      if (shouldClear) {
        return '$first $operator';
      }
      return '$first $operator $display';
    }
    return display;
  }
}
