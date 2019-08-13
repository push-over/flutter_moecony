import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_moecony/common/redux/state.dart';
import 'package:flutter_moecony/common/style/style.dart';
import 'package:flutter_moecony/common/utils/screenutil_utils.dart';

class MTDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreBuilder<MTState>(
      builder: (BuildContext context, Store store) {
        return Drawer(
          child: SingleChildScrollView(
            child: Stack(
              children: <Widget>[
                Container(
                  color: Color(MTColors.LIGHT),
                  constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height,
                  ),
                  child: Column(
                    children: <Widget>[
                      _buildHeader(store),
                      _buildListTitle('我的收藏'),
                      _buildListTitle('助手设置'),
                      _buildListTitle('吐槽程序猿'),
                      AboutListTile(
                        child: Text(
                          '关于萌兔',
                          style: MTConstant.SMALL_DEFAULT_TEXT,
                        ),
                        applicationName: '萌兔',
                        applicationVersion: "1.0",
                        applicationIcon: Image.network(
                          MTIcons.DEFAULT_REMOTE_PIC,
                          width: S.w(128),
                          height: S.h(128),
                        ),
                        applicationLegalese: '',
                        aboutBoxChildren: <Widget>[
                          Text('测试版本'),
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                    bottom: S.h(40),
                    right: S.w(56),
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.cancel),
                        SizedBox(
                          width: S.w(10),
                        ),
                        Text(
                          '退出',
                          style: MTConstant.SMALL_DEFAULT_TEXT,
                        ),
                      ],
                    )),
              ],
            ),
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
                    child: Image.network(
                      MTIcons.DEFAULT_REMOTE_PIC,
                      width: S.w(100),
                      height: S.w(100),
                    ),
                  ),
                  Text(
                    '用户名称',
                    style: MTConstant.MIN_WHITE_TEXT,
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _buildAttributes(Color(0xFFFF6C6C), 0.7, 1350, 1963),
                  _buildAttributes(Color(0xFF6C97FF), 0.5, 1800, 2526),
                  _buildAttributes(Color(0xFFC26CFF), 0.6, 123432, 219231),
                  _buildAttributes(Color(0xFFFFF46C), 0.3, 420, 1166),
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
            )),
        SizedBox(
          height: S.h(16),
        ),
      ],
    );
  }

  Widget _buildListTitle(String title) {
    return ListTile(
      leading: Icon(Icons.ac_unit),
      title: Text(
        title,
        style: MTConstant.SMALL_DEFAULT_TEXT,
      ),
      onTap: () {},
    );
  }
}
