import 'package:etherwall/constraints.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

final cryptoList = {
  'BTC': '/media/37746251/btc.png',
  'ETH': '/media/37746238/eth.png',
  'LTC': '/media/37746243/ltc.png',
  'XRP': '/media/38553096/xrp.png',
  'ADA': '/media/37746235/ada.png',
  'SOL': '/media/37747734/sol.png',
  'USDT': '/media/37746338/usdt.png',
  'DOGE': '/media/37746339/doge.png',
};
var crypName = cryptoList.keys.toList();
var crypImage = cryptoList.values.toList();
var itemIndex = 0;

class DepositScr extends StatefulWidget {
  const DepositScr({Key? key}) : super(key: key);

  @override
  State<DepositScr> createState() => DepositScrState();
}

class DepositScrState extends State<DepositScr> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(8, 20, 8, 8),
      height: MediaQuery.of(context).size.height * 0.7,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Deposit Coins',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ],
          ),
          SizedBox(
            height: 60,
            child: ListView.builder(
              itemCount: crypName.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        itemIndex = index;
                      });
                    },
                    child: Container(
                        width: 150,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: kBgGrey.withOpacity(0.3),
                                blurRadius: 2,
                              ),
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(40)),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Image.network(
                                'https://cryptocompare.com${crypImage[index]}',
                                height: 50,
                                width: 50,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Text(
                                crypName[index],
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),
                          ],
                        )),
                  ),
                );
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 30, bottom: 20),
            height: 200,
            width: 200,
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: kBgGrey.withOpacity(0.3),
                      blurRadius: 10,
                      offset: Offset(0, 0))
                ],
                borderRadius: BorderRadius.circular(20)),
            child: Image.network('https://i.imgur.com/77ZtWkm.png'),
          ),
          Text(
            '0xFD85D716B76A81959609D \n 1dce9DF0215D0E1C33b',
            style: TextStyle(color: Colors.black, fontSize: 15),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Icon(
                    FontAwesomeIcons.copy,
                    size: 25,
                    color: kPrimaryColor,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Copy',
                    style: TextStyle(color: kPrimaryColor, fontSize: 20),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                // child: Icon(Icons.line_axis),
              ),
              Row(
                children: [
                  Icon(
                    FontAwesomeIcons.copy,
                    size: 25,
                    color: kPrimaryColor,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Copy',
                    style: TextStyle(color: kPrimaryColor, fontSize: 20),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
