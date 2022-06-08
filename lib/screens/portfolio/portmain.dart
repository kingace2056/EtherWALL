import 'package:etherwall/constraints.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';

class MainPort extends StatefulWidget {
  const MainPort({Key? key}) : super(key: key);

  @override
  State<MainPort> createState() => MainPortState();
}

class MainPortState extends State<MainPort> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kPrimaryColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {}, icon: Icon(Icons.arrow_back_ios)),
                    Text(
                      'Portfolio',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(CupertinoIcons.line_horizontal_3_decrease)),
                  ],
                ),
                SizedBox(
                  child: Column(
                    children: [
                      Text(
                        '\$ 500,000,000',
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Text(
                        'Wallet Balance',
                        style: TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(255, 246, 246, 246)),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
