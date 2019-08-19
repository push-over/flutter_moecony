import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:flutter_moecony/common/redux/state.dart';

import 'package:flutter_moecony/common/style/style.dart';
import 'package:flutter_moecony/common/utils/screenutil_utils.dart';

class ActivityTab extends StatefulWidget {
  @override
  _ActivityTabState createState() => _ActivityTabState();
}

class _ActivityTabState extends State<ActivityTab> {
  @override
  Widget build(BuildContext context) {
    return StoreBuilder<MTState>(
      builder: (BuildContext context, Store store) {
        return ListView(
          padding: EdgeInsets.symmetric(
            vertical: S.h(20),
            horizontal: S.w(30),
          ),
          children: <Widget>[
            _buildActivityInfo(store),
            _buildAnnouncement(),
          ],
        );
      },
    );
  }

  Widget _buildActivityInfo(Store store) {
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
                child: Icon(
                  MTIcons.BOOKMARK,
                  color: store.state.themeData.primaryColor,
                ),
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
                      color: store.state.themeData.primaryColor,
                    ),
                  ),
                  SizedBox(
                    width: S.w(10),
                  ),
                  Icon(
                    MTIcons.RUNNING,
                    color: store.state.themeData.primaryColor,
                  ),
                ],
              ),
            ],
          );
        },
        itemCount: 5,
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
