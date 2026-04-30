import 'package:flutter/material.dart';
import '../services/dice_service.dart';
import '../models/roll_result.dart';
import '../widgets/dice_button.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final DiceService _diceService = DiceService();

  int _result = 0;
  final List<RollResult> _history = [];
  final List<int> _diceValues = [4, 6, 8, 10, 12, 20];

  void _rollD(int dice) {
    final value = _diceService.roll(dice);

    setState(() {
      _result = value;
      _history.insert(0, RollResult(value: value, dice: dice));

      if (_history.length > 20) {
        _history.removeLast();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Center(child: Text(widget.title, style: TextStyle(fontWeight: FontWeight.bold),))),
      body: Column(
        children: [
          const SizedBox(height: 16),

          Wrap(
            spacing: 16,
            runSpacing: 16,
            alignment: WrapAlignment.center,
            children: _diceValues.map((dice) {
              return DiceButton(
                dice: dice,
                onPressed: () => _rollD(dice),
              );
            }).toList(),
          ),

          const SizedBox(height: 30),

          Column(
            children: [
              const Text('Result'),
              Text(
                '$_result',
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          Expanded(
            child: ListView.builder(
              itemCount: _history.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_history[index].toString()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}