import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:money/Model/added.dart';
import 'package:money/Utility/Utils.dart';

class PieChart extends StatefulWidget {
  final int indexx;

  const PieChart({Key? key, required this.indexx}) : super(key: key);

  @override
  _PieChartState createState() => _PieChartState();
}

class _PieChartState extends State<PieChart> {
  late List<added> transactionData;

  @override
  void initState() {
    super.initState();
    transactionData = [];
    updateTransactionData();
  }

  @override
  void didUpdateWidget(covariant PieChart oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.indexx != widget.indexx) {
      updateTransactionData();
    }
  }

  void updateTransactionData() {
    switch (widget.indexx) {
      case 0:
        transactionData = today();
        break;
      case 1:
        transactionData = week();
        break;
      case 2:
        transactionData = month();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    double income = calculateIncome(transactionData).toDouble();
    double expense = calculateExpense(transactionData).toDouble();

    return SfCircularChart(
      series: <CircularSeries>[
        PieSeries<Data, String>(
          dataSource: <Data>[
            Data('Income', income),
            Data('Expense', expense),
          ],
          pointColorMapper: (Data data, _) =>
              data.label == 'Income' ? Color(0xFF008B8B) : Color(0xFFED5449),
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
