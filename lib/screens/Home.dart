import 'package:flutter/material.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:money/Model/added.dart';
import 'package:money/Utility/Utils.dart';
import 'package:money/Widgets/Bottom%20Nav.dart';
import 'package:motion/motion.dart';

class Homes extends StatefulWidget {
  const Homes({super.key});

  @override
  State<Homes> createState() => _HomesState();
}

List<String> day = [
  'Monday',
  'Tuesday',
  'Wednesday',
  'Thursday',
  'Friday',
  'Saturday',
  'Sunday'
];

class _HomesState extends State<Homes> {
  var history;
  final Box = Hive.box<added>('data');

  List<Map<String, dynamic>> _transactionslist = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
            valueListenable: Box.listenable(),
            builder: (context, value, child) {
              return CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: _head(),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Transaction',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          bottomnavs(initialIndex: 2),
                                    ),
                                  );
                                },
                                child: Text('See all'))
                          ]),
                    ),
                  ),
                  SliverList(
                      delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      history = Box.values.toList().reversed.toList()[index];
                      return getList(history, index);
                    },
                    childCount: Box.length > 5 ? 5 : Box.length,
                  ))
                ],
              );
            }),
      ),
    );
  }

  Widget getList(added history, int index) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) {
        history.delete();
      },
      child: get(index, history),
    );
  }

  ListTile get(int index, added history) {
    return ListTile(
      leading: Text(
          ' ${history.dates.day}/${history.dates.month}/${history.dates.year}'),
      title: Text(
        history.type,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(history.description),
      trailing: Text(
        history.amount,
        style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 19,
            color: history.type == 'Income' ? Colors.green : Colors.red),
      ),
    );
  }

  Widget _head() {
    return //
        Stack(
      alignment: Alignment.topLeft,
      children: [
        Container(
          height: 400,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Color.fromARGB(180, 0, 139, 139),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(60),
                  bottomRight: Radius.circular(60))),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              " HELLO",
              style: TextStyle(
                  color: Color.fromARGB(100, 255, 255, 255),
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              " Mohamed Azad",
              style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Align(
          alignment: AlignmentDirectional.center,
          heightFactor: 3,
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Motion.elevated(
              elevation: 60,
              glare: true,
              filterQuality: FilterQuality.high,
              controller: MotionController(maxAngle: .9, damping: .5),
              child: Container(
                height: 147,
                width: 280,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      offset: Offset(0, 3),
                      blurRadius: 5,
                    ),
                  ],
                  color: Color.fromARGB(255, 0, 139, 139),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Column(children: [
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total balance',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                        Text(
                          '...',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '₹ ${total()}',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5, right: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Icon(Icons.arrow_downward),
                              Text(
                                'Income',
                                style: TextStyle(
                                    color: Color.fromARGB(180, 255, 255, 255),
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [
                              Icon(Icons.arrow_upward),
                              Text(
                                'Expense',
                                style: TextStyle(
                                    color: Color.fromARGB(180, 255, 255, 255),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          '₹ ${Income()}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Text(
                          '₹ ${Expense()}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ]),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
