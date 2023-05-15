import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

import 'package:money/Model/added.dart';
import 'package:money/Widgets/Bottom%20Nav.dart';

class adding extends StatefulWidget {
  const adding({super.key});

  @override
  State<adding> createState() => _addingState();
}

List<Map<String, dynamic>> _transactionslist = [];

class _addingState extends State<adding> {
  final Box = Hive.box<added>('data');

  DateTime date = DateTime.now();
  String? selectedItem;
  List _items = ['Income', 'expense'];
  final TextEditingController _typeoftransaction = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final List<Map<String, dynamic>> _addeddatas = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          alignment: Alignment.topLeft,
          children: [
            Container(
              height: 224,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Color.fromARGB(180, 0, 139, 139),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(60),
                  bottomRight: Radius.circular(60),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => bottomnavs(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
                const Text(
                  " Add",
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Icon(Icons.attach_file_rounded)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 450,
                      width: 350,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black45,
                              blurRadius: 1,
                              spreadRadius: 2,
                            )
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 50,
                          ),
                          Container(
                            width: 300,
                            decoration: BoxDecoration(
                                border: Border.all(width: 1),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(left: 10),
                                ),
                                DropdownButton<String>(
                                  hint: const Text(
                                    'Income or Expense',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  value: selectedItem,
                                  onChanged: (newValue) {
                                    setState(() {
                                      selectedItem = newValue;
                                    });
                                  },
                                  items: _items.map((item) {
                                    return DropdownMenuItem<String>(
                                      value: item,
                                      child: Text(item),
                                    );
                                  }).toList(),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              date_time(context),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: const EdgeInsets.only(left: 10),
                                decoration: BoxDecoration(
                                    border: Border.all(width: 1),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10))),
                                height: 50,
                                width: 300,
                                child: TextField(
                                  controller: _amountController,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    hintText: 'Amount',
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: const EdgeInsets.only(left: 10),
                                decoration: BoxDecoration(
                                    border: Border.all(width: 1),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10))),
                                height: 50,
                                width: 300,
                                child: TextField(
                                  controller: _descriptionController,
                                  decoration: const InputDecoration(
                                    hintText: 'Description',
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                // onTap: () async {
                                //   if (_items == null) {
                                //     // _createitems
                                //     _addeddatas;
                                //     (
                                //       {
                                //         "amount": _amountController.text,
                                //         "description":
                                //             _descriptionController.text,
                                //         "date": date_time(context),
                                //       },
                                //     );
                                //   }
                                //   ;
                                // },
                                child: SizedBox(
                                  width: 100,
                                  height: 50,
                                  child: FloatingActionButton(
                                    heroTag: 'bottomnavs',
                                    onPressed: () {
                                      print('hi');
                                      setState(() {
                                        var add = added(
                                            amount: _amountController.text,
                                            type: selectedItem!,
                                            description:
                                                _descriptionController.text,
                                            dates: date);
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => bottomnavs(),
                                          ),
                                        );
                                        Box.add(add);
                                        // Box.clear();
                                        // print(added);
                                      });
                                    },
                                    backgroundColor:
                                        const Color.fromARGB(255, 0, 139, 139),
                                    shape: const ContinuousRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30))),
                                    child: const Text('Add'),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container date_time(BuildContext context) {
    final DateFormat formatter = DateFormat('dd/MM/yyyy');
    final String formattedDate = formatter.format(date);
    return Container(
      alignment: Alignment.bottomLeft,
      padding: const EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        border: Border.all(width: 1),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      height: 50,
      width: 300,
      child: TextButton(
        onPressed: () async {
          DateTime? newDate = await showDatePicker(
            context: context,
            initialDate: date,
            firstDate: DateTime(2020),
            lastDate: DateTime(2050),
          );
          if (newDate == null) return;
          setState(() {
            date = DateTime(newDate.year, newDate.month, newDate.day);
          });
        },
        child: Text(
          'Date: $formattedDate',
          style: const TextStyle(fontSize: 17, color: Colors.black54),
        ),
      ),
    );
  }
}

Future<void> details(BuildContext context) async {}
