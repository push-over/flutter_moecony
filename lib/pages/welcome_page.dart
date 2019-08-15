import 'dart:async';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_moecony/common/redux/state.dart';
import 'package:flutter_moecony/common/utils/navigator_utils.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  bool hadInit = false;
  bool isLogin = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (hadInit) {
      return;
    }
    hadInit = true;

    ///防止多次进入
    Store<MTState> store = StoreProvider.of(context);
    new Future.delayed(const Duration(seconds: 2, milliseconds: 500), () {
      if (isLogin) {
        NavigatorUtils.goHome(context);
      } else {
        NavigatorUtils.goLogin(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return StoreBuilder<MTState>(
      builder: (BuildContext context, Store store) {
        double size = 200;
        return Scaffold(
          body: Container(
            color: store.state.themeData.primaryColor,
            child: Stack(
              children: <Widget>[
                Center(
                  child: Image(
                    image: AssetImage('static/images/620-620.png'),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: size,
                    height: size,
                    child: FlareActor(
                      'static/file/Filip.flr',
                      alignment: Alignment.bottomLeft,
                      fit: BoxFit.contain,
                      animation: 'idle',
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
