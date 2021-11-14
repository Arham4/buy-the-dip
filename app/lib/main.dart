import 'package:flutter/material.dart';

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
      routes: {
        'Login Page': (context) => const MyHomePage(
              title: 'Login Page',
            ),
        '/home': (context) => const Home(),
        '/recommendations': (context) => const Recommendations(),
        '/highestperformers': (context) => const HighestPerformers(),
        '/stocks': (context) => const Stocks(),
        '/dashboard': (context) => const Dashboard(),
        '/watchlist': (context) => const Watchlist(),
        '/following': (context) => const StocksFollowing(),
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
                              if (_emailController.text != "" &&
                                  _emailController.text.contains("@") &&
                                  _passwordController.text != "") {
                                Navigator.pushReplacementNamed(
                                    context, '/home');
                              }
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

class Recommendations extends StatelessWidget {
  const Recommendations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recommendations'),
      ),
      body: const Center(child: Text('You can do it!')),
    );
  }
}

class HighestPerformers extends StatelessWidget {
  const HighestPerformers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Highest Performers'),
      ),
      body: const Center(child: Text('Peloton')),
    );
  }
}

class Stocks extends StatelessWidget {
  const Stocks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Stocks'), actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search),
        )
      ]),
      body: const Center(child: Text('Bitcoin')),
    );
  }
}

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

class Watchlist extends StatelessWidget {
  const Watchlist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Watchlist'),
      ),
      body: const Center(child: Text('GME')),
    );
  }
}

//
class StocksFollowing extends StatelessWidget {
  const StocksFollowing({Key? key}) : super(key: key);

//
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stocks Following'),
      ),
      body: const Center(child: Text('SP500')),
    );
  }
}
