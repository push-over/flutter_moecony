import 'package:flutter/material.dart';

import 'package:flutter_moecony/pages/login_page.dart';
import 'package:flutter_moecony/pages/select_line_page.dart';
import 'package:flutter_moecony/pages/select_character_page.dart';
import 'package:flutter_moecony/common/utils/navigator_utils.dart';

class TestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          color: Colors.black12,
          child: ListTile(
            title: Text('登陆页面'),
            onTap: () => NavigatorUtils.NavigatorRouter(
              context,
              LoginPage(),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          color: Colors.black12,
          child: ListTile(
            title: Text('选线页面'),
            onTap: () => NavigatorUtils.NavigatorRouter(
              context,
              SelectLinePage(),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          color: Colors.black12,
          child: ListTile(
            title: Text('选择角色'),
            onTap: () => NavigatorUtils.NavigatorRouter(
              context,
              SelectCharacterPage(),
            ),
          ),
        ),
      ],
    );
  }
}
