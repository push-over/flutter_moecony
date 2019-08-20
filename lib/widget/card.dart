import 'package:flutter/material.dart';
import 'package:flutter_moecony/common/style/style.dart';

class MTCard extends StatelessWidget {
  final Widget child;
  final EdgeInsets margin;
  final Color color;
  final RoundedRectangleBorder shape;
  final double elevation;

  MTCard(
      {Key key,
      @required this.child,
      this.margin,
      this.color,
      this.shape,
      this.elevation = 5.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    EdgeInsets margin = this.margin;
    RoundedRectangleBorder shape = this.shape;
    Color color = this.color;
    margin ??=
        EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0, bottom: 10.0);
    shape ??= RoundedRectangleBorder(
//      borderRadius: BorderRadius.all(
//        Radius.circular(4.0),
//      ),
    );
    color ??= Color(MTColors.LIGHT);
    return Card(
      elevation: elevation,
      shape: shape,
      color: color,
      margin: margin,
      child: child,
    );
  }
}
