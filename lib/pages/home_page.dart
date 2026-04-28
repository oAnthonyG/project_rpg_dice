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

  void rollD(int dado) {
    setState(() {
      _result = (Random().nextInt(dado) + 1).toString();
      _history.insert(0, 'D$dado: $_result');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          widget.title,
          style: TextStyle(letterSpacing: 1.5, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [rollDices()],
            ),
          ),
          SizedBox(height: 20),
          Column(
            children: [
              Text('Result'),
              Text(
                _result,
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 20),
          history(),
        ],
      ),
    );
  }

  Expanded history() {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsetsGeometry.directional(start: 8),
        itemCount: _history.length < 20 ? _history.length : 20,
        
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              _history[index],
              style: TextStyle(letterSpacing: 1.5),
            ),
          );
        },
      ),
    );
  }

  Column rollDices() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(onPressed: () => rollD(20), child: Text('D20')),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(onPressed: () => rollD(6), child: Text('D6')),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(onPressed: () => rollD(4), child: Text('D4')),
        ),
      ],
    );
  }
}
