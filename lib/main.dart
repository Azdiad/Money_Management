import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:money/screens/USer.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:money/Model/added.dart';
import 'package:money/screens/Username.dart';

import 'package:motion/motion.dart';

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
      // home: bottomnavs(),
      home: usernames(),
    );
  }
}
