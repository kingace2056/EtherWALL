import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:etherwall/constraints.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

late var cColor;

var api =
    'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,ADA,SOL,USDT,XRP,DOGE,LINK,THETA,BLZ,WAVES,MATIC,LUNA2,SHIB,LTC&tsyms=USD&apikey=6a8e01c56d91a9f7e8d5fd68cdd465d0bfdcc4be73d0b29ec68f8179059edd37';

class CryptoRate extends StatefulWidget {
  const CryptoRate({Key? key}) : super(key: key);

  @override
  State<CryptoRate> createState() => _CryptoRateState();
}

class _CryptoRateState extends State<CryptoRate> {
  static List cryptos = [];
  bool isloading = false;

  @override
  void initState() {
    cColor = kPrimaryColor;
    super.initState();
    fetchCryptos();
  }

  Future<void> fetchCryptos() async {
    setState(() {
      isloading = true;
    });

    final response = await http.get(Uri.parse(api));
    if (response.statusCode == 200) {
      var items = json.decode(response.body)['RAW'];
      Map<String, dynamic> map = items;
      log(map.toString());
      log('it work');
      setState(() {
        cryptos = map.values.toList();
        log('test test');
        log(cryptos.toString());
        log('test test end');

        setState(() {
          isloading = false;
        });
      });
    } else {
      log('Not working');
      setState(() {
        cryptos = [];

        isloading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return genList();
  }

  Widget genList() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 30, 8, 8),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: cryptos.length,
        itemBuilder: (context, int index) {
          log(cryptos.length.toString());
          log('message');
          var cName = cryptos[index]['USD']['FROMSYMBOL'];
          var cPrice = cryptos[index]['USD']['PRICE'].toString();
          var cChange = cryptos[index]['USD']['CHANGE24HOUR'].toString();

          var cGrowth = cryptos[index]['USD']['CHANGEPCTDAY'];
          log(cGrowth.toString());
          late bool negative = cGrowth.isNegative;
          var cQuantity = cryptos[index]['VOLUME24HOUR'].toString();
          if (negative) {
            cColor = kRed;
          } else {
            cColor = kGreen;
          }

          return Container(
            margin: EdgeInsets.all(8),
            padding: EdgeInsets.all(8),
            height: 80,
            decoration: BoxDecoration(
                color: kGrey,
                borderRadius: BorderRadius.circular(80),
                boxShadow: [
                  BoxShadow(
                      color: Color.fromARGB(130, 158, 158, 158),
                      blurRadius: 5,
                      offset: Offset(0, 3))
                ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Container(
                        margin: EdgeInsets.fromLTRB(8, 5, 20, 5),
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: kPrimaryColor),
                        child: Image.network('https://www.cryptocompare.com' +
                            cryptos[index]['USD']['IMAGEURL'])),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cName,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Text(cQuantity,
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 17,
                                color: Colors.black45)),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '\$$cPrice',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        '${cGrowth.toStringAsFixed(3)}%',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: cColor,
                            fontSize: 20),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
          // ListTile(
          //   title: Text(cryptos[index]['USD']['FROMSYMBOL']),
          //   subtitle: Text(cryptos[index]['USD']['TOSYMBOL']),
          //   leading: Text(cryptos[index]['USD']['PRICE'].toString())
          //   ,
          // );
        },
      ),
    );
  }
}
