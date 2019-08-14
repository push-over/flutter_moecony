import 'package:flutter/material.dart';
import 'package:flutter_moecony/common/utils/navigator_utils.dart';
import 'package:flutter_moecony/common/style/style.dart';
import 'package:flutter_moecony/widget/flex_button.dart';

abstract class CommonUtils {
  static Future<Null> showCommitOptionDialog(
    BuildContext context,
    List<String> commitMaps,
    ValueChanged<int> onTap, {
    width = 250.0,
    height = 400.0,
    List<Color> colorList,
  }) {
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
