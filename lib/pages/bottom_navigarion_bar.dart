import 'package:flutter/material.dart';

import 'package:flutter_moecony/widget/drawer.dart';

import 'package:flutter_moecony/pages/game_page.dart';
import 'package:flutter_moecony/pages/social_page.dart';
import 'package:flutter_moecony/pages/backpack_page.dart';
import 'package:flutter_moecony/pages/rabbit_page.dart';
import 'package:flutter_moecony/common/style/style.dart';

class MTBottomNavigationBar extends StatefulWidget {
  MTBottomNavigationBar({Key key}) : super(key: key);

  _MTBottomNavigationBarState createState() => _MTBottomNavigationBarState();
}

class _MTBottomNavigationBarState extends State<MTBottomNavigationBar> {
  List<Widget> _pages;
  List<Map<String, dynamic>> _navigationBar;
  PageController _pageController;
  int _currentIndex;

  @override
  void initState() {
    super.initState();
    print('bottom');
    _navigationBar = [
      {
        'title': '首页',
        'icon': MTIcons.GAME,
        'activeIcon': MTIcons.GAME_FILL,
      },
      {
        'title': '社交',
        'icon': MTIcons.SOCIAL,
        'activeIcon': MTIcons.SOCIAL_FILL,
      },
      {
        'title': '背包',
        'icon': MTIcons.BACKPACK,
        'activeIcon': MTIcons.BACKPACK,
      },
      {
        'title': '兔兔坊',
        'icon': MTIcons.RABBIT,
        'activeIcon': MTIcons.RABBIT,
      },
    ];

    _pages = [
      GamePage(),
      SocialPage(),
      BackpackPage(),
      RabbitPage(),
    ];

    _pageController = PageController(initialPage: 0);
    _currentIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MTConstant.APPBAR(
        Text(
          _navigationBar[_currentIndex]['title'],
          style: MTConstant.MIDDLE_WHITE_TEXT,
        ),
      ),
      drawer: MTDrawer(),
      body: PageView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) => _pages[index],
        itemCount: _pages.length,
        controller: _pageController,
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        if (mounted) {
          setState(() {
            _currentIndex = index;
            _pageController.animateToPage(
              index,
              duration: Duration(microseconds: 1),
              curve: Curves.ease,
            );
          });
        }
      },
      items: _navigationBar
          .map(
            (item) => BottomNavigationBarItem(
              title: Text(item['title']),
              icon: Icon(item['icon']),
              activeIcon: Icon(item['activeIcon']),
            ),
          )
          .toList(),
    );
  }
}
