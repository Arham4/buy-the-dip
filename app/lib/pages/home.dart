import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

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
                  Container(
                    height: 150,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[

                      ],
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/dashboard');
                      },
                      child: const Text('Dashboard')),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/recommendations');
                      },
                      child: const Text('Recommendations')),
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
