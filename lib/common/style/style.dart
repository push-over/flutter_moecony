import 'package:flutter/material.dart';
import 'package:flutter_moecony/common/config/config.dart';

abstract class MTColors {
  static const int PRIMARY_VALUE = 0xFFFCFE2;
}

abstract class MTIcons {

  /// BottomNavigationBar
  static const IconData GAME =
      IconData(0xe6fb, fontFamily: MTConfig.FONT_FAMILY);
  static const IconData SOCIAL =
      IconData(0xe66a, fontFamily: MTConfig.FONT_FAMILY);
  static const IconData BACKPACK =
      IconData(0xe631, fontFamily: MTConfig.FONT_FAMILY);
  static const IconData RABBIT =
      IconData(0xe615, fontFamily: MTConfig.FONT_FAMILY);
}

abstract class MTConstant {}
