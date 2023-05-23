import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:infinite_card_rotation/infinite_card_rotation.dart';
import 'package:money/Utility/Utils.dart';
import 'package:money/Widgets/Bottom%20Nav.dart';
// import 'package:money/Widgets/Chart.dart';
// import 'package:money/screens/History.dart';
import 'package:money/screens/Terms.dart';
import 'package:money/screens/Username.dart';

class usersettings extends StatefulWidget {
  final String username;
  const usersettings({Key? key, required this.username}) : super(key: key);

  @override
  State<usersettings> createState() => _usersettingsState();
}

class _usersettingsState extends State<usersettings> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (notification) {
        notification.disallowGlow();
        return true;
      },
      child: Scaffold(
        backgroundColor: Color.fromARGB(225, 0, 139, 139),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [
                Color.fromARGB(200, 0, 139, 139),
                Color.fromARGB(255, 35, 232, 190),
              ],
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Settings',
                      style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                        child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 55),
                          child: Text(
                            'HELLO',
                            style: TextStyle(
                                color: Color.fromARGB(100, 255, 255, 255),
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 55),
                          child: Text(
                            'There',
                            style: TextStyle(
                                color: Color.fromARGB(100, 255, 255, 255),
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    )),
                    SizedBox(
                      height: 400,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => bottomnavs(
                                            initialIndex: 2,
                                            username: widget.username),
                                      ),
                                    );
                                  });
                                },
                                child: Container(
                                  width: 250,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black26,
                                        blurRadius: 15.0,
                                        spreadRadius: 10,
                                        offset: Offset(4, 4),
                                      )
                                    ],
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(60),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Transaction History',
                                      style: TextStyle(
                                        letterSpacing: 2,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          terms(username: widget.username),
                                    ),
                                  );
                                },
                                child: Container(
                                  width: 200,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black26,
                                        blurRadius: 15.0,
                                        spreadRadius: 10,
                                        offset: Offset(4, 4),
                                      )
                                    ],
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(60),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Terms & Conditions',
                                      style: TextStyle(
                                        // letterSpacing: 1,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => bottomnavs(
                                            username: widget.username),
                                      ),
                                    );
                                  });
                                },
                                child: Container(
                                  width: 150,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black26,
                                        blurRadius: 15.0,
                                        spreadRadius: 10,
                                        offset: Offset(4, 4),
                                      )
                                    ],
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(60),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Back',
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                child: FlipCard(
                                  front: Container(
                                    width: 200,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black26,
                                          blurRadius: 15.0,
                                          spreadRadius: 10,
                                          offset: Offset(4, 4),
                                        )
                                      ],
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(60),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Exit From App',
                                        style: TextStyle(
                                          letterSpacing: 1,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                  back: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        exit(0);
                                      });
                                    },
                                    child: Container(
                                      width: 200,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black26,
                                            blurRadius: 15.0,
                                            spreadRadius: 10,
                                            offset: Offset(4, 4),
                                          )
                                        ],
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(60),
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Confirm',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 1,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  speed: 900,
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                child: FlipCard(
                                  front: Container(
                                    width: 250,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black26,
                                          blurRadius: 15.0,
                                          spreadRadius: 10,
                                          offset: Offset(4, 4),
                                        )
                                      ],
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(60),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Reset Transactions',
                                        style: TextStyle(
                                            letterSpacing: 2,
                                            color: Colors.redAccent,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  back: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        Box.clear();
                                        // Data.clearAll;
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => usernames(),
                                          ),
                                        );
                                      });
                                    },
                                    child: Container(
                                      width: 250,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black26,
                                            blurRadius: 15.0,
                                            spreadRadius: 10,
                                            offset: Offset(4, 4),
                                          )
                                        ],
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(60),
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Are You Sure',
                                          style: TextStyle(
                                              letterSpacing: 2,
                                              color: Colors.redAccent,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ),
                                  speed: 900,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ]),
            ],
          ),
        ),
      ),
    ));
  }
}
