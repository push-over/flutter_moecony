import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:flutter_moecony/common/redux/state.dart';
import 'package:flutter_moecony/common/style/style.dart';
import 'package:flutter_moecony/common/utils/screenutil_utils.dart';
import 'package:flutter_moecony/common/utils/navigator_utils.dart';

import 'package:flutter_moecony/widget/flex_button.dart';

import 'package:flutter_moecony/pages/select_line_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> _formKey;
  bool _isLoading, _isCheck;
  String _account, _password;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _isCheck = false;
    _isLoading = false;
  }

  void _handleSubmit() {
    var _form = _formKey.currentState;
    if (_form.validate()) {
      _isLoading = true;
      _form.save();

      print(_account + '======' + _password);

      Future.delayed(Duration(seconds: 3), () {
        if (mounted) {
          setState(() {
            _isLoading = false;
            NavigatorUtils.NavigatorRouter(
              context,
              SelectLinePage(),
            );
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return StoreBuilder<MTState>(
      builder: (BuildContext context, Store store) {
        List<Widget> childrens = [];
        final _mainConatiner = Container(
          child: Column(
            children: <Widget>[
              _buildMtLogo(),
              _buildForm(),
              _buildRememberPassword(),
              _buildLoginButton(context, store),
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
              '登陆',
              style: MTConstant.MIDDLE_WHITE_TEXT,
            ),
          ),
          body: SingleChildScrollView(
            child: Stack(
              children: childrens,
            ),
          ),
        );
      },
    );
  }

  /// logo
  Widget _buildMtLogo() {
    return _buildCommon(
      Stack(
        children: <Widget>[
          Text(
            '萌兔助手',
            style: TextStyle(
              fontSize: S.sp(80),
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              color: Colors.black,
              width: S.w(140),
              height: S.h(6),
            ),
          ),
        ],
      ),
    );
  }

  /// 登陆表单
  Widget _buildForm() {
    return _buildCommon(
      Form(
        autovalidate: true,
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: new InputDecoration(
                labelText: '用户名',
              ),
              validator: (val) {
                return val.length < 1 ? '用户名不允许为空' : null;
              },
              onSaved: (val) {
                if (mounted) {
                  setState(() {
                    _account = val;
                  });
                }
              },
            ),
            TextFormField(
              decoration: new InputDecoration(
                labelText: '密码',
              ),
              obscureText: true,
              validator: (val) {
                return val.length < 1 ? '密码不允许为空' : null;
              },
              onSaved: (val) {
                if (mounted) {
                  setState(() {
                    _password = val;
                  });
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  /// 记住密码
  Widget _buildRememberPassword() {
    return _buildCommon(
      Row(
        children: <Widget>[
          Checkbox(
            value: _isCheck,
            onChanged: (check) {
              if (mounted)
                setState(() {
                  _isCheck = check;
                });
            },
          ),
          Text(
            '记住密码',
            style: MTConstant.SMALL_DEFAULT_TEXT,
          ),
        ],
      ),
    );
  }

  /// 登陆按钮
  Widget _buildLoginButton(BuildContext context, Store store) {
    return _buildCommon(
      MTFlexButton(
        text: '登陆',
        color: store.state.themeData.primaryColor,
        textColor: Color(MTColors.LIGHT),
        fontSize: S.sp(32),
        onPress: () => _handleSubmit(),
      ),
    );
  }

  Widget _buildCommon(Widget widget) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: S.w(30),
        vertical: S.w(10),
      ),
      child: widget,
    );
  }
}
