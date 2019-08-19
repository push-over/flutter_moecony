import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:flutter_moecony/common/redux/state.dart';
import 'package:flutter_moecony/common/style/style.dart';
import 'package:flutter_moecony/common/utils/screenutil_utils.dart';
import 'package:flutter_moecony/common/utils/common_utils.dart';

import 'package:flutter_moecony/widget/switch.dart';

class DailyTab extends StatefulWidget {
  @override
  _DailyTabState createState() => _DailyTabState();
}

class _DailyTabState extends State<DailyTab> {
  List<Map<String, dynamic>> daily;

  @override
  void initState() {
    super.initState();

    daily = [
      {'icon': MTIcons.CLEARANCE, 'title': '除暴', 'status': false},
      {'icon': MTIcons.MONSTER, 'title': '心魔', 'status': false},
      {'icon': MTIcons.DRAGON, 'title': '坠龙', 'status': false},
      {'icon': MTIcons.RUNNING, 'title': '跑环', 'status': false},
      {'icon': MTIcons.GUARD, 'title': '保卫灵昌', 'status': false},
      {'icon': MTIcons.TICKET, 'title': '天渊刷银票', 'status': false},
      {'icon': MTIcons.HEART, 'title': '亡语刷上古', 'status': false},
      {'icon': MTIcons.UPGRADE, 'title': '怒焰刷经验', 'status': false},
      {'icon': MTIcons.VIOLENCE, 'title': '主母通关', 'status': false},
    ];
  }

  @override
  Widget build(BuildContext context) {
    return StoreBuilder<MTState>(
      builder: (BuildContext context, Store store) {
        return ListView.separated(
          padding: EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10,
          ),
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return _buildReward(store);
            }
            index -= 1;
            return _buildDailyItem(index, store);
          },
          separatorBuilder: (BuildContext context, int index) {
            if (index != 0) {
              return Divider();
            } else {
              return Container();
            }
          },
        );
      },
    );
  }

  Widget _buildReward(Store store) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _buildText('登陆天数：71', black: true),
            _buildText('领奖天数：22', black: true),
            _buildText('总签到：1', black: true),
            _buildText('签到：1', black: true),
            _buildText('补签：0', black: true),
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 15,
                ),
                decoration: BoxDecoration(
                  color: store.state.themeData.primaryColor,
                  borderRadius: BorderRadius.circular(
                    S.w(10),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: _buildText('花费50L银'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        _buildText('子进行补签'),
                        Chip(
                          backgroundColor: Colors.amberAccent,
                          label: _buildText('补签'),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        _buildText('冰淇凌'),
                        _buildText('活动奖励'),
                        _buildText('免费'),
                        Chip(
                          backgroundColor: Colors.amberAccent,
                          label: _buildText('点击领取'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            ClipOval(
              child: Container(
                alignment: Alignment.center,
                height: S.w(140),
                width: S.w(140),
                color: store.state.themeData.primaryColor,
                child: _buildText('一键领奖'),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDailyItem(int index, Store store) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            Icon(daily[index]['icon'], color: Color(MTColors.DEFAULT_TEXT),),
            SizedBox(
              width: S.w(20),
            ),
            Text(daily[index]['title'], style: MTConstant.MIDDLE_DEFAULT_TEXT,),
          ],
        ),
        Row(
          children: <Widget>[
            Icon(MTIcons.SETTINGS_Fill),
            MTSwitch(
              title: '',
              store: store,
              initValue: daily[index]['status'],
              onChanged: (v) {
                v
                    ? CommonUtils.snackBar(
                        context, '${daily[index]['title']}开启成功')
                    : CommonUtils.snackBar(
                        context, '${daily[index]['title']}关闭成功');
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildText(String title, {bool black = false}) {
    return Text(
      title,
      style:
          black ? MTConstant.SMALL_DEFAULT_TEXT : MTConstant.SMALL_WHITE_TEXT,
    );
  }
}
