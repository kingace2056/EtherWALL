import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:etherwall/constraints.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shimmer/shimmer.dart';

late var cColor;

var api =
    'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,ADA,SOL,USDT,XRP,DOGE,LINK,THETA,BLZ,WAVES,MATIC,LUNA2,SHIB,LTC&tsyms=USD&apikey=6a8e01c56d91a9f7e8d5fd68cdd465d0bfdcc4be73d0b29ec68f8179059edd37';

class MarketScreen extends StatefulWidget {
  const MarketScreen({Key? key}) : super(key: key);

  @override
  State<MarketScreen> createState() => _MarketScreenState();
}

class _MarketScreenState extends State<MarketScreen> {
  static List cryptos = [];
  bool isloading = false;

  late Widget cBody;

  @override
  void initState() {
    cColor = kPrimaryColor;
    isloading = true;
    cBody = cBodyMethod();
    super.initState();
    fetchCryptos();
  }

  Column cBodyMethod() {
    return Column(
      children: [
        Shimmer(
          loop: 10,
          gradient: shimmerGradient,
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 7,
            itemBuilder: (context, index) {
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
                      ]));
            },
          ),
        ),
      ],
    );
  }

  Future<void> fetchCryptos() async {
    setState(() {
      isloading = true;
      cBody = cBodyMethod();
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

        isloading = false;
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
      child: RefreshIndicator(
        color: kPrimaryColor,
        onRefresh: () async {
          await Future.delayed(Duration(seconds: 0));

          fetchCryptos();
        },
        child: SingleChildScrollView(
          child: Column(
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
                    'Market Rate',
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
              if (isloading) cBody else genListView(),
            ],
          ),
        ),
      ),
    );
  }

  genListView() {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: cryptos.length,
      itemBuilder: (context, int index) {
        log(cryptos.length.toString());
        log('message');
        var cName = cryptos[index]['USD']['FROMSYMBOL'];
        var cPrice = cryptos[index]['USD']['PRICE'].toStringAsFixed(3);
        var cChange = cryptos[index]['USD']['CHANGE24HOUR'].toStringAsFixed(3);

        var cGrowth = cryptos[index]['USD']['CHANGEPCTDAY'];
        log(cGrowth.toString());
        late bool negative = cGrowth.isNegative;
        // var cChange =
        //     cryptos[index]['USD']['CHANGEDAY'].toStringAsFixed(3);
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
                      Text('\$$cChange',
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
      },
    );
  }
}
