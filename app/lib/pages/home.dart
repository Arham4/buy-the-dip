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
              Text(
                'Recommended Stocks',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 100,
                width: double.infinity,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    for (var i = 0; i < 5; i++)
                      Card(
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
                                  'https://static.finnhub.io/logo/87cb30d8-80df-11ea-8951-00000000092a.png',
                                  height: 35.0,
                                  width: 35.0,
                                ),
                              ),
                              Text(
                                'AAPL',
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              const Divider(
                height: 15,
                thickness: 1.0,
              ),
              Text(
                'Top Performers',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 100,
                width: double.infinity,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    for (var i = 0; i < 5; i++)
                      Card(
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
                                  'https://static.finnhub.io/logo/87cb30d8-80df-11ea-8951-00000000092a.png',
                                  height: 35.0,
                                  width: 35.0,
                                ),
                              ),
                              Text(
                                'AAPL',
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
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
