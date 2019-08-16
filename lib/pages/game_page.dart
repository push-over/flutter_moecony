import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_moecony/common/redux/state.dart';

import 'package:flutter_moecony/widget/tabbar.dart';
import 'package:flutter_moecony/widget/game/home_tab.dart';
import 'package:flutter_moecony/widget/game/daily_tab.dart';
import 'package:flutter_moecony/widget/game/map_tab.dart';
import 'package:flutter_moecony/widget/game/task_tab.dart';
import 'package:flutter_moecony/widget/game/activity_tab.dart';

class GamePage extends StatefulWidget {
  static final String sName = 'game';

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> with TickerProviderStateMixin {
  List<String> tab;
  TabController _tabController;
  int _currentIndex;
  List<Widget> _tabView;

  @override
  void initState() {
    super.initState();
    tab = ['主页', '日常', '地图', '任务', '活动'];
    _tabView = [
      HomeTab(),
      DailyTab(),
      MapTab(),
      TaskTab(),
      ActivityTab(),
    ];
    _currentIndex = 0;
    _tabController = TabController(length: tab.length, vsync: this);
    _tabController.addListener(_handleTabSelection);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  _handleTabSelection() {
    if (mounted) {
      setState(() {
        _currentIndex = _tabController.index;
        print(_currentIndex);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return StoreBuilder<MTState>(
      builder: (BuildContext context, Store store) {
        return DefaultTabController(
          length: tab.length,
          child: Column(
            children: <Widget>[
              MTTabBar(
                tabController: _tabController,
                store: store,
                tab: tab,
              ),
              _buildTabBarView(),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTabBarView() {
    return Expanded(
      child: TabBarView(
        controller: _tabController,
        children: _tabView.map((item) {
          return item;
        }).toList(),
      ),
    );
  }
}
