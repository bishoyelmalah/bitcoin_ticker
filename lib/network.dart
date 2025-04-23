import 'package:http/http.dart' as http;
import 'dart:convert';
import 'constants.dart';

class CoinExchange {
  CoinExchange({required this.fromCurr, required this.toCurr});

  final String fromCurr;
  final String toCurr;

  late int value;

  Future<http.Response> getResponse() async {
    var response = await http.get(
      Uri.parse("$apiLink/$fromCurr/$toCurr?apikey=$apiKey"),
    );

    return response;
  }
}
