// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:etherwall/api/cryptoApi.dart';
import 'package:etherwall/screens/market/market.dart';
import 'package:etherwall/screens/portfolio/portmain.dart';
import 'package:etherwall/screens/transaction/deposit.dart';
import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:etherwall/constraints.dart';

class btmNavBar extends StatefulWidget {
  const btmNavBar({Key? key}) : super(key: key);

  @override
  State<btmNavBar> createState() => _btmNavBarState();
}

class _btmNavBarState extends State<btmNavBar> {
  var itemIndex = 0;
  var viewWidget;
  @override
  void initState() {
    viewWidget = const MainPort();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List pageList = [
      MainPort(),
      DepositScr(),
      DepositScr(),
      MarketScreen(),
    ];
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: viewWidget,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        safeAreaLeft: false,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        activeColor: kPrimaryColor,
        inactiveColor: Colors.grey,
        backgroundColor: kGrey,
        gapLocation: GapLocation.center,
        gapWidth: 0,
        elevation: 20,
        icons: [
          FontAwesomeIcons.downLeftAndUpRightToCenter,
          FontAwesomeIcons.plus,
          FontAwesomeIcons.cube,
          FontAwesomeIcons.chartLine,
        ],
        activeIndex: itemIndex,
        onTap: (index) {
          if (index == 1 || index == 2) {
            showModalBottomSheet<dynamic>(
                isScrollControlled: true,
                backgroundColor: kGrey,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                )),
                context: context,
                builder: (_) => DepositScr());
          } else {
            setState(() {
              itemIndex = index;
              viewWidget = pageList[index];
            });
          }
        },
      ),
    );
  }
}
