import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_moecony/common/redux/state.dart';

import 'package:flutter_moecony/common/style/style.dart';
import 'package:flutter_moecony/common/utils/screenutil_utils.dart';

import 'package:flutter_moecony/widget/text_field.dart';
import 'package:flutter_moecony/widget/button.dart';
import 'package:flutter_moecony/widget/card.dart';

class TradingHouseTab extends StatefulWidget {
  @override
  _TradingHouseTabState createState() => _TradingHouseTabState();
}

class _TradingHouseTabState extends State<TradingHouseTab> {
  TextEditingController _textEditingController;
  bool _isComposing = false;

  List<DropdownMenuItem> generateItemList() {
    List<DropdownMenuItem> items = List();
    DropdownMenuItem item1 = new DropdownMenuItem(
      value: '全部',
      child: Text('全部'),
    );
    DropdownMenuItem item2 = new DropdownMenuItem(
      value: '装备',
      child: Text('装备'),
    );
    DropdownMenuItem item3 = new DropdownMenuItem(
      value: '宠物',
      child: Text('宠物'),
    );
    DropdownMenuItem item4 = new DropdownMenuItem(
      value: '宝石',
      child: Text('宝石'),
    );
    DropdownMenuItem item5 = new DropdownMenuItem(
      value: '材料',
      child: Text('材料'),
    );
    DropdownMenuItem item6 = new DropdownMenuItem(
      value: '其他',
      child: Text('其他'),
    );
    items
      ..add(item1)
      ..add(item2)
      ..add(item3)
      ..add(item4)
      ..add(item5)
      ..add(item6);
    return items;
  }

  var selectItemValue;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
  }

  _handleSubmitted(String text, Store store) {
    _textEditingController.clear();
    setState(() {
      _isComposing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return StoreBuilder<MTState>(
      builder: (BuildContext context, Store store) => Column(
        children: <Widget>[
          _buildSearch(store),
          _buildGoodsContext(store),
        ],
      ),
    );
  }

  Widget _buildSearch(Store store) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: S.h(20),
        horizontal: S.w(30),
      ),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: S.w(20),
          ),
          DropdownButtonHideUnderline(
            child: DropdownButton(
              hint: Text('全部'),
              value: selectItemValue,
              items: generateItemList(),
              onChanged: (T) {
                setState(() {
                  selectItemValue = T;
                });
              },
            ),
          ),
          Flexible(
            child: Container(
              margin: EdgeInsets.only(
                left: S.w(20),
                right: S.w(20),
              ),
              child: MTTextField(
                controller: _textEditingController,
                hintText: '请输入搜索内容……',
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
            text: '搜索',
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
    );
  }

  Widget _buildGoodsContext(Store store) => Expanded(
        child: ListView.builder(
          padding: EdgeInsets.symmetric(
            horizontal: S.w(30),
          ),
          itemBuilder: (BuildContext context, int index) =>
              _buildGoodsItem(store),
        ),
      );

  Widget _buildGoodsItem(Store store) {
    return MTCard(
      margin: EdgeInsets.only(
        left: 0,
        top: 0,
        right: 0,
        bottom: S.h(30),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: S.h(10),
          horizontal: S.w(10),
        ),
        child: Row(
          children: <Widget>[
            Container(
              child: Image.network(
                'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=4259300811,497831842&fm=26&gp=0.jpg',
                width: 50,
                height: 50,
              ),
            ),
            SizedBox(
              width: S.w(10),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      _buildText('(鬼)高仙芝之圆月混进家'),
                      _buildText('等级要求：137'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          _buildText('银两'),
                          SizedBox(
                            width: S.w(10),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                width: 1,
                                color: Color(MTColors.DEFAULT_TEXT),
                              ),
                            ),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: S.w(5),
                              ),
                              child: _buildText('9999999999'),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          _buildButton(
                            '查看',
                            store.state.themeData.primaryColor,
                            () {},
                          ),
                          SizedBox(
                            width: S.w(20),
                          ),
                          _buildButton(
                            '购买',
                            store.state.themeData.primaryColor,
                            () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildText(String title) => Text(
        title,
        style: MTConstant.SMALL_DEFAULT_TEXT,
      );

  Widget _buildButton(String title, Color color, GestureTapCallback onTab) =>
      InkWell(
        borderRadius: BorderRadius.circular(
          S.w(50),
        ),
        child: Container(
          alignment: Alignment.center,
          width: S.w(100),
          height: S.h(30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              S.w(50),
            ),
            color: color,
          ),
          child: Text(
            title,
            style: MTConstant.SMALL_WHITE_TEXT,
          ),
        ),
        onTap: onTab,
      );
}
