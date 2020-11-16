import 'package:http/http.dart' as http;
import 'dart:convert';


const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR',
  'LKR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];



class CoinData {
  Future getCoinData(String selectedCurrency) async {
    Map<String, String> cryptoPrices = {};
    for(String crypto in cryptoList) {
      String requestURL = 'https://rest.coinapi.io/v1/exchangerate/$crypto/$selectedCurrency?apikey=4DA90901-4491-4EF3-9BCB-342979E8D9A0';
      http.Response response = await http.get(requestURL);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        double price =  data['rate'];
        cryptoPrices[crypto] = price.toStringAsFixed(0);
      } else {
        print(response.statusCode);
        throw 'Problem with the get request';
      }
    }
    return cryptoPrices;
  }
}