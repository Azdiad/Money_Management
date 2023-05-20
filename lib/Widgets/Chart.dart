import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PieChart extends StatelessWidget {
  final double income;
  final double expense;
  final int indexx;

  const PieChart(
      {Key? key,
      required this.income,
      required this.expense,
      required this.indexx})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SfCircularChart(
      series: <CircularSeries>[
        PieSeries<Data, String>(
          dataSource: <Data>[
            Data('Income', income),
            Data('Expense', expense),
          ],
          pointColorMapper: (Data data, _) => data.label == 'Income'
              ? Color.fromARGB(225, 0, 139, 139)
              : Color.fromARGB(255, 237, 84, 73),
          xValueMapper: (Data data, _) => data.label,
          yValueMapper: (Data data, _) => data.value,
          dataLabelSettings: DataLabelSettings(
            isVisible: true,
          ),
        ),
      ],
    );
  }
}

class Data {
  final String label;
  final double value;

  Data(this.label, this.value);
}
