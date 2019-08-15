import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'package:flutter_moecony/common/redux/state.dart';
import 'package:flutter_moecony/common/style/style.dart';
import 'package:flutter_moecony/common/utils/screenutil_utils.dart';
import 'package:flutter_moecony/common/utils/navigator_utils.dart';

class SelectCharacterPage extends StatefulWidget {
  @override
  _SelectCharacterPageState createState() => _SelectCharacterPageState();
}

class _SelectCharacterPageState extends State<SelectCharacterPage> {
  List<Map<String, dynamic>> _characters;
  bool _isLoading;

  @override
  void initState() {
    super.initState();
    _characters = [
      {
        'avatar': 'static/images/1_01.png',
        '名称：': '小包子',
        '等级': 38,
        'career': '男术士',
      },
      {
        'avatar': 'static/images/1_02.png',
        '名称：': '小包子',
        '等级': 38,
        'career': '刺客',
      },
      {
        'avatar': 'static/images/1_03.png',
        '名称：': '小包子',
        '等级': 38,
        'career': '战士',
      },
      {
        'avatar': 'static/images/1_04.png',
        '名称：': '小包子',
        '等级': 38,
        'career': '刀客',
      }
    ];

    _isLoading = false;
  }

  void _handleSubmit() {
    if (mounted) {
      setState(() {
        _isLoading = true;
      });
    }

    Future.delayed(Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          _isLoading = false;
          NavigatorUtils.goHome(context);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return StoreBuilder<MTState>(
      builder: (BuildContext context, Store store) {
        List<Widget> childrens = [];
        final _mainConatiner = Container(
          child: Column(
            children: <Widget>[
              _buildTitle(store),
              _buildCharacter(store),
            ],
          ),
        );
        childrens.add(_mainConatiner);
        if (_isLoading) {
          childrens.add(MTConstant.LOADDING(context));
        }
        return Scaffold(
          appBar: MTConstant.APPBAR(
            Text(
              '选择角色',
              style: MTConstant.MIDDLE_WHITE_TEXT,
            ),
          ),
          body: Stack(children: childrens),
        );
      },
    );
  }

  /// 角色列表
  Widget _buildCharacter(Store store) {
    return Expanded(
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: <Widget>[
              InkWell(
                borderRadius: BorderRadius.circular(
                  S.w(210),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      S.w(210),
                    ),
                    color: store.state.themeData.primaryColor,
                  ),
                  child: Image.asset(
                    _characters[index].values.elementAt(0),
                  ),
                  width: S.w(420),
                  height: S.w(420),
                ),
                onTap: () => _handleSubmit(),
              ),
              SizedBox(
                height: S.h(20),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    _characters[index].keys.elementAt(1),
                    style: MTConstant.MIDDLE_DEFAULT_TEXT,
                  ),
                  Text(
                    _characters[index].values.elementAt(1),
                    style: MTConstant.MIDDLE_DEFAULT_TEXT,
                  ),
                ],
              ),
              SizedBox(
                height: S.h(10),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    _characters[index].keys.elementAt(2),
                    style: TextStyle(
                      color: Color(0xFFF11010),
                      fontSize: MTConstant.SMALL_SIZE,
                    ),
                  ),
                  Text(
                    '${_characters[index].values.elementAt(2)}',
                    style: TextStyle(
                      color: Color(0xFFF11010),
                      fontSize: MTConstant.SMALL_SIZE,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: S.h(10),
              ),
              Text(
                _characters[index].values.elementAt(3),
                style: MTConstant.MIDDLE_DEFAULT_TEXT,
              ),
            ],
          );
        },
        itemCount: _characters.length,
        viewportFraction: 0.6,
        scale: 0.7,
      ),
    );
  }

  /// 标题
  Widget _buildTitle(Store store) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(
        bottom: S.h(50),
      ),
      decoration: BoxDecoration(
          border: Border(
        bottom: BorderSide(
          width: 2,
          color: store.state.themeData.primaryColor,
        ),
      )),
      height: S.h(140),
      child: Text(
        '选择角色',
        style: MTConstant.BIG_DEFAULT_TEXT,
      ),
    );
  }
}
