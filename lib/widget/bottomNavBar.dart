import 'package:etherwall/screens/portfolio/portmain.dart';
import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:etherwall/constraints.dart';

class btmNavBar extends StatefulWidget {
  final itemIndex = 0;
  const btmNavBar({Key? key}) : super(key: key);

  @override
  State<btmNavBar> createState() => _btmNavBarState();
}

class _btmNavBarState extends State<btmNavBar> {
  var itemIndex;

  @override
  Widget build(BuildContext context) {
    return AnimatedBottomNavigationBar(
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
        setState(() {
          itemIndex = index;
        });
      },
    );
  }
}
