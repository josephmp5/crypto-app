import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  Future getAllcrypto() async {
    final allApiUrl = Uri.parse(
        "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&ids=bitcoin%2Cethereum%2Csolana&order=market_cap_desc&per_page=100&page=1&sparkline=false");

    final response = await http.get(allApiUrl);
    print(response.statusCode);
    print(response.body);
    return jsonDecode(response.body);
    
  }



}
