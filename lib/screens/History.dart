import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:money/Model/added.dart';
import 'package:money/Widgets/Bottom%20Nav.dart';

class transaction_history extends StatefulWidget {
  const transaction_history({super.key});

  @override
  State<transaction_history> createState() => _transaction_historyState();
}

class _transaction_historyState extends State<transaction_history> {
  var history;
  final Box = Hive.box<added>('data');
  TextEditingController searchController = TextEditingController();

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
                    child: AnimSearchBar(
                      width: MediaQuery.of(context).size.width,
                      textController: searchController,
                      onSuffixTap: () {
                        setState(() {
                          searchController.clear();
                        });
                      },
                      onSubmitted: (p0) {},
                      helpText: 'Search for..',
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 10, right: 10, top: 20),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Transactions',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Text('All')
                          ]),
                    ),
                  ),
                  SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                    history = Box.values.toList().reversed.toList()[index];
                    return get(index, history);
                  }, childCount: Box.length))
                ],
              );
            }),
      ),
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
          height: 200,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Color.fromARGB(180, 0, 139, 139),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(60),
                bottomRight: Radius.circular(60)),
          ),
          child: Center(
              child: Text(
            'Transaction History',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
          )),
        ),
      ],
    );
  }
}
