import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

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
      body: Center(
          child: Column(
        children: [
          SfRadialGauge(axes: <RadialAxis>[
            RadialAxis(minimum: 0, maximum: 100, ranges: <GaugeRange>[
              GaugeRange(startValue: 0, endValue: 33, color: Colors.green),
              GaugeRange(startValue: 33, endValue: 66, color: Colors.orange),
              GaugeRange(startValue: 67, endValue: 100, color: Colors.red)
            ], pointers: <GaugePointer>[
              NeedlePointer(value: args.data['Sigma Value'] * 100)
            ], annotations: <GaugeAnnotation>[
              GaugeAnnotation(
                  widget: Text("${double.parse((args.data['Sigma Value'] * 100).toStringAsFixed(2))}\n${args.data['Market Prediction']}",
                      style: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold)),
                  angle: 90,
                  positionFactor: 0.5)
            ])
          ])
        ],
      )),
    );
  }
}
