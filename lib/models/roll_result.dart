class RollResult {
  final int value;
  final int dice;

  RollResult({required this.value, required this.dice});

  @override
  String toString() {
    return 'D$dice: $value';
  }
}
