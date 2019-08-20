import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

import 'package:flutter_moecony/common/style/style.dart';
import 'package:flutter_moecony/common/utils/screenutil_utils.dart';

class BackpackPageWidget extends StatelessWidget {
  final int currentIndex;
  final Store store;

  BackpackPageWidget(
      {Key key, @required this.currentIndex, @required this.store})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: S.w(610),
      alignment: Alignment.centerLeft,
      child: Wrap(
        spacing: 1.0, // gap between adjacent chips
        runSpacing: 1.0, // gap between lines
        children: List<Widget>.generate(
          6,
          (i) => Container(
            alignment: Alignment.center,
            width: S.w(100),
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: store.state.themeData.primaryColor,
              ),
              color: currentIndex == i ? Colors.brown : Colors.brown[300],
            ),
            child: Text(
              '背包',
              style: MTConstant.SMALL_WHITE_TEXT,
            ),
          ),
        ),
      ),
    );
  }
}
