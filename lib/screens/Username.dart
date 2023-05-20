// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:money/Widgets/Bottom%20Nav.dart';

class usernames extends StatefulWidget {
  usernames({super.key});

  @override
  State<usernames> createState() => _usernamesState();
}

class _usernamesState extends State<usernames> {
  final _usernameController = TextEditingController();

  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
          child: Form(
              key: _formkey,
              child: Center(
                child: Container(
                  height: 300,
                  width: MediaQuery.of(context).size.width * .7,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        colors: [
                          Color.fromARGB(255, 39, 222, 183),
                          Color.fromARGB(255, 136, 255, 215),
                        ],
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          child: Column(
                            children: [
                              TextFormField(
                                controller: _usernameController,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(30.0),
                                      ),
                                    ),
                                    hintText: AutofillHints.username),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'No Username Found';
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              ElevatedButton.icon(
                                onPressed: () {
                                  if (_formkey.currentState!.validate()) {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => bottomnavs(
                                            username: _usernameController.text),
                                      ),
                                    );
                                  }
                                },
                                icon: const Icon(
                                    Icons.arrow_circle_right_rounded),
                                label: const Text('Next'),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )),
        ),
      ),
    );
  }

  void checking(BuildContext ctx) async {
    if (_usernameController.text.isNotEmpty) {
      Navigator.of(ctx).pushReplacement(
        MaterialPageRoute(
            builder: (ctx1) => bottomnavs(
                initialIndex: 0, username: _usernameController.text)),
      );
    }
  }
}
