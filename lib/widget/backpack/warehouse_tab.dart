import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_moecony/common/redux/state.dart';

import 'package:flutter_moecony/common/utils/screenutil_utils.dart';

import 'package:flutter_moecony/widget/backpack/backpack_title_widget.dart';
import 'package:flutter_moecony/widget/backpack/backpack_page_widget.dart';
import 'package:flutter_moecony/widget/backpack/backpack_current_page_widget.dart';

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
              BackpackTitleWidget(
                title: '个人仓库',
                store: store,
              ),
              BackpackPageWidget(currentIndex: _currentIndex, store: store),
              BackpackCurrentPageWidget(store: store),
            ],
          ),
        );
      },
    );
  }
}
