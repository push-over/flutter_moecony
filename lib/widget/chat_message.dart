import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

import 'package:flutter_moecony/common/style/style.dart';
import 'package:flutter_moecony/common/utils/screenutil_utils.dart';

import 'package:flutter_moecony/widget/cached_network_image.dart';

class ChatMessage extends StatelessWidget {
  final Store store;
  final String name;
  final String avatar;
  final int grade;
  final String region;
  final String text;
  final AnimationController animationController;
  final bool mainAxisAlignment;

  ChatMessage(
      {Key key,
      this.store,
      this.name,
      this.avatar,
      this.grade,
      this.region,
      this.text,
      this.animationController,
      this.mainAxisAlignment = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: CurvedAnimation(
        parent: animationController,
        curve: Curves.easeOut,
      ),
      axisAlignment: 0.0,
      child: Container(
        margin: EdgeInsets.only(
          top: S.h(40),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: mainAxisAlignment
              ? MainAxisAlignment.end
              : MainAxisAlignment.start,
          children: <Widget>[
            _buildAvatar(),
            SizedBox(
              width: S.w(20),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildUserInfo(),
                SizedBox(
                  height: mainAxisAlignment == false ? S.h(24) : 0.0,
                ),
                _buildContext(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAvatar() {
    if (mainAxisAlignment == false) {
      return ClipOval(
        child: MTCacheNetworkImageWidget(
          url: MTIcons.DEFAULT_REMOTE_PIC,
          width: S.w(80),
          height: S.w(80),
        ),
      );
    } else {
      return Container();
    }
  }

  Widget _buildUserInfo() {
    if (mainAxisAlignment == false) {
      return Row(
        children: <Widget>[
          _buildTag(region, Color(0xFFF62F2F), MTConstant.MIN_WHITE_TEXT),
          SizedBox(
            width: S.w(10),
          ),
          _buildTag('Lv.$grade', Color(0xFFD8D8D8), MTConstant.SMALL_WHITE_TEXT),
          SizedBox(
            width: S.w(10),
          ),
          Text(
            name,
            style: MTConstant.SMALL_DEFAULT_TEXT,
          ),
        ],
      );
    } else {
      return Container();
    }
  }

  Widget _buildTag(String title, Color color, TextStyle textStyle) {
    return Container(
      padding: EdgeInsets.all(S.w(2)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          S.w(5),
        ),
        color: color,
      ),
      child: Text(
        title,
        style: textStyle,
      ),
    );
  }

  _buildContext() {
    return Container(
      padding: EdgeInsets.all(
        S.w(10),
      ),
      decoration: BoxDecoration(
        color: store.state.themeData.primaryColor,
        borderRadius: BorderRadius.circular(
          S.w(10),
        ),
      ),
      width: S.w(372),
      child: Text(
        text,
        style: MTConstant.MIN_WHITE_TEXT,
      ),
    );
  }
}
