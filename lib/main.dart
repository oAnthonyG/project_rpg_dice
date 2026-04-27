import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigoAccent),
      ),
      home: const MyHomePage(title: 'Dados de RPG'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _resultado = '0';
  final List<String> _historico = [];

  void rollD(int dado) {
    setState(() {
      _resultado = (Random().nextInt(dado) + 1).toString();
      _historico.insert(0, 'D$dado: $_resultado');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () => rollD(20),
                        child: Text('D20'),
                        
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () => rollD(6),
                        child: Text('D6'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () => rollD(4),
                        child: Text('D4'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 20),

          Column(
            children: [
              Text('Resultado'),
              Text(
                _resultado,
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
            ],
          ),

          SizedBox(height: 20),

          Expanded(
            
            child: ListView.builder(
              padding: EdgeInsetsGeometry.directional(start: 8),
              itemCount: _historico.length,
              itemBuilder: (context, index) {
                return ListTile(title: Text(_historico[index], style: TextStyle(letterSpacing: 1.5,),));
              },
            ),
          ),
        ],
      ),
    );
  }
}
