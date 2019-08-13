import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_moecony/common/style/style.dart';
import 'package:flutter_moecony/common/utils/screenutil_utils.dart';

class MTTabBar extends StatefulWidget {
  TabController tabController;
  Store store;
  List<String> tab;

  MTTabBar({Key key, this.tabController, this.store, this.tab}) : super(key: key);
  @override
  _MTTabBarState createState() => _MTTabBarState();
}

class _MTTabBarState extends State<MTTabBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(MTColors.LIGHT),
      constraints: BoxConstraints(
        minHeight: S.h(88),
      ),
      child: TabBar(
        controller: widget.tabController,
        indicatorColor: widget.store.state.themeData.primaryColor,
        labelColor: widget.store.state.themeData.primaryColor,
        unselectedLabelColor: Color(MTColors.DEFAULT_TEXT),
        tabs: widget.tab
            .map(
              (item) => Text(
            item,
            style: TextStyle(
              fontSize: S.sp(28),
            ),
          ),
        )
            .toList(),
      ),
    );
  }
}
