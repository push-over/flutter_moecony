import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_moecony/common/redux/state.dart';
import 'package:flutter_moecony/common/style/style.dart';
import 'package:flutter_moecony/pages/bottom_navigarion_bar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final store = Store<MTState>(
    appReducer,
    middleware: middleware,
    initialState: MTState(
      themeData: ThemeData(primarySwatch: MTColors.PRIMARY_SWATCH),
    ),
  );

  MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: StoreBuilder<MTState>(
        builder: (BuildContext context, store) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: store.state.themeData,
            home: MTBottomNavigationBar(),
          );
        },
      ),
    );
  }
}
