import 'package:redux/redux.dart';

/// 全局 Store 的对象, 保存 State 数据
class MTState {
  MTState();
}

/// Reducer
MTState appReducer(MTState state, action) {
  return MTState();
}

/// Middleware
final List<Middleware<MTState>> middleware = [];
