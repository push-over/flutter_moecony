import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_moecony/common/redux/state.dart';
import 'package:flutter_moecony/common/style/style.dart';
import 'package:flutter_moecony/common/utils/screenutil_utils.dart';
import 'package:flutter_moecony/common/utils/common_utils.dart';

import 'package:flutter_moecony/widget/cached_network_image.dart';

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
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                        style: MTConstant.MIN_WHITE_TEXT,
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _buildAttributes(Color(0xFFFF6C6C), 0.7, 1350, 1963),
                  _buildAttributes(Color(0xFF6C97FF), 0.7, 1800, 2526),
                  _buildAttributes(Color(0xFFC26CFF), 0.6, 123432, 219231),
                  _buildAttributes(Color(0xFFFFF46C), 0.4, 420, 1166),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAttributes(Color color, double value, int min, int max) {
    return Column(
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(
            S.w(10),
          ),
          child: Stack(
            children: <Widget>[
              Container(
                width: S.w(260),
                height: S.h(20),
                child: LinearProgressIndicator(
                  value: value,
                  backgroundColor: Color(MTColors.LIGHT),
                  valueColor: AlwaysStoppedAnimation<Color>(
                    color,
                  ),
                ),
              ),
              Positioned(
                child: Container(
                  width: S.w(260),
                  height: S.h(20),
                  child: Center(
                    child: Text(
                      '$min/$max',
                      style: TextStyle(
                        fontSize: S.sp(12),
                        color: Color(MTColors.DEFAULT_TEXT),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: S.h(16),
        ),
      ],
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
