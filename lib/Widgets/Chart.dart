import 'package:flutter/widgets.dart';
import 'package:money/Model/added.dart';
import 'package:money/Utility/Utils.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class charts extends StatefulWidget {
  int indexx;
  charts({Key? key, required this.indexx}) : super(key: key);

  @override
  State<charts> createState() => _chartsState();
}

class _chartsState extends State<charts> {
  List<added>? a;
  bool b = true;
  bool j = true;

  @override
  Widget build(BuildContext context) {
    switch (widget.indexx) {
      case 0:
        a = today();
        b = true;
        j = true;
        break;
      case 1:
        a = week();
        b = false;
        j = true;
        break;
      case 2:
        a = month();
        b = false;
        j = true;
        break;
      case 3:
        a = year();

        j = false;
        break;
      default:
    }

    return Container(
      width: MediaQuery.of(context).size.width,
      // height: 300,
      child: SfCartesianChart(
        primaryXAxis: CategoryAxis(isInversed: true),
        series: <SplineSeries<datas, String>>[
          SplineSeries<datas, String>(
            color: Color.fromARGB(225, 0, 139, 139),
            width: 3,
            dataSource: <datas>[
              ...List.generate(
                time(a!, b ? true : false).length,
                (index) {
                  return datas(
                      j
                          ? b
                              ? a![index].dates.hour.toString()
                              : a![index].dates.day.toString()
                          : a![index].dates.month.toString(),
                      b
                          ? index > 0
                              ? time(a!, true)[index] +
                                  time(a!, true)[index - 1]
                              : time(a!, true)[index]
                          : index > 0
                              ? time(a!, false)[index] +
                                  time(a!, false)[index - 1]
                              : time(a!, false)[index]);
                },
              )
            ],
            xValueMapper: (datas sales, _) => sales.year,
            yValueMapper: (datas sales, _) => sales.sales,
          ),
        ],
      ),
    );
  }
}

class datas {
  datas(this.year, this.sales);
  final String year;
  final int sales;
}
