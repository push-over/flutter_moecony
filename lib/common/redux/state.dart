import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_moecony/common/redux/theme_redux.dart';

/// 全局 Store 的对象, 保存 State 数据
class MTState {
  ThemeData themeData;

  MTState({this.themeData});
}

/// Reducer
MTState appReducer(MTState state, action) {
  return MTState(
    themeData: ThemeDataReducer(state.themeData, action),
  );
}

/// Middleware
final List<Middleware<MTState>> middleware = [];
