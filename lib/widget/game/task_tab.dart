import 'package:flutter/material.dart';

class TaskTab extends StatefulWidget {
  @override
  _TaskTabState createState() => _TaskTabState();
}

class _TaskTabState extends State<TaskTab> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return ExpansionTile(
          title: Text('天王护卫兑换'),
          initiallyExpanded: false,
          children: <Widget>[
            ListTile(
              title: Text('挑战江云(可交付)'),
            ),
            ListTile(
              title: Text('任务描述：击败江云，证明自己的实力'),
            ),
            ListTile(
              title: Text('所需物品：江云(1/1)'),
            ),
            ListTile(
              title: Text('奖励：八卦'),
            ),
          ],
        );
      },
    );
  }
}
