import 'package:flutter/material.dart';

class GamePage extends StatelessWidget {
  const GamePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: <Widget>[
            Text(
              '0xFF24292E',
              style: TextStyle(
                color: Color(0xFFFFCFE2),
              ),
            ),
            Text(
              '0xFF42464b',
              style: TextStyle(
                color: Color(0xFF42464b),
              ),
            ),
            Text(
              '0xFF121917',
              style: TextStyle(
                color: Color(0xFF121917),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
