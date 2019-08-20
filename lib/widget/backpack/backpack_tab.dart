import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_moecony/common/redux/state.dart';

import 'package:flutter_moecony/common/style/style.dart';
import 'package:flutter_moecony/common/utils/screenutil_utils.dart';

import 'package:flutter_moecony/widget/backpack/backpack_title_widget.dart';
import 'package:flutter_moecony/widget/backpack/backpack_page_widget.dart';
import 'package:flutter_moecony/widget/backpack/backpack_current_page_widget.dart';

class BackpackTab extends StatefulWidget {
  @override
  _BackpackTabState createState() => _BackpackTabState();
}

class _BackpackTabState extends State<BackpackTab> {
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return StoreBuilder<MTState>(
      builder: (BuildContext context, Store store) {
        return ListView(
          padding: EdgeInsets.symmetric(
            vertical: S.h(20),
          ),
          children: <Widget>[
            Column(
              children: <Widget>[
                BackpackTitleWidget(
                  title: '个人背包',
                  store: store,
                ),
                BackpackPageWidget(currentIndex: _currentIndex, store: store),
                BackpackCurrentPageWidget(store: store),
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(
                vertical: S.h(20),
              ),
              height: S.h(200),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      _buildCircle('整理背包', Colors.blueAccent),
                      _buildCircle('银票葫芦', Colors.redAccent),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      _buildMoney('银子', store, 123, 432, 21),
                      _buildMoney('银票', store, 43, 543, 12),
                      _buildMoney('金子', store, 423, 234, 234),
                      _buildMoney('金票', store, 324, 432, 243),
                    ],
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildCircle(String title, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: S.w(5),
      ),
      alignment: Alignment.center,
      width: S.w(100),
      height: S.w(100),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          S.w(50),
        ),
        color: color,
      ),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: MTConstant.NORMAL_WHITE_TEXT,
      ),
    );
  }

  Widget _buildBorderBox(int num, Store store) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: S.w(5),
      ),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: store.state.themeData.primaryColor,
        ),
        borderRadius: BorderRadius.circular(
          S.w(5),
        ),
      ),
      child: Text(
        '$num',
        style: MTConstant.SMALL_DEFAULT_TEXT,
      ),
    );
  }

  Widget _buildMoney(
    String title,
    Store store,
    int max,
    int small,
    int min,
  ) {
    return Row(
      children: <Widget>[
        Text(
          '$title：',
          style: MTConstant.SMALL_DEFAULT_TEXT,
        ),
        SizedBox(
          width: S.w(20),
        ),
        _buildBorderBox(max, store),
        Text('锭'),
        _buildBorderBox(small, store),
        Text('两'),
        _buildBorderBox(min, store),
        Text('文'),
      ],
    );
  }
}
