import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class MTSpinKit extends StatefulWidget {
  @override
  _MTSpinKitState createState() => _MTSpinKitState();
}

class _MTSpinKitState extends State<MTSpinKit> {
  @override
  Widget build(BuildContext context) {
    return SpinKitFadingCircle(
      itemBuilder: (_, int index) {
        return DecoratedBox(
          decoration: BoxDecoration(
            color: index.isEven ? Colors.red : Colors.green,
          ),
        );
      },
    );
  }
}
