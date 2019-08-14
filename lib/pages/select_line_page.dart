import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:flutter_moecony/common/redux/state.dart';
import 'package:flutter_moecony/common/style/style.dart';
import 'package:flutter_moecony/common/utils/screenutil_utils.dart';

import 'package:flutter_moecony/widget/spinkit.dart';

class SelectLinePage extends StatefulWidget {
  @override
  _SelectLinePageState createState() => _SelectLinePageState();
}

class _SelectLinePageState extends State<SelectLinePage> {
  Map<String, dynamic> _listLines;

  @override
  void initState() {
    super.initState();
    _listLines = {
      '惊天动地一线': true,
      '惊天动地二线': false,
      '惊天动地三线': true,
      '惊天动地四线': false,
      '惊天动地五线': true,
      '惊天动地六线': false,
      '惊天动地七线': true,
      '惊天动地八线': false,
    };
  }

  @override
  Widget build(BuildContext context) {
    return StoreBuilder<MTState>(
      builder: (BuildContext context, Store store) {
        return Scaffold(
          appBar: MTConstant.APPBAR(
            Text(
              '选择线路',
              style: MTConstant.MIDDLE_WHITE_TEXT,
            ),
          ),
          body: Column(
            children: <Widget>[
              _buildTitle(store),
              _buildListLines(store),
              _buildLoginInfo(),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTitle(Store store) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          border: Border(
        bottom: BorderSide(
          width: 2,
          color: store.state.themeData.primaryColor,
        ),
      )),
      height: S.h(140),
      child: Text(
        '选择线路',
        style: MTConstant.BIG_DEFAULT_TEXT,
      ),
    );
  }

  Widget _buildListLines(Store store) {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.symmetric(
          horizontal: S.w(110),
        ),
        itemBuilder: (BuildContext context, int index) =>
            _buildLineItem(store, index),
        itemCount: _listLines.length,
      ),
    );
  }

  Widget _buildLineItem(Store store, int index) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: S.h(24),
          horizontal: S.w(30),
        ),
        margin: EdgeInsets.symmetric(
          vertical: S.h(20),
        ),
        decoration: BoxDecoration(
          color: store.state.themeData.primaryColor,
          borderRadius: BorderRadius.circular(
            S.w(10),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              _listLines.keys.elementAt(index),
              style: MTConstant.SMALL_WHITE_TEXT,
            ),
            Row(
              children: <Widget>[
                ClipOval(
                  child: Container(
                    width: S.w(16),
                    height: S.w(16),
                    color: _listLines.values.elementAt(index)
                        ? Color(0xFF5AF62E)
                        : Color(0xFFF62E2E),
                  ),
                ),
                SizedBox(
                  width: S.w(20),
                ),
                Text(
                  _listLines.values.elementAt(index) ? '正常' : '异常',
                  style: MTConstant.MIN_WHITE_TEXT,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoginInfo() {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: S.w(110),
          vertical: S.h(180),
        ),
        child: Column(
          children: <Widget>[
            _buildCommonRow('上次登陆时间：', '2018-10-31 00:00:00'),
            _buildCommonRow('上次登陆IP：', '59.41.207.121'),
          ],
        ),
      ),
    );
  }

  Widget _buildCommonRow(String key, String value) {
    return Row(
      children: <Widget>[
        Text(
          key,
          style: MTConstant.MIN_DEFAULT_TEXT,
        ),
        Text(
          value,
          style: MTConstant.MIN_DEFAULT_TEXT,
        ),
      ],
    );
  }
}
