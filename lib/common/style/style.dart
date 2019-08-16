import 'package:flutter/material.dart';
import 'package:flutter_moecony/common/config/config.dart';
import 'package:flutter_moecony/widget/spinkit.dart';

abstract class MTColors {
  static const int PRIMARY_VALUE = 0xFFFFCFE2;
  static const int PRIMARY_LIGHT_VALUE = 0xFF42464B;
  static const int PRIMARY_DARK_VALUE = 0xFF121917;

  static const MaterialColor PRIMARY_SWATCH = MaterialColor(
    PRIMARY_VALUE,
    const <int, Color>{
      50: const Color(PRIMARY_LIGHT_VALUE),
      100: const Color(PRIMARY_LIGHT_VALUE),
      200: const Color(PRIMARY_LIGHT_VALUE),
      300: const Color(PRIMARY_LIGHT_VALUE),
      400: const Color(PRIMARY_LIGHT_VALUE),
      500: const Color(PRIMARY_VALUE),
      600: const Color(PRIMARY_DARK_VALUE),
      700: const Color(PRIMARY_DARK_VALUE),
      800: const Color(PRIMARY_DARK_VALUE),
      900: const Color(PRIMARY_DARK_VALUE),
    },
  );

  static const int PRIMARY_VALUE_BLACK = 0xFF24292E;

  static const MaterialColor PRIMARY_SWATCH_BLACK = const MaterialColor(
    PRIMARY_VALUE_BLACK,
    const <int, Color>{
      50: const Color(PRIMARY_LIGHT_VALUE),
      100: const Color(PRIMARY_LIGHT_VALUE),
      200: const Color(PRIMARY_LIGHT_VALUE),
      300: const Color(PRIMARY_LIGHT_VALUE),
      400: const Color(PRIMARY_LIGHT_VALUE),
      500: const Color(PRIMARY_VALUE_BLACK),
      600: const Color(PRIMARY_DARK_VALUE),
      700: const Color(PRIMARY_DARK_VALUE),
      800: const Color(PRIMARY_DARK_VALUE),
      900: const Color(PRIMARY_DARK_VALUE),
    },
  );

  static const int LIGHT = 0xFFFFFFFF;

  static const int DEFAULT_TEXT = 0xFF333333;

  /// #565656 登陆区名
  /// #787878 记住密码
  /// #000000 选择线路
  /// #444444 登陆时间
  /// #F11010 登记颜色
}

abstract class MTIcons {
  static const String DEFAULT_REMOTE_PIC =
      "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=4259300811,497831842&fm=26&gp=0.jpg";

  /// BottomNavigationBar
  static const IconData GAME =
      IconData(0xe64f, fontFamily: MTConfig.FONT_FAMILY);
  static const IconData GAME_FILL =
      IconData(0xe7d8, fontFamily: MTConfig.FONT_FAMILY);
  static const IconData SOCIAL =
      IconData(0xe7d5, fontFamily: MTConfig.FONT_FAMILY);
  static const IconData SOCIAL_FILL =
      IconData(0xe7d9, fontFamily: MTConfig.FONT_FAMILY);
  static const IconData BACKPACK =
      IconData(0xe61d, fontFamily: MTConfig.FONT_FAMILY);
  static const IconData RABBIT =
      IconData(0xe615, fontFamily: MTConfig.FONT_FAMILY);

  /// Drawer
  static const IconData COLLECTION =
      IconData(0xe86e, fontFamily: MTConfig.FONT_FAMILY);
  static const IconData SETTINGS =
      IconData(0xe893, fontFamily: MTConfig.FONT_FAMILY);
  static const IconData THEME =
      IconData(0xe760, fontFamily: MTConfig.FONT_FAMILY);
  static const IconData MAKE_COMPLAINTS =
      IconData(0xe69c, fontFamily: MTConfig.FONT_FAMILY);
  static const IconData ON = IconData(0xe6cd, fontFamily: MTConfig.FONT_FAMILY);
  static const IconData LOGOUT =
      IconData(0xe894, fontFamily: MTConfig.FONT_FAMILY);
  static const IconData RIGHT_ARROW =
      IconData(0xe88e, fontFamily: MTConfig.FONT_FAMILY);
  static const IconData VIP =
      IconData(0xe61a, fontFamily: MTConfig.FONT_FAMILY);
}

abstract class MTConstant {
  static const double LAGER_SIZE = 30.0;
  static const double BIG_SIZE = 23.0;
  static const double NORMAL_SIZE = 18.0;
  static const double MIDDLE_SIZE = 16.0;
  static const double SMALL_SIZE = 14.0;
  static const double MIN_SIZE = 12.0;

  static Widget APPBAR(Widget widget) {
    return AppBar(
      title: widget,
      iconTheme: IconThemeData(
        color: Color(MTColors.LIGHT),
      ),
      centerTitle: true,
    );
  }

  static Widget LOADDING(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minWidth: MediaQuery.of(context).size.width,
        minHeight: MediaQuery.of(context).size.height,
      ),
      color: Colors.black12,
      child: Center(
        child: Opacity(
          opacity: 0.9,
          child: MTSpinKit(),
        ),
      ),
    );
  }

  /// DEFAULT_TEXT
  static const MIN_DEFAULT_TEXT = TextStyle(
    color: Color(MTColors.DEFAULT_TEXT),
    fontSize: MIN_SIZE,
  );

  static const SMALL_DEFAULT_TEXT = TextStyle(
    color: Color(MTColors.DEFAULT_TEXT),
    fontSize: SMALL_SIZE,
  );

  static const MIDDLE_DEFAULT_TEXT = TextStyle(
    color: Color(MTColors.DEFAULT_TEXT),
    fontSize: MIDDLE_SIZE,
  );

  static const NORMAL_DEFAULT_TEXT = TextStyle(
    color: Color(MTColors.DEFAULT_TEXT),
    fontSize: NORMAL_SIZE,
  );

  static const BIG_DEFAULT_TEXT = TextStyle(
    color: Color(MTColors.DEFAULT_TEXT),
    fontSize: BIG_SIZE,
  );

  static const LAGER_DEFAULT_TEXT = TextStyle(
    color: Color(MTColors.DEFAULT_TEXT),
    fontSize: BIG_SIZE,
  );

  /// WHITE_TEXT
  static const MIN_WHITE_TEXT = TextStyle(
    color: Color(MTColors.LIGHT),
    fontSize: MIN_SIZE,
  );

  static const SMALL_WHITE_TEXT = TextStyle(
    color: Color(MTColors.LIGHT),
    fontSize: SMALL_SIZE,
  );

  static const MIDDLE_WHITE_TEXT = TextStyle(
    color: Color(MTColors.LIGHT),
    fontSize: MIDDLE_SIZE,
  );

  static const NORMAL_WHITE_TEXT = TextStyle(
    color: Color(MTColors.LIGHT),
    fontSize: NORMAL_SIZE,
  );

  static const BIG_WHITE_TEXT = TextStyle(
    color: Color(MTColors.LIGHT),
    fontSize: BIG_SIZE,
  );

  static const LAGER_WHITE_TEXT = TextStyle(
    color: Color(MTColors.LIGHT),
    fontSize: BIG_SIZE,
  );
}
