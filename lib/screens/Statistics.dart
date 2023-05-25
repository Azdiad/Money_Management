import 'package:flutter/material.dart';
import 'package:money/Model/added.dart';
import 'package:money/Utility/Utils.dart';
import 'package:money/Widgets/Chart.dart';

class statistics extends StatefulWidget {
  final String username;
  const statistics({Key? key, required this.username});

  @override
  State<statistics> createState() => _statisticsState();
}

ValueNotifier kj = ValueNotifier(0);

class _statisticsState extends State<statistics> {
  List day = ['Day', 'Week', 'Month'];
  List f = [today(), week(), month()];
  List<added> a = [];
  int index_Color = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: ValueListenableBuilder(
            valueListenable: kj,
            builder: (context, dynamic value, Widget? child) {
              a = f[value];
              a = a.reversed.toList();
              return Scaffold(
                body: SafeArea(
                  child: custom(),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  CustomScrollView custom() {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Statistics',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ...List.generate(
                      3,
                      (index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              index_Color = index;
                              kj.value = index;
                            });
                          },
                          child: Container(
                            width: 80,
                            height: 30,
                            decoration: BoxDecoration(
                              color: index_Color == index
                                  ? Color.fromARGB(225, 0, 139, 139)
                                  : Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                            ),
                            child: Padding(
                              padding:
                                  EdgeInsets.only(left: 10, right: 10, top: 2),
                              child: Text(
                                day[index],
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              PieChart(
                indexx: index_Color,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Top Spending',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Container(child: Icon(Icons.swap_vert)),
                ],
              ),
            ],
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return ListTile(
                leading: Text(
                    ' ${a[index].dates.day}/${a[index].dates.month}/${a[index].dates.year}'),
                title: Text(
                  a[index].type,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(a[index].description),
                trailing: Text(
                  a[index].amount,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 19,
                    color:
                        a[index].type == 'Income' ? Colors.green : Colors.red,
                  ),
                ),
              );
            },
            childCount: a.length > 5 ? 5 : a.length,
          ),
        ),
      ],
    );
  }
}
