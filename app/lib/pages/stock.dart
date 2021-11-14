import 'package:flutter/material.dart';

class StockArguments {
  final String ticker;
  final Map data;

  StockArguments(this.ticker, this.data);
}

class Stock extends StatelessWidget {
  const Stock({Key? key}) : super(key: key);

  static const routeName = '/stock';

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as StockArguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(args.ticker),
      ),
      body: const Center(child: Text('You can do it!')),
    );
  }
}
