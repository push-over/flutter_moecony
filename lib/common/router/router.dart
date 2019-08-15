import 'package:flutter/material.dart';
import 'package:flutter_moecony/pages/bottom_navigarion_bar.dart';
import 'package:flutter_moecony/pages/login_page.dart';
import 'package:flutter_moecony/pages/welcome_page.dart';

class PageConstance {
  static String WELCOME_PAGE = '/';
  static String HOME_PAGE = '/home';
  static String LOGIN_PAGE = '/login';

  static Map<String, WidgetBuilder> getRoutes() {
    var route = {
      WELCOME_PAGE: (BuildContext context) {
        return WelcomePage();
      },
      HOME_PAGE: (BuildContext context) {
        return MTBottomNavigationBar();
      },
      LOGIN_PAGE: (BuildContext context) {
        return LoginPage();
      }
    };

    return route;
  }
}
