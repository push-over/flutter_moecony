import 'dart:math';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_moecony/common/redux/state.dart';
import 'package:flutter_moecony/common/style/style.dart';
import 'package:flutter_moecony/common/utils/screenutil_utils.dart';

import 'package:flutter_moecony/widget/text_field.dart';
import 'package:flutter_moecony/widget/button.dart';
import 'package:flutter_moecony/widget/chat_message.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin {
  TextEditingController _textEditingController;
  List<ChatMessage> _messages;
  bool _isComposing = false;

  @override
  void initState() {
    super.initState();
    _messages = <ChatMessage>[];
    _textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _textEditingController.dispose();
    for (ChatMessage message in _messages)
      message.animationController.dispose();
  }

  _handleSubmitted(String text, Store store) {
    _textEditingController.clear();
    setState(() {
      _isComposing = false;
    });
    ChatMessage message = ChatMessage(
      store: store,
      name: '萌兔',
      grade: 100,
      region: '世界',
      text: text,
      animationController: AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 300),
      ),
      mainAxisAlignment: Random().nextInt(2) == 1 ? true : false,
//      mainAxisAlignment: true,
    );
    if (mounted) {
      setState(() {
//        _messages.add(message);
          _messages.insert(0, message);
      });
    }
    message.animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return StoreBuilder<MTState>(
      builder: (BuildContext context, Store store) {
        return Scaffold(
          appBar: _buildAppBar(),
          body: Column(
            children: <Widget>[
              Flexible(
                child: _buildMessageContext(store),
              ),
              Divider(
                height: S.h(1),
              ),
              Container(
                child: _buildSendMessage(store), //页面下方的文本输入控件
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildMessageContext(Store store) {
    return ListView.builder(
      reverse: true,
      padding: EdgeInsets.all(
        S.w(20),
      ),
//      reverse: true,
      itemCount: _messages.length,
      itemBuilder: (BuildContext context, int index) => _messages[index],
    );
  }

  Widget _buildSendMessage(Store store) {
    return SafeArea(
      child: Container(
        constraints: BoxConstraints(
          minWidth: MediaQuery.of(context).size.width,
        ),
        color: Color(MTColors.LIGHT),
        child: Row(
          children: <Widget>[
            SizedBox(
              width: S.w(20),
            ),
            Icon(
              Icons.add,
              size: S.sp(40),
              color: store.state.themeData.primaryColor,
            ),
            Flexible(
              child: Container(
                margin: EdgeInsets.only(
                  left: S.w(20),
                  right: S.w(20),
                ),
                child: MTTextField(
                  controller: _textEditingController,
                  hintText: '请输入聊天内容……',
                  onChanged: (text) {
                    setState(() {
                      _isComposing = text.length > 0;
                    });
                  },
                ),
              ),
            ),
            MTButton(
              width: S.w(132),
              height: S.h(60),
              text: '发送',
              store: store,
              onTap: _isComposing
                  ? () => _handleSubmitted(_textEditingController.text, store)
                  : null,
            ),
            SizedBox(
              width: S.w(20),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return MTConstant.APPBAR(
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            '所有聊天',
            style: MTConstant.SMALL_WHITE_TEXT,
          ),
          Text(
            '你当前的位置：灵昌城',
            style: MTConstant.MIN_WHITE_TEXT,
          ),
        ],
      ),
    );
  }
}
