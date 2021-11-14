import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import 'pages/dashboard.dart';
import 'pages/highest_performers.dart';
import 'pages/home.dart';
import 'pages/recommendations.dart';
import 'pages/stock.dart';
import 'pages/stocks.dart';
import 'pages/stocks_following.dart';
import 'pages/watch_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Buy The Dip',
      initialRoute: 'Login Page',
      debugShowCheckedModeBanner: false,
      routes: {
        'Login Page': (context) => const MyHomePage(
              title: 'Login Page',
            ),
        '/home': (context) => const Home(),
        '/recommendations': (context) => const Recommendations(),
        '/highestperformers': (context) => const HighestPerformers(),
        '/stocks': (context) => Stocks(),
        '/dashboard': (context) => const Dashboard(),
        '/watchlist': (context) => const Watchlist(),
        '/following': (context) => const StocksFollowing(),
        Stock.routeName: (context) => Stock(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Login Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.0, 1.0],
          colors: [Color(0xFF543CBA), Color(0xFF3FA5B1)],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
                  Widget>[
            const SizedBox(height: 200.0),
            Stack(children: <Widget>[
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                Expanded(
                    child: Column(
                  children: <Widget>[
                    Image.asset('images/unknown.png', height: 125, width: 200),
                    const Text('buy the dip',
                        style: TextStyle(
                            fontSize: 50.0,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFffffff)))
                  ],
                )),
              ]),
            ]),
            Container(
                padding:
                    const EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                child: Column(
                  children: <Widget>[
                    Theme(
                      data: Theme.of(context)
                          .copyWith(splashColor: Colors.transparent),
                      child: TextField(
                        autofocus: false,
                        style: const TextStyle(
                            fontSize: 22.0, color: Color(0xFFbdc6cf)),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color.fromRGBO(65, 45, 135, 0.3),
                          hintStyle: const TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w300,
                            color: Color(0xFFa2c0fc),
                            fontSize: 16,
                          ),
                          hintText: 'Email',
                          contentPadding: const EdgeInsets.only(
                              left: 14.0, bottom: 8.0, top: 8.0),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0x00000000)),
                            borderRadius: BorderRadius.circular(25.7),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0x00000000)),
                            borderRadius: BorderRadius.circular(25.7),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 14.0),
                    Theme(
                      data: Theme.of(context)
                          .copyWith(splashColor: Colors.transparent),
                      child: TextField(
                        obscureText: true,
                        autofocus: false,
                        style: const TextStyle(
                            fontSize: 22.0, color: Color(0xFFbdc6cf)),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color.fromRGBO(65, 45, 135, 0.3),
                          hintStyle: const TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w300,
                            color: Color(0xFFa2c0fc),
                            fontSize: 16,
                          ),
                          hintText: 'Password',
                          contentPadding: const EdgeInsets.only(
                              left: 14.0, bottom: 8.0, top: 8.0),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0x00000000)),
                            borderRadius: BorderRadius.circular(25.7),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0x00000000)),
                            borderRadius: BorderRadius.circular(25.7),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 50.0),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      const SizedBox(width: 1.0),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.07,
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(context, '/home');
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            ),
                            child: const Text('Sign in')),
                      ),
                    ]),
                  ],
                )),
          ]),
        ),
      ),
    );
  }
}
