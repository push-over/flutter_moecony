import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_moecony/common/utils/screenutil_utils.dart';
import 'package:flutter_moecony/common/style/style.dart';

class MTSwitch extends StatefulWidget {
  Store store;
  String title;
  bool initValue;
  ValueChanged<bool> onChanged;

  MTSwitch(
      {Key key, this.store, this.title, this.initValue = false, this.onChanged})
      : super(key: key);

  _MTSwitchState state;

  @override
  State<StatefulWidget> createState() {
    state = _MTSwitchState();
    return state;
  }

  get value {
    return state.value;
  }

  set value(bool b) {
    state.value = b;
  }
}

class _MTSwitchState extends State<MTSwitch> {
  bool _value;

  get value {
    return _value;
  }

  set value(bool b) {
    setState(() {
      _value = b;
    });
    //只更新自身，不触发widget.onChanged
  }

  @override
  void initState() {
    super.initState();
    _value = widget.initValue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: S.h(96),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            widget.title,
            style: MTConstant.SMALL_DEFAULT_TEXT,
          ),
          Container(
            //嵌套一个Container使点击Switch时也会改变其状态
            child: Switch(
              value: _value,
              activeColor: widget.store.state.themeData.primaryColor,
              activeThumbImage: AssetImage('static/images/1_01.png'),
              inactiveThumbImage: AssetImage('static/images/1_02.png'),
              onChanged: (b) {
                setState(() {
                  //要把改变后的值更新到switch中的value中去，手动复原时才会触发
                  _value = b;
                });
                widget.onChanged(b);
              },
            ),
          ),
        ],
      ),
    );
  }
}
