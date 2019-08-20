import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_moecony/common/redux/state.dart';

import 'package:flutter_moecony/common/style/style.dart';
import 'package:flutter_moecony/common/utils/screenutil_utils.dart';

class WarehouseTab extends StatefulWidget {
  @override
  _WarehouseTabState createState() => _WarehouseTabState();
}

class _WarehouseTabState extends State<WarehouseTab> {
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return StoreBuilder<MTState>(
      builder: (BuildContext context, Store store) {
        return Padding(
          padding: EdgeInsets.symmetric(
            vertical: S.h(100),
          ),
          child: Column(
            children: <Widget>[
              _buildTitle(store),
              _buildPage(store),
              _buildCurrentPage(store),
            ],
          ),
        );
      },
    );
  }

  _buildTitle(Store store) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: S.h(10),
        horizontal: S.w(20),
      ),
      width: S.w(610),
      color: store.state.themeData.primaryColor,
      child: Text(
        '个人仓库',
        style: MTConstant.NORMAL_WHITE_TEXT,
      ),
    );
  }

  _buildPage(Store store) {
    return Container(
      width: S.w(610),
      alignment: Alignment.centerLeft,
      child: Wrap(
        spacing: 1.0, // gap between adjacent chips
        runSpacing: 1.0, // gap between lines
        children: List<Widget>.generate(
          6,
          (i) => Container(
            alignment: Alignment.center,
            width: S.w(100),
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: store.state.themeData.primaryColor,
              ),
              color: _currentIndex == i ? Colors.brown : Colors.brown[300],
            ),
            child: Text(
              '背包',
              style: MTConstant.SMALL_WHITE_TEXT,
            ),
          ),
        ),
      ),
    );
  }

  _buildCurrentPage(Store store) {
    return Container(
      width: S.w(610),
      child: Wrap(
        spacing: 1.0, // gap between adjacent chips
        runSpacing: 1.0, // gap between lines
        children: List<Widget>.generate(
          30,
          (i) => Container(
            width: S.w(100),
            height: S.w(100),
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: store.state.themeData.primaryColor,
              ),
            ),
            child: Image.network(
              'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=4259300811,497831842&fm=26&gp=0.jpg',
              width: S.w(96),
              height: S.w(96),
            ),
          ),
        ),
      ),
    );
  }
}
