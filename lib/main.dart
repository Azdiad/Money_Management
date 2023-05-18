// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:money/screens/USer.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:money/Model/added.dart';
import 'package:money/Widgets/Bottom%20Nav.dart';
import 'package:motion/motion.dart';

// const SAVE_KEY_NAME = 'logins';
void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(addedAdapter());
  await Hive.openBox<added>('data');
  await Motion.instance.initialize();
  runApp(moneymanage());
}

class moneymanage extends StatelessWidget {
  const moneymanage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: bottomnavs(),
    );
  }
}
