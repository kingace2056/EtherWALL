import 'package:etherwall/constraints.dart';
import 'package:etherwall/screens/portfolio/portmain.dart';
import 'package:etherwall/widget/bottomNavBar.dart';
import 'package:flutter/material.dart';

final itemIndex = 1;

class walletFrame extends StatefulWidget {
  const walletFrame({Key? key}) : super(key: key);

  @override
  State<walletFrame> createState() => _walletFrameState();
}

class _walletFrameState extends State<walletFrame> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: MainPort(),
      bottomNavigationBar: btmNavBar(),
    );
  }
}
