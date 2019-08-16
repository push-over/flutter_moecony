import 'package:flutter/material.dart';

import 'package:flutter_moecony/common/style/style.dart';
import 'package:flutter_moecony/common/utils/screenutil_utils.dart';

class CharacterAttributes extends StatelessWidget {
  final Color color;
  final double value;
  final int min;
  final int max;
  final double height;

  CharacterAttributes(
      {Key key,
      @required this.color,
      @required this.value,
      @required this.min,
      @required this.max,
      this.height = 20})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(
            S.w(10),
          ),
          child: Stack(
            children: <Widget>[
              Container(
                height: S.h(height),
                child: LinearProgressIndicator(
                  value: value,
                  backgroundColor: Colors.black12,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    color,
                  ),
                ),
              ),
              Positioned(
                child: Container(
                  height: S.h(height),
                  child: Center(
                    child: Text(
                      '$min/$max',
                      style: TextStyle(
                        fontSize: S.sp(12),
                        color: Color(MTColors.DEFAULT_TEXT),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: S.h(16),
        ),
      ],
    );
  }
}
