// ignore_for_file: unused_field

import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:money/Model/added.dart';
import 'package:money/screens/Aftertaplist.dart';

class transaction_history extends StatefulWidget {
  final String username;
  const transaction_history({Key? key, required this.username})
      : super(key: key);

  @override
  State<transaction_history> createState() => _transaction_historyState();
}

class _transaction_historyState extends State<transaction_history> {
  var history;
  final Box = Hive.box<added>('data');
  TextEditingController searchController = TextEditingController();

  List<added> _transactionslist = [];

  @override
  void initState() {
    super.initState();
    _transactionslist = Box.values.toList().cast<added>().reversed.toList();
  }

  void _filterTransactions(String query) {
    setState(() {
      _transactionslist = Box.values
          .cast<added>()
          .where((transaction) => transaction.description
              .toLowerCase()
              .contains(query.toLowerCase()))
          .toList()
          .reversed
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (notification) {
            notification.disallowGlow();
            return true;
          },
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [
                  Color.fromARGB(171, 30, 183, 225),
                  Color.fromRGBO(35, 237, 118, 0.767),
                ],
              ),
            ),
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
                            _filterTransactions('');
                          });
                        },
                        onSubmitted: _filterTransactions,
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
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    _filterTransactionsByType('Income');
                                  },
                                  child: Text(
                                    'Income',
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 20),
                                GestureDetector(
                                  onTap: () {
                                    _filterTransactionsByType('Expense');
                                  },
                                  child: Text(
                                    'Expense',
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 20),
                                GestureDetector(
                                  onTap: () {
                                    _filterTransactionsByType('');
                                  },
                                  child: Text(
                                    'All',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          history = _transactionslist[index];
                          return get(index, history);
                        },
                        childCount: _transactionslist.length,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
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
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TransactionDetailsPage(history: history),
          ),
        );
      },
    );
  }

  Widget _head() {
    return Stack(
      alignment: Alignment.topLeft,
      children: [
        Container(
          height: 200,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Color.fromARGB(180, 0, 139, 139),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(60),
              bottomRight: Radius.circular(60),
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Transaction History',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _filterTransactionsByType(String type) {
    setState(() {
      if (type.isEmpty) {
        _transactionslist = Box.values.toList().cast<added>().reversed.toList();
      } else {
        _transactionslist = Box.values
            .cast<added>()
            .where((transaction) =>
                transaction.type.toLowerCase() == type.toLowerCase())
            .toList()
            .reversed
            .toList();
      }
    });
  }
}
