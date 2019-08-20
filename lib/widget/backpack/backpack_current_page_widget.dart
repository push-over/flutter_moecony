import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

import 'package:flutter_moecony/common/utils/screenutil_utils.dart';

class BackpackCurrentPageWidget extends StatelessWidget {
  final Store store;

  BackpackCurrentPageWidget({Key key, @required this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: S.w(610),
      child: Wrap(
        spacing: 1.0, // gap between adjacent chips
        runSpacing: 1.0, // gap between lines
        children: List<Widget>.generate(
          30,
          (i) => Container(
            width: S.w(100),
            height: S.w(100),
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: store.state.themeData.primaryColor,
              ),
            ),
            child: Image.network(
              'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=4259300811,497831842&fm=26&gp=0.jpg',
              width: S.w(96),
              height: S.w(96),
            ),
          ),
        ),
      ),
    );
  }
}
