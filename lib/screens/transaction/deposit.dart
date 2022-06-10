import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DepositScr extends StatefulWidget {
  const DepositScr({Key? key}) : super(key: key);

  @override
  State<DepositScr> createState() => DepositScrState();
}

class DepositScrState extends State<DepositScr> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(8, 30, 8, 8),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    )),
                Text(
                  'Deposit',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      CupertinoIcons.line_horizontal_3_decrease,
                      color: Colors.white,
                    )),
              ],
            ),
            SizedBox(height: 20),
          ]),
    );
  }
}
