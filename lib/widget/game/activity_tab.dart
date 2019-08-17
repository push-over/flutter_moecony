import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'package:flutter_moecony/common/style/style.dart';
import 'package:flutter_moecony/common/utils/screenutil_utils.dart';

class ActivityTab extends StatefulWidget {
  @override
  _ActivityTabState createState() => _ActivityTabState();
}

class _ActivityTabState extends State<ActivityTab> {
  List<Map<String, dynamic>> _characters;

  @override
  void initState() {
    super.initState();
    _characters = [
      {
        'avatar': 'static/images/1_01.png',
        '名称：': '小包子',
        '等级': 38,
        'career': '男术士',
      },
      {
        'avatar': 'static/images/1_02.png',
        '名称：': '小包子',
        '等级': 38,
        'career': '刺客',
      },
      {
        'avatar': 'static/images/1_03.png',
        '名称：': '小包子',
        '等级': 38,
        'career': '战士',
      },
      {
        'avatar': 'static/images/1_04.png',
        '名称：': '小包子',
        '等级': 38,
        'career': '刀客',
      }
    ];
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(
        vertical: S.h(20),
        horizontal: S.w(30),
      ),
      children: <Widget>[
        _buildActivityInfo(),
        _buildAnnouncement(),
      ],
    );
  }

  Widget _buildActivityInfo() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: S.w(50),
        vertical: S.h(20),
      ),
      height: S.h(300),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          S.w(20),
        ),
        boxShadow: [
          BoxShadow(
              color: Colors.grey[300],
              offset: Offset(5.0, 5.0),
              blurRadius: 20.0,
              spreadRadius: 10.0),
          BoxShadow(
            color: Colors.grey[300],
            offset: Offset(1.0, 1.0),
          ),
          BoxShadow(color: Colors.grey[300]),
        ],
      ),
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: Icon(Icons.print),
              ),
              Text(
                '活动一 迷之暗室',
                style: MTConstant.BIG_DEFAULT_TEXT,
              ),
              Text(
                '本次活动共有三种玩法，放河灯，捉小鬼，挑战boss，其中放河灯为单人任务，其他为组队完成',
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: MTConstant.SMALL_DEFAULT_TEXT,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    '活动详情请点击',
                    style: TextStyle(
                      fontSize: S.sp(28),
                      color: Colors.red,
                    ),
                  ),
                  SizedBox(
                    width: S.w(10),
                  ),
                  Icon(Icons.exit_to_app),
                ],
              ),
            ],
          );
        },
        itemCount: _characters.length,
      ),
    );
  }

  Widget _buildAnnouncement() {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: S.h(40),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text(
            '本周游戏改动',
            style: MTConstant.NORMAL_DEFAULT_TEXT,
          ),
          SizedBox(
            height: S.h(30),
          ),
          Column(
            children: <Widget>[
              Text(
                '1.金币/福寿商店上架"六合"系列仙葫芦，下架"一路别/六六大顺系列先忽略',
                style: MTConstant.SMALL_DEFAULT_TEXT,
              ),
              Text(
                '2.金币/福寿商店上架"六合"系列仙葫芦，下架"一路别/六六大顺系列先忽略',
                style: MTConstant.SMALL_DEFAULT_TEXT,
              ),
              Text(
                '3.金币/福寿商店上架"六合"系列仙葫芦，下架"一路别/六六大顺系列先忽略',
                style: MTConstant.SMALL_DEFAULT_TEXT,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
