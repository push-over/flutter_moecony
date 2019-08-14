import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_moecony/common/redux/state.dart';
import 'package:flutter_moecony/common/style/style.dart';
import 'package:flutter_moecony/common/utils/navigator_utils.dart';

import 'package:flutter_moecony/pages/chat_page.dart';

class SocialPage extends StatelessWidget {
  Map<String, IconData> chats = {
    '所有聊天': MTIcons.SOCIAL,
    '近聊': MTIcons.SOCIAL,
    '私聊': MTIcons.SOCIAL,
  };

  @override
  Widget build(BuildContext context) {
    return StoreBuilder<MTState>(
      builder: (BuildContext context, Store store) {
        return ListView.builder(
          itemCount: chats.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 20.0),
              color: Color(MTColors.LIGHT),
              child: ListTile(
                title: Text(
                  chats.keys.elementAt(index),
                  style: MTConstant.SMALL_DEFAULT_TEXT,
                ),
                leading: Icon(
                  chats.values.elementAt(index),
                  color: store.state.themeData.primaryColor,
                ),
                onTap: () {
                  switch (chats.keys.elementAt(index)) {
                    case '近聊':
                      NavigatorUtils.NavigatorRouter(
                        context,
                        ChatPage(),
                      );
                      break;
                    case '私聊':
                      NavigatorUtils.NavigatorRouter(
                        context,
                        ChatPage(),
                      );
                      break;
                    default:
                      NavigatorUtils.NavigatorRouter(
                        context,
                        ChatPage(),
                      );
                  }
                },
              ),
            );
          },
        );
      },
    );
  }
}
