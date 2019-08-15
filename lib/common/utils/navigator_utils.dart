import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_moecony/pages/bottom_navigarion_bar.dart';
import 'package:flutter_moecony/pages/login_page.dart';
import 'package:flutter_moecony/pages/welcome_page.dart';
import 'package:flutter_moecony/common/router/router.dart';

abstract class NavigatorUtils {
  /// 跳转新页面并且替换，比如登录页跳转主页
  static pushReplacementNamed(BuildContext context, String routeName) {
    Navigator.pushReplacementNamed(context, routeName);
  }

  ///切换无参数页面
  static pushNamed(BuildContext context, String routeName) {
    Navigator.pushNamed(context, routeName);
  }

  ///跳转到新的路由，并且关闭给定路由的之前的所有页面
  //Navigator.pushNamedAndRemoveUntil(context, '/calendar', ModalRoute.withName('/'));

  ///带参数的路由跳转，并且监听返回
  //  Navigator.push(context, new MaterialPageRoute(builder: (context) => new NotifyPage())).then((res) {
  //  ///获取返回处理
  //  });
  //

  ///主页
  static goHome(BuildContext context) {
    return Navigator.pushReplacementNamed(context, PageConstance.HOME_PAGE);
  }

  ///登录页
  static goLogin(BuildContext context) {
    return Navigator.pushReplacementNamed(context, PageConstance.LOGIN_PAGE);
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

  static Future<T> showMTDialog<T>({
    @required BuildContext context,
    bool barrierDismissible = true,
    WidgetBuilder builder,
  }) {
    return showDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) {
        return MediaQuery(
          data: MediaQueryData.fromWindow(WidgetsBinding.instance.window)
              .copyWith(textScaleFactor: 1),
          child: new SafeArea(
            child: builder(context),
          ),
        );
      },
    );
  }
}
