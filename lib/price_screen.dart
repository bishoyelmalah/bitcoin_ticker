import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'network.dart';

class PriceScreen extends StatefulWidget {
  const PriceScreen({super.key});

  @override
  PriceScreenState createState() => PriceScreenState();
}

class PriceScreenState extends State<PriceScreen> {
  String? selectedCurr = "USD";

  @override
  void initState() {
    super.initState();
    print("Hello, world");
    getCurrencyData();
  }

  void getCurrencyData() async {
    CoinExchange exchangeData = CoinExchange(fromCurr: "BTC", toCurr: "USD");
    var response = await exchangeData.getResponse();
    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('🤑 Coin Ticker')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = ? USD',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: DropdownButton(
              value: selectedCurr,
              items: [
                for (String item in currenciesList)
                  DropdownMenuItem(value: item, child: Text(item)),
              ],
              onChanged: (value) {
                setState(() {
                  selectedCurr = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
