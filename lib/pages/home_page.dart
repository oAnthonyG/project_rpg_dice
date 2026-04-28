import 'dart:math';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _result = '0';
  final List<String> _history = [];
  final List<int> _diceValues = [4, 6, 8, 10, 12, 20];

  void _rollD(int dice) {
    setState(() {
      _result = (Random().nextInt(dice) + 1).toString();
      _history.insert(0, 'D$dice: $_result');

      if (_history.length > 20) {
        _history.removeLast();
      }
    });
  }

  Widget _boxDice(int dice) {
    return ElevatedButton(
      onPressed: () => _rollD(dice),
      style: ElevatedButton.styleFrom(
        textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        minimumSize: const Size(100, 60),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      ),
      child: Text('D$dice', style: const TextStyle(color: Colors.black87)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          widget.title,
          style: const TextStyle(
            letterSpacing: 1.5,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          Wrap(
            spacing: 16.0,
            runSpacing: 16.0,
            alignment: WrapAlignment.center,
            children: _diceValues.map((value) => _boxDice(value)).toList(),
          ),
          const SizedBox(height: 30),
          Column(
            children: [
              const Text('Result'),
              Text(
                _result,
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          _buildHistory(),
        ],
      ),
    );
  }

  Expanded _buildHistory() {
    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        itemCount: _history.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              _history[index],
              style: const TextStyle(letterSpacing: 1.5),
            ),
          );
        },
      ),
    );
  }
}
