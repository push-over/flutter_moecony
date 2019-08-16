import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_moecony/common/utils/navigator_utils.dart';
import 'package:flutter_moecony/common/style/style.dart';
import 'package:flutter_moecony/widget/flex_button.dart';
import 'package:flutter_moecony/common/redux/theme_redux.dart';

abstract class CommonUtils {
  static List<Color> getThemeListColor() {
    return [
      MTColors.PRIMARY_SWATCH,
      MTColors.PRIMARY_SWATCH_BLACK,
      Colors.red,
      Colors.brown,
      Colors.blue,
      Colors.teal,
      Colors.amber,
      Colors.blueGrey,
      Colors.deepOrange,
    ];
  }

  static getThemeData(Color color) {
    return ThemeData(primarySwatch: color, platform: TargetPlatform.android);
  }

  static pushTheme(Store store, int index) {
    ThemeData themeData;
    List<Color> colors = getThemeListColor();
    themeData = getThemeData(colors[index]);
    store.dispatch(RefreshThemeDataAction(themeData: themeData));
  }


//  void showAboutDialog({
//    @required BuildContext context,
//    String applicationName,
//    String applicationVersion,
//    Widget applicationIcon,
//    String applicationLegalese,
//    List<Widget> children,
//  }) {
//    assert(context != null);
//    showDialog<void>(
//      context: context,
//      builder: (BuildContext context) {
//        return AboutDialog(
//          applicationName: applicationName,
//          applicationVersion: applicationVersion,
//          applicationIcon: applicationIcon,
//          applicationLegalese: applicationLegalese,
//          children: children,
//        );
//      },
//    );
//  }


  static Future<Null> showCommitOptionDialog(
    BuildContext context,
    List<String> commitMaps,
    ValueChanged<int> onTap, {width = 250.0, height = 400.0, List<Color> colorList,}) {
    return NavigatorUtils.showMTDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: Container(
            width: width,
            height: height,
            padding: EdgeInsets.all(4.0),
            margin: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Color(MTColors.LIGHT),
              borderRadius: BorderRadius.all(
                Radius.circular(4.0),
              ),
            ),
            child: ListView.builder(
              itemCount: commitMaps.length,
              itemBuilder: (context, index) {
                return MTFlexButton(
                  maxLines: 1,
                  mainAxisAlignment: MainAxisAlignment.start,
                  fontSize: 14.0,
                  color: colorList != null
                      ? colorList[index]
                      : Theme.of(context).primaryColor,
                  text: commitMaps[index],
                  textColor: Color(MTColors.LIGHT),
                  onPress: () {
                    Navigator.pop(context);
                    onTap(index);
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }
}
