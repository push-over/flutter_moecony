import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

import 'package:flutter_moecony/common/style/style.dart';
import 'package:flutter_moecony/common/utils/screenutil_utils.dart';

class BackpackTitleWidget extends StatelessWidget {
  final String title;
  final Store store;

  BackpackTitleWidget({Key key, @required this.title, @required this.store})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: S.h(10),
        horizontal: S.w(20),
      ),
      width: S.w(610),
      color: store.state.themeData.primaryColor,
      child: Text(
        title,
        style: MTConstant.NORMAL_WHITE_TEXT,
      ),
    );
  }
}
