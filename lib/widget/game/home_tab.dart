import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:flutter_moecony/common/redux/state.dart';
import 'package:flutter_moecony/common/style/style.dart';
import 'package:flutter_moecony/common/utils/screenutil_utils.dart';
import 'package:flutter_moecony/common/utils/common_utils.dart';
import 'package:flutter_moecony/common/utils/navigator_utils.dart';

import 'package:flutter_moecony/widget/cached_network_image.dart';
import 'package:flutter_moecony/widget/switch.dart';
import 'package:flutter_moecony/widget/character_attributes.dart';
import 'package:flutter_moecony/widget/flex_button.dart';
import 'package:flutter_moecony/widget/tabbar.dart';

class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> with TickerProviderStateMixin {
  bool _switch1, _switch2, _switch3;
  List<String> _operationalInformation;
  List<String> tab;
  TabController _tabController;
  int _currentIndex;

  @override
  void initState() {
    super.initState();
    _switch1 = false;
    _switch2 = false;
    _switch3 = false;
    tab = ['主页', '日常', '地图'];

    _currentIndex = 0;
    _tabController = TabController(length: tab.length, vsync: this);
    _tabController.addListener(_handleTabSelection);
    _operationalInformation = [
      '欢迎使用萌兔助手',
      '您不是自动战斗VIP，无法开启！',
      '您成功从道具商场购买了大瓶生命药水',
      '花费200文银票',
      '您成功从道具商场购买了大碗茶X1'
    ];
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  _handleTabSelection() {
    if (mounted) {
      setState(() {
        _currentIndex = _tabController.index;
        print(_currentIndex);
      });
    }
  }

  void _showStatusDialog(Store store) {
    NavigatorUtils.showMTDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: Container(
            width: 250.0,
            height: 400.0,
            padding: EdgeInsets.all(4.0),
            margin: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Color(MTColors.LIGHT),
              borderRadius: BorderRadius.all(
                Radius.circular(4.0),
              ),
            ),
            child: Material(
              child: ListView(
                children: List.generate(
                  30,
                  (T) => Row(
                    children: <Widget>[
                      Icon(Icons.ac_unit),
                      Text('测试'),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _showFeaturesDialog(Store store) {
    NavigatorUtils.showMTDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: Container(
            width: 250.0,
            height: 400.0,
            padding: EdgeInsets.all(4.0),
            margin: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Color(MTColors.LIGHT),
              borderRadius: BorderRadius.all(
                Radius.circular(4.0),
              ),
            ),
            child: Material(
              child: DefaultTabController(
                length: tab.length,
                child: Column(
                  children: <Widget>[
                    MTTabBar(
                      tabController: _tabController,
                      store: store,
                      tab: tab,
                    ),
                    _buildTabBarView(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildTabBarView() {
    return Expanded(
      child: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Text('fsdfsd'),
          Text('fsdfsd'),
          Text('fsdfsd'),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StoreBuilder<MTState>(
      builder: (BuildContext context, Store store) {
        return ListView(
          padding: EdgeInsets.symmetric(
            horizontal: S.w(30),
            vertical: S.h(20),
          ),
          children: <Widget>[
            _buildCharacterInfo(store),
            _buildFeatures(store),
            _buildOperationalContent(),
            _buildOperatingButton(),
          ],
        );
      },
    );
  }

  Widget _buildCharacterInfo(Store store) {
    return Container(
      height: S.h(180),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: NetworkImage(MTIcons.DEFAULT_REMOTE_PIC),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(5),
                        margin: EdgeInsets.only(
                          right: S.w(10),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(S.w(10)),
                          color: Colors.blueAccent,
                        ),
                        child: Text(
                          'Lv.122',
                          style: MTConstant.MIN_WHITE_TEXT,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        '萌兔测试昵称',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        '一线',
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        '灵昌广场',
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                CharacterAttributes(
                  color: Color(0xFFFF6C6C),
                  value: 0.7,
                  min: 1350,
                  max: 1963,
                ),
                CharacterAttributes(
                  color: Color(0xFF6C97FF),
                  value: 0.7,
                  min: 1800,
                  max: 2526,
                ),
                CharacterAttributes(
                  color: Color(0xFFC26CFF),
                  value: 0.6,
                  min: 123432,
                  max: 219231,
                ),
                CharacterAttributes(
                  color: Color(0xFFFFF46C),
                  value: 0.4,
                  min: 420,
                  max: 1166,
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          MTCacheNetworkImageWidget(
                            url: MTIcons.DEFAULT_REMOTE_PIC,
                            width: S.w(40),
                            height: S.w(40),
                          ),
                          SizedBox(
                            width: S.w(15),
                          ),
                          MTCacheNetworkImageWidget(
                            url: MTIcons.DEFAULT_REMOTE_PIC,
                            width: S.w(40),
                            height: S.w(40),
                          ),
                        ],
                      ),
                      GestureDetector(
                        child: Icon(
                          MTIcons.ATTENTION_LIGHT,
                          size: S.sp(40),
                        ),
                        onTap: () => _showStatusDialog(store),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatures(Store store) {
    return Container(
      child: Row(
        children: <Widget>[
          _buildFeaturesItem(store, _switch1, '走路遇怪'),
          _buildFeaturesItem(store, _switch2, '吃聚灵'),
          _buildFeaturesItem(store, _switch3, '恢复'),
          InkWell(
            child: Container(
              width: S.w(60),
              height: S.w(60),
              color: Colors.black12,
              child: Icon(Icons.keyboard_arrow_down),
            ),
            onTap: () => _showFeaturesDialog(store),
          ),
        ],
      ),
    );
  }

  Widget _buildOperationalContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _operationalInformation
          .map(
            (item) => Text(
              '> $item',
              style: MTConstant.SMALL_DEFAULT_TEXT,
            ),
          )
          .toList(),
    );
  }

  Widget _buildOperatingButton() {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: S.h(20),
      ),
      child: MTFlexButton(
        text: '角色无操作',
        color: Theme.of(context).primaryColor,
        textColor: Color(MTColors.LIGHT),
        onPress: () {},
      ),
    );
  }

  Widget _buildFeaturesItem(Store store, bool status, String title) {
    return Expanded(
      child: MTSwitch(
        title: title,
        store: store,
        initValue: status,
        onChanged: (v) {
          v
              ? CommonUtils.snackBar(context, '$title开启成功')
              : CommonUtils.snackBar(context, '$title关闭成功');
        },
      ),
    );
  }
}
