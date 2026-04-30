import 'package:flutter/material.dart';
import 'package:project_rpg_dice/models/roll_result.dart';

class HistoryList extends StatefulWidget {
  final List<RollResult> history;
  const HistoryList({super.key, required this.history});

  @override
  State<HistoryList> createState() => _HistoryListState();
}

class _HistoryListState extends State<HistoryList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(

      child: ListView.builder(
        itemCount: widget.history.length,
        itemBuilder: (context, index) {
          return ListTile(title: Text(widget.history[index].toString(), style: TextStyle(fontSize: 14),),);
        },
      ),
    );
  }
}
