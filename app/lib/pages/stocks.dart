import 'package:flutter/material.dart';

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
