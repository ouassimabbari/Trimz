import 'package:Trimz/feed_screen.dart';
import 'package:Trimz/menu_screen.dart';
import 'package:Trimz/shop_screen.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';

class MenuFrame extends StatefulWidget {
  static int selectedIndex;
  @override
  _MenuFrameState createState() => _MenuFrameState();
}

class _MenuFrameState extends State<MenuFrame>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> scaleAnimation, smallerScaleAnimation;
  Duration duration = Duration(milliseconds: 200);
  bool menuOpen = false;
  MenuScreen menuScreen;
  List<Widget> screenList = [];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: duration);
    MenuFrame.selectedIndex = 0;
    scaleAnimation =
        Tween<double>(begin: 1.0, end: 0.7).animate(_animationController);
    smallerScaleAnimation =
        Tween<double>(begin: 1.0, end: 0.6).animate(_animationController);
    menuScreen = new MenuScreen(
      returnSelectedMenuIndex: () {
        setState(() {
          MenuFrame.selectedIndex = MenuScreen.selectedMenuIndex;
        });
        print(MenuFrame.selectedIndex);
      },
    );
    screenList = [
      HomeScreen(
        menuCallBack: () {
          setState(() {
            menuOpen = true;
            _animationController.forward();
          });
        },
      ),
      ShopView(menuCallback: () {
        setState(() {
          menuOpen = true;
          _animationController.forward();
        });
      }),
      FeedScreen(menuCallback: () {
        setState(() {
          menuOpen = true;
          _animationController.forward();
        });
      })
    ];
  }

  Widget _buildAnimatedPositioned(int index) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
    return AnimatedPositioned(
      duration: duration,
      top: menuOpen ? deviceHeight * 0.075 : 0,
      bottom: menuOpen ? deviceHeight * 0.075 : 0,
      left: menuOpen ? deviceWidth * 0.55 : 0,
      right: menuOpen ? deviceWidth * -0.45 : 0,
      child: ScaleTransition(
          scale: scaleAnimation,
          child: GestureDetector(
            onTap: () {
              if (menuOpen) {
                setState(() {
                  menuOpen = false;
                  _animationController.reverse();
                });
              }
            },
            child: AbsorbPointer(
              absorbing: menuOpen,
              child: Material(
                  animationDuration: duration,
                  borderRadius: BorderRadius.circular(menuOpen ? 30 : 0),
                  child: screenList[index]),
            ),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        menuScreen,
        _buildAnimatedPositioned(MenuFrame.selectedIndex),
      ],
    );
  }
}
