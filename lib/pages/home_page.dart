import 'package:flutter/material.dart';
import 'package:project_rpg_dice/widgets/history_list.dart';
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
        backgroundColor: Color.fromARGB(255, 43, 36, 36),
        title: Center(
          child: Text(
            widget.title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      backgroundColor: Color.fromARGB(255, 43, 36, 36),
      body: Column(
        children: [
          SizedBox(height: 90),
          Column(
            children: [
              AnimatedSwitcher(
                duration: Duration(milliseconds: 400),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return RotationTransition(turns: animation, child: child);
                },
                child: Text(
                  '$_result',
                  key: ValueKey(_result),
                  style: TextStyle(fontSize: 80, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),

          SizedBox(height: 90),
          Wrap(
            spacing: 10,
            runSpacing: 16,
            alignment: WrapAlignment.center,
            children: _diceValues.map((dice) {
              return DiceButton(dice: dice, onPressed: () => _rollD(dice));
            }).toList(),
          ),
          SizedBox(height: 20),
          Divider(thickness: 1, indent: 40, endIndent: 30),
          HistoryList(history: _history),
        ],
      ),
    );
  }
}
