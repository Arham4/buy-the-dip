import 'dart:convert';

import 'package:http/http.dart';
import 'package:flutter/material.dart';

import 'stock.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  Map _recommendedStocks = {};
  bool _recommendedLoading = true;
  Map _topPerformers = {};
  bool _topLoading = true;

  @override
  void initState() {
    super.initState();

    _recommendedStocks = {};
    _topPerformers = {};
    get(Uri.parse('http://10.21.1.196:5000/recommendations/5'), headers: {})
        .then((response) {
      setState(() {
        _recommendedStocks = json.decode(response.body);
        _recommendedLoading = false;
      });
    });
    get(Uri.parse('http://10.21.1.196:5000/top-performers'), headers: {})
        .then((response) {
      setState(() {
        _topPerformers = json.decode(response.body);
        _topLoading = false;
      });
    });
  }

  List<Widget> _generateTopPerformers() {
    return <Widget>[
      for (var key in _topPerformers.keys)
        Card(
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(
                context,
                Stock.routeName,
                arguments: StockArguments(
                  key,
                  _topPerformers[key],
                ),
              );
            },
            child: SizedBox(
              height: 100,
              width: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.network(
                      _topPerformers[key]['Logo'],
                      height: 35.0,
                      width: 35.0,
                    ),
                  ),
                  Text(
                    key,
                    style: const TextStyle(color: Colors.black),
                  ),
                  Text(_topPerformers[key]['Market Prediction'],
                      style: TextStyle(
                          color:
                              _topPerformers[key]['Market Prediction'] == "Buy"
                                  ? Colors.green
                                  : _topPerformers[key]['Market Prediction'] ==
                                          "Sell"
                                      ? Colors.red
                                      : Colors.black))
                ],
              ),
            ),
          ),
        ),
    ];
  }

  List<Widget> _generateRecommendations() {
    return <Widget>[
      for (var key in _recommendedStocks.keys)
        Card(
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(
                context,
                Stock.routeName,
                arguments: StockArguments(
                  key,
                  _recommendedStocks[key],
                ),
              );
            },
            child: SizedBox(
              height: 100,
              width: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.network(
                      _recommendedStocks[key]['Logo'],
                      height: 35.0,
                      width: 35.0,
                    ),
                  ),
                  Text(
                    key,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(_recommendedStocks[key]['Market Prediction'],
                      style: TextStyle(
                          color: _recommendedStocks[key]['Market Prediction'] ==
                                  "Buy"
                              ? Colors.green
                              : _recommendedStocks[key]['Market Prediction'] ==
                                      "Sell"
                                  ? Colors.red
                                  : Colors.black)),
                ],
              ),
            ),
          ),
        ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              const Text(
                'Recommended Stocks',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 100,
                width: double.infinity,
                child: _recommendedLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView(
                        scrollDirection: Axis.horizontal,
                        children: _generateRecommendations(),
                      ),
              ),
              const Divider(
                height: 15,
                thickness: 1.0,
              ),
              const Text(
                'Top Performers',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 100,
                width: double.infinity,
                child: _topLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView(
                        scrollDirection: Axis.horizontal,
                        children: _generateTopPerformers(),
                      ),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/dashboard');
                  },
                  child: const Text('Dashboard')),
              /*ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/recommendations');
                  },
                  child: const Text('Recommendations')),*/
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/highestperformers');
                  },
                  child: const Text('Highest Performers')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/stocks');
                  },
                  child: const Text('Stocks')),
            ])));
  }
}
