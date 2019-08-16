import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_moecony/common/redux/state.dart';
import 'package:flutter_moecony/common/style/style.dart';
import 'package:flutter_moecony/common/utils/screenutil_utils.dart';
import 'package:flutter_moecony/common/utils/common_utils.dart';

import 'package:flutter_moecony/widget/cached_network_image.dart';
import 'package:flutter_moecony/widget/character_attributes.dart';

class MTDrawer extends StatefulWidget {
  @override
  _MTDrawerState createState() => _MTDrawerState();
}

class _MTDrawerState extends State<MTDrawer> {
  Map<String, dynamic> _menus;

  @override
  void initState() {
    super.initState();
    _menus = {
      '设置主题': MTIcons.THEME,
      '我的收藏': MTIcons.COLLECTION,
      '助手设置': MTIcons.SETTINGS,
      '吐槽程序员': MTIcons.MAKE_COMPLAINTS,
      '关于萌兔': MTIcons.ON,
      '残忍退出': MTIcons.LOGOUT,
    };
  }

  _showThemeDialog(BuildContext context, Store store) {
    List<String> list = [];
    List<Color> colorList = CommonUtils.getThemeListColor();
    for (var i = 0; i < colorList.length; i++) {
      i == 0 ? list.add('默认主题') : list.add('主题 $i');
    }

    CommonUtils.showCommitOptionDialog(context, list, (index) {
      CommonUtils.pushTheme(store, index);
    }, colorList: colorList);
  }

  @override
  Widget build(BuildContext context) {
    return StoreBuilder<MTState>(
      builder: (BuildContext context, Store store) {
        return Drawer(
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.only(),
            itemCount: _menus.length + 1,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return _buildHeader(store);
              }
              index -= 1;
              return _buildListTitle(
                _menus.keys.elementAt(index),
                _menus.values.elementAt(index),
                store,
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildHeader(Store store) {
    return DrawerHeader(
      decoration: BoxDecoration(
        color: store.state.themeData.primaryColor,
      ),
      child: Center(
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ClipOval(
                      child: MTCacheNetworkImageWidget(
                        url: MTIcons.DEFAULT_REMOTE_PIC,
                        width: S.w(100),
                        height: S.w(100),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          MTIcons.VIP,
                          color: Color(0xFFCD7F32),
                        ),
                        Text(
                          '用户名称',
                          overflow: TextOverflow.ellipsis,
                          style: MTConstant.MIN_WHITE_TEXT,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CharacterAttributes(
                      color: Color(0xFFFF6C6C),
                      value: 0.7,
                      min: 1350,
                      max: 1963,
                    ),
                    CharacterAttributes(
                      color: Color(0xFF6C97FF),
                      value: 0.7,
                      min: 1800,
                      max: 2526,
                    ),
                    CharacterAttributes(
                      color: Color(0xFFC26CFF),
                      value: 0.6,
                      min: 123432,
                      max: 219231,
                    ),
                    CharacterAttributes(
                      color: Color(0xFFFFF46C),
                      value: 0.4,
                      min: 420,
                      max: 1166,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildListTitle(String title, IconData leading, Store store) {
    return ListTile(
      leading: Icon(leading),
      trailing: Icon(MTIcons.RIGHT_ARROW),
      title: Text(
        title,
        style: MTConstant.SMALL_DEFAULT_TEXT,
      ),
      onTap: () {
        switch (title) {
          case '设置主题':
            _showThemeDialog(context, store);
            break;
          case '我的收藏':
            break;
          case '助手设置':
            break;
          case '吐槽程序员':
            break;
          case '关于萌兔':
            break;
          default:
            break;
        }
      },
    );
  }
}
