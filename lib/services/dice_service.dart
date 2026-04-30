import 'dart:math';

class DiceService {
  final _random = Random();

  int roll(int sides) {
    return _random.nextInt(sides) + 1;
  }
}
