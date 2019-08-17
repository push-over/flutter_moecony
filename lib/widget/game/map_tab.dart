import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_moecony/common/style/style.dart';
import 'package:flutter_moecony/common/utils/screenutil_utils.dart';

class MapTab extends StatefulWidget {
  @override
  _MapTabState createState() => _MapTabState();
}

class _MapTabState extends State<MapTab> {
  List<String> _maps;

  @override
  void initState() {
    super.initState();
    _maps = ['当前地图NPC', '常用传送', '传送至地图', '嘉年华'];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: S.w(30),
        vertical: S.h(20),
      ),
      child: Wrap(
        spacing: 8.0, // 主轴(水平)方向间距
        runSpacing: 4.0, // 纵轴（垂直）方向间距
        children: Boxs(),
      ),
    );
  }

  List<Widget> Boxs() => _maps
      .map(
        (item) => Chip(
          backgroundColor: Theme.of(context).primaryColor,
          labelStyle: MTConstant.NORMAL_WHITE_TEXT,
          label: Text(item),
        ),
      )
      .toList();
}
