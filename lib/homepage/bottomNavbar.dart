import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:trendy_mobile_1/homepage/homepage.dart';
import 'package:trendy_mobile_1/homepage/map/map.dart';
import 'package:trendy_mobile_1/homepage/promotion/promotion.dart';
import 'package:trendy_mobile_1/homepage/topup/topup.dart';
import 'package:trendy_mobile_1/homepage/wash/wash.dart';

PersistentTabController _controller = PersistentTabController(initialIndex: 0);

class bottomNavbar extends StatelessWidget {
  const bottomNavbar({Key? key}) : super(key: key);

  List<Widget> _buildScreens() {
    return [
      homepage(),
      topUp(),
      wash(),
      promotionpage(),
      map(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.home),
        title: "หน้าหลัก",
        textStyle: TextStyle(
          fontFamily: 'LineseedsanRg',
        ),
        activeColorPrimary: Color(0xff00BBA9),
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset('assets/svgassets/wallet1.svg'),
        title: "เติมเงิน",
        textStyle: TextStyle(
          fontFamily: 'LineseedsanRg',
        ),
        activeColorPrimary: Color(0xff00BBA9),
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.settings),
        title: "ซักผ้า",
        textStyle: TextStyle(
          fontFamily: 'LineseedsanRg',
        ),
        activeColorPrimary: Color(0xff00BBA9),
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset('assets/svgassets/promotion.svg'),
        title: "โปรโมชั่น",
        textStyle: TextStyle(
          fontFamily: 'LineseedsanRg',
        ),
        activeColorPrimary: Color(0xff00BBA9),
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.map),
        title: "แผนที่",
        textStyle: TextStyle(
          fontFamily: 'LineseedsanRg',
        ),
        activeColorPrimary: Color(0xff00BBA9),
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style16, // Choose the nav bar style with this property.
    );
  }
}
