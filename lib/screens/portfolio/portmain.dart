// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
// ignore: prefer_const_literals_to_create_immutables

import 'package:etherwall/constraints.dart';
import 'package:etherwall/main.dart';
import 'package:etherwall/widget/bottomNavBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

late TooltipBehavior _tooltipBehavior;

class MainPort extends StatefulWidget {
  const MainPort({Key? key}) : super(key: key);

  @override
  State<MainPort> createState() => MainPortState();
}

class MainPortState extends State<MainPort> {
  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(
      // color: Colors.transparent,
      opacity: 0,
      // animationDuration: 10000,

      enable: true,
      elevation: 10,
      borderColor: Colors.white,
      textStyle: TextStyle(color: Colors.white, fontSize: 20),
      builder: (dynamic data, dynamic point, dynamic series, int pointIndex,
          int seriesIndex) {
        return Container(
          padding: const EdgeInsets.all(10),
          width: 200,
          height: 100,
          decoration: BoxDecoration(
            color: Color.fromARGB(106, 151, 151, 151),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('${data.x}',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              Text('\$${data.y}',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
            ],
          ),
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = <ChartData>[
      ChartData('Jan', 210.2),
      ChartData('Feb', 240.5),
      ChartData('Mar', 355.7),
      ChartData('Apr', 385.6),
      ChartData('May', 542.5),
      ChartData('Jun', 210.5),
      ChartData('Jul', 246.7),
      ChartData('Aug', 350.5),
      ChartData('Sep', 381.22),
      ChartData('Oct', 543.4),
      ChartData('Nov', 384.5),
      ChartData('Dec', 549.09)
    ];

    return SingleChildScrollView(
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
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => MyApp()),
                      );
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    )),
                Text(
                  'Portfolio',
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
                  SafeArea(
                    child: Container(
                      child: SfCartesianChart(
                          isTransposed: false,
                          primaryYAxis: CategoryAxis(isVisible: false),
                          primaryXAxis: CategoryAxis(isVisible: false),
                          tooltipBehavior: _tooltipBehavior,
                          plotAreaBorderWidth: 0,
                          series: <ChartSeries>[
                            SplineSeries<ChartData, String>(
                                color: Colors.white,
                                dataSource: chartData,
                                splineType: SplineType.clamped,
                                enableTooltip: true,
                                xValueMapper: (ChartData data, _) => data.x,
                                yValueMapper: (ChartData data, _) => data.y)
                          ]),
                    ),
                  ),
                  Container(
                      alignment: Alignment.topCenter,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Assets',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20)),
                            ),
                            assetList(CupertinoIcons.bitcoin, 'Bitcoin(BTC)',
                                '300.29 BTC', '\$ 3,000,000', '+3.5 %', kGreen),
                            assetList(
                                FontAwesomeIcons.ethereum,
                                'Ethereum(ETH)',
                                '20.5 ETH',
                                '\$ 3,000,000',
                                '+3.5 %',
                                kGreen),
                            assetList(FontAwesomeIcons.litecoinSign, 'Ethereum',
                                '300', '\$ 3,000,000', '-3.5 %', kRed),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: DottedBorder(
                                borderType: BorderType.RRect,
                                color: Colors.grey,
                                radius: Radius.circular(80),
                                child: Container(
                                  padding: EdgeInsets.all(8),
                                  height: 80,
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    // borderRadius: BorderRadius.circular(80),
                                  ),
                                  child: Center(
                                      child: Text('+ Deposit more coins ',
                                          style: TextStyle(
                                              fontSize: 28,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey))),
                                ),
                              ),
                            ),
                            Center(
                              child: Text(
                                'See all assets',
                                style: TextStyle(
                                    color: kPrimaryColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Container(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Latest transactions',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 10, 0, 8),
                                  child: Column(
                                    children: [
                                      transList(
                                          FontAwesomeIcons.arrowDown,
                                          '300',
                                          '0.02BTC',
                                          'Withdrawn',
                                          'Aug 20 2022',
                                          kRed),
                                      transList(
                                          FontAwesomeIcons.arrowUp,
                                          '200',
                                          '0.01BTC',
                                          'Deposited',
                                          'Aug 10 2022',
                                          kGreen),
                                      transList(
                                          FontAwesomeIcons.arrowRight,
                                          '200',
                                          '0.02ETH',
                                          'Sent',
                                          'Aug 20 2022',
                                          kPrimaryColor),
                                      transList(
                                          FontAwesomeIcons.arrowUp,
                                          '200',
                                          '0.01BTC',
                                          'Deposited',
                                          'Aug 10 2022',
                                          kGreen),
                                      transList(
                                          FontAwesomeIcons.arrowUp,
                                          '200',
                                          '0.01BTC',
                                          'Deposited',
                                          'Aug 10 2022',
                                          kGreen),
                                      transList(
                                          FontAwesomeIcons.arrowDown,
                                          '300',
                                          '0.02BTC',
                                          'Withdrawn',
                                          'Aug 20 2022',
                                          kRed),
                                      transList(
                                          FontAwesomeIcons.arrowRight,
                                          '200',
                                          '0.02ETH',
                                          'Sent',
                                          'Aug 20 2022',
                                          kPrimaryColor),
                                    ],
                                  ),
                                ),
                                Center(
                                  child: InkWell(
                                    onTap: () {},
                                    child: Text(
                                      'See All Transactions',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ],
                            ))
                          ],
                        ),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Container transList(IconData tIcon, String tAmt, String tcAmt, String tType,
      String tDate, tColor) {
    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(8),
      height: 80,
      decoration:
          BoxDecoration(color: kGrey, borderRadius: BorderRadius.circular(80),
              // ignore: prefer_const_literals_to_create_immutables
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
                    border: Border.all(color: tColor, width: 3),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Icon(
                    tIcon,
                    color: tColor,
                    size: 30,
                  )),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '\$$tAmt',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(tcAmt,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
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
                  tType,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20, color: tColor),
                ),
                Text(
                  tDate,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.black54,
                      fontSize: 18),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Container assetList(IconData cIcon, String cName, String cQuantity,
      String cPrice, String cGrowth, Color cColor) {
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
                  child: Icon(
                    cIcon,
                    color: Colors.white,
                    size: 30,
                  )),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cName,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
                  cPrice,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Text(
                  cGrowth,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: cColor, fontSize: 20),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final double? y;
}
