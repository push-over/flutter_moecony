import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:shimmer/shimmer.dart';

import 'package:flutter_moecony/common/redux/state.dart';
import 'package:flutter_moecony/common/style/style.dart';
import 'package:flutter_moecony/common/utils/screenutil_utils.dart';
import 'package:flutter_moecony/common/utils/navigator_utils.dart';
import 'package:flutter_moecony/common/utils/common_utils.dart';

import 'package:flutter_moecony/widget/flex_button.dart';

import 'package:flutter_moecony/pages/select_line_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> _formKey;
  FocusNode _accountfocusNode, _passwordfocusNode;
  bool _isLoading, _isCheck;
  String _account, _password, _currentRegion;
  List<String> _regions;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _isCheck = false;
    _isLoading = false;
    _accountfocusNode = FocusNode();
    _passwordfocusNode = FocusNode();
    _currentRegion = 'N27';
    _regions = [
      'N1',
      'N2',
      'N3',
      'N4',
      'N5',
      'N6',
      'N7',
      'N8',
      'N9',
      'N10',
      'N11',
      'N12',
      'N13',
      'N14',
    ];
  }

  _showThemeDialog(BuildContext context) {
    CommonUtils.showCommitOptionDialog(context, _regions, (index) {
      _selectRegion(index);
    });
  }

  void _selectRegion(index) {
    print(_regions[index]);
    if (mounted) {
      setState(() {
        _currentRegion = _regions[index];
      });
    }
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
              _buildChooseALargeArea(store),
              _buildForm(store),
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
  Widget _buildChooseALargeArea(Store store) {
    return _buildCommon(
      Padding(
        padding: EdgeInsets.symmetric(
          vertical: S.h(30),
        ),
        child: GestureDetector(
          onTap: () => _showThemeDialog(context),
          child: SizedBox(
            child: Shimmer.fromColors(
              baseColor: Theme.of(context).primaryColor,
              highlightColor: Colors.red,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '选择大区：',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: MTConstant.LAGER_SIZE,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    _currentRegion,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: MTConstant.LAGER_SIZE,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// 登陆表单
  Widget _buildForm(Store store) {
    return _buildCommon(
      Form(
        autovalidate: true,
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              focusNode: _accountfocusNode,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: store.state.themeData.primaryColor,
                  ),
                ),
                labelText: '用户名',
              ),
              validator: (val) {
                return val.isEmpty ? '请输入用户名' : null;
              },
              onSaved: (val) {
                if (mounted) {
                  setState(() {
                    _account = val;
                  });
                }
              },
            ),
            SizedBox(
              height: S.h(40),
            ),
            TextFormField(
              focusNode: _passwordfocusNode,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: store.state.themeData.primaryColor,
                  ),
                ),
                labelText: '密码',
              ),
              obscureText: true,
              validator: (val) {
                return val.isEmpty ? '请输入密码' : null;
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
