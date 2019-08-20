import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_moecony/common/redux/state.dart';

import 'package:flutter_moecony/widget/tabbar.dart';
import 'package:flutter_moecony/widget/backpack/backpack_tab.dart';
import 'package:flutter_moecony/widget/backpack/warehouse_tab.dart';
import 'package:flutter_moecony/widget/backpack/trading_house_tab.dart';

class BackpackPage extends StatefulWidget {
  @override
  _BackpackPageState createState() => _BackpackPageState();
}

class _BackpackPageState extends State<BackpackPage>
    with TickerProviderStateMixin {
  List<String> tab;
  List<Widget> _tabView;
  TabController _tabController;
  int _currentIndex;

  @override
  void initState() {
    super.initState();

    tab = ['背包', '仓库', '交易行'];
    _tabView = [BackpackTab(), WarehouseTab(), TradingHouseTab()];
    _currentIndex = 0;
    _tabController = TabController(length: tab.length, vsync: this);
    _tabController.addListener(__handleTabSelection);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  __handleTabSelection() {
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
        children: _tabView.map((item) => item).toList(),
      ),
    );
  }
}
