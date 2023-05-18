import 'package:flutter/material.dart';
import 'package:money/Model/added.dart';
import 'package:motion/motion.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class TransactionDetailsPage extends StatelessWidget {
  final added history;

  const TransactionDetailsPage({Key? key, required this.history})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 139, 139),
        title: Text('Transaction Details'),
      ),
      body: Center(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 100, bottom: 100, left: 10, right: 10),
          child: Motion.elevated(
            elevation: 60,
            glare: true,
            filterQuality: FilterQuality.high,
            controller: MotionController(maxAngle: .3, damping: .9),
            child: Shimmer(
              duration: Duration(seconds: 5),
              interval: Duration(seconds: 10),
              colorOpacity: .2,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 400,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 0, 139, 139),
                  borderRadius: BorderRadius.all(
                    Radius.circular(40),
                  ),
                  border: Border.all(width: 1),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        ' Date: ${history.dates.day}/${history.dates.month}/${history.dates.year}',
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            letterSpacing: 5),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Type: ${history.type}',
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            letterSpacing: 5),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Description: ${history.description}',
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            letterSpacing: 5),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Amount: ${history.amount}',
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            letterSpacing: 5),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
