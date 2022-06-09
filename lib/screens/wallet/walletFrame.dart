import 'package:etherwall/constraints.dart';
import 'package:etherwall/screens/portfolio/portmain.dart';
import 'package:etherwall/widget/bottomNavBar.dart';
import 'package:flutter/material.dart';

/// i shouldnt have made this , it can be replaced by btmNavBar() widget through required page , however I've put this for future enhancements

final itemIndex = 1;

class walletFrame extends StatefulWidget {
  const walletFrame({Key? key}) : super(key: key);

  @override
  State<walletFrame> createState() => _walletFrameState();
}

class _walletFrameState extends State<walletFrame> {
  @override
  Widget build(BuildContext context) {
    return btmNavBar();
  }
}
