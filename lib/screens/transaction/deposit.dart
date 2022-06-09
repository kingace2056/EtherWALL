import 'package:flutter/material.dart';

class DepositScr extends StatefulWidget {
  const DepositScr({Key? key}) : super(key: key);

  @override
  State<DepositScr> createState() => DepositScrState();
}

class DepositScrState extends State<DepositScr> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      child: Text('Deposit Screen'),
    ));
  }
}
