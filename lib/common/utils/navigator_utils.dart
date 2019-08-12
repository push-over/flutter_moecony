import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class NavigatorUtils {
  static pushNamed(BuildContext context, String routeName) {
    Navigator.pushNamed(context, routeName);
  }

  static NavigatorRouter(BuildContext context, Widget widget) {
    return Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => pageContainer(widget),
      ),
    );
  }

  static Widget pageContainer(widget) {
    return MediaQuery(
      /// 不受系统字体缩放影响
      data: MediaQueryData.fromWindow(WidgetsBinding.instance.window)
          .copyWith(textScaleFactor: 1),
      child: widget,
    );
  }
}
