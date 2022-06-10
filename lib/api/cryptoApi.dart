/// this is not working though , need to maintain it and make it handle the API's , probably this is the time I need to use state management
import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

late var cColor;
var isloading = true;
var cryptos;
var api =
    'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,ADA,SOL,USDT,XRP,DOGE,LINK,THETA,BLZ,WAVES,MATIC,LUNA2,SHIB,LTC&tsyms=USD&apikey=6a8e01c56d91a9f7e8d5fd68cdd465d0bfdcc4be73d0b29ec68f8179059edd37';

class ApiService {
  Future fetchCryptos() async {
    isloading = true;

    final response = await http.get(Uri.parse(api));
    if (response.statusCode == 200) {
      var items = json.decode(response.body)['RAW'];
      Map<String, dynamic> map = items;
      // log(map.toString());
      cryptos = map.values.toList();
      log('test test');
      // log(cryptos.toString());
      log('test test end');

      isloading = false;
      return cryptos;
    } else {
      log('Not working');
      cryptos = [];

      isloading = false;

      return cryptos;
    }
  }
}
