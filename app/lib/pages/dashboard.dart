import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Dashboard'),
        ),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/watchlist');
                      },
                      child: const Text('Watchlist')),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/following');
                      },
                      child: const Text('Stocks Following')),
                ])));
  }
}
