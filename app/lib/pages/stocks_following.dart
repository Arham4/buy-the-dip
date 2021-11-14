import 'package:flutter/material.dart';

class StocksFollowing extends StatelessWidget {
  const StocksFollowing({Key? key}) : super(key: key);

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
