import 'package:flutter/material.dart';

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
