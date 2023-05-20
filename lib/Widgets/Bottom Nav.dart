import 'package:flutter/material.dart';
import 'package:money/screens/History.dart';
import 'package:money/screens/Home.dart';
import 'package:money/screens/Statistics.dart';
import 'package:money/screens/USer.dart';
import 'package:money/screens/adding.dart';

class bottomnavs extends StatefulWidget {
  final int initialIndex;
  final String username;

  bottomnavs({this.initialIndex = 0, required this.username});

  @override
  _bottomnavsState createState() => _bottomnavsState();
}

class _bottomnavsState extends State<bottomnavs> {
  late List<Widget> tabs;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    tabs = [
      Homes(username: widget.username),
      statistics(username: widget.username),
      transaction_history(username: widget.username),
      usersettings(username: widget.username),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Icon(
          Icons.add,
        ),
        Scaffold(
          body: tabs.elementAt(_currentIndex),
          bottomNavigationBar: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: .5),
                ),
                child: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  currentIndex: _currentIndex,
                  onTap: (int index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  selectedItemColor: Colors.cyan[200],
                  unselectedItemColor: Colors.grey[600],
                  items: [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: '',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.bar_chart_rounded),
                      label: '',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.history),
                      label: '',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.settings),
                      label: '',
                    ),
                  ],
                  backgroundColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                    heroTag: "Adds",
                    backgroundColor: Color.fromARGB(255, 0, 139, 139),
                    elevation: 10,
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              adding(username: widget.username),
                        ),
                      );
                    },
                    child: Icon(Icons.add)),
              ],
            ),
            SizedBox(
              height: 35,
            )
          ],
        ),
      ],
    );
  }
}
