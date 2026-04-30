import 'package:flutter/material.dart';

class DiceButton extends StatelessWidget {
  final int dice;
  final VoidCallback onPressed;

  const DiceButton({super.key, required this.dice, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),

        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      ),
      child: Text('D$dice'),
    );
  }
}
