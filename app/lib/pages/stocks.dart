import 'dart:convert';

import 'package:http/http.dart';
import 'package:flutter/material.dart';

import 'stock.dart';

class Stocks extends StatefulWidget {
  const Stocks({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return StocksState();
  }
}

class StocksState extends State<Stocks> {
  final TextEditingController _searchTickerController = TextEditingController();
  bool _loadingStock = false;

  void openStock(String ticker) {
    get(Uri.parse('http://10.21.1.196:5000/stock/${ticker}'), headers: {})
        .then((response) {
      setState(() {
        _loadingStock = false;
        Navigator.pushNamed(
          context,
          Stock.routeName,
          arguments: StockArguments(
            _searchTickerController.text.toUpperCase(),
            json.decode(response.body),
          ),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Stocks'), actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search),
        )
      ]),
      body: Center(
        child: _loadingStock
            ? Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: Colors.black54,
                child: Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: _searchTickerController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    filled: true,
                    hintStyle: TextStyle(color: Colors.grey[800]),
                    hintText: "Type in a stock or crypto ticker",
                    fillColor: Colors.white70,
                  ),
                  onSubmitted: (value) {
                    _loadingStock = true;
                    openStock(_searchTickerController.text.toUpperCase());
                  },
                ),
              ),
      ),
    );
  }
}
