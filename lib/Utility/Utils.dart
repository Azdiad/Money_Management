import 'package:hive_flutter/hive_flutter.dart';
import 'package:money/Model/added.dart';

int totals = 0;

final Box = Hive.box<added>('data');
int total() {
  var history2 = Box.values.toList();

  List<int> a = [0, 0];
  for (var i = 0; i < history2.length; i++) {
    a.add(history2[i].type == 'Income'
        ? int.parse(history2[i].amount)
        : int.parse(history2[i].amount) * -1);
  }
  totals = a.reduce((value, element) => value + element);
  return totals;
}

int Income() {
  var history2 = Box.values.toList();
  List a = [0, 0];
  for (var i = 0; i < history2.length; i++) {
    a.add(history2[i].type == 'Income' ? int.parse(history2[i].amount) : 0);
  }
  totals = a.reduce((value, element) => value + element);
  return totals;
}

int Expense() {
  var history2 = Box.values.toList();
  List a = [0, 0];
  for (var i = 0; i < history2.length; i++) {
    a.add(
        history2[i].type == 'Income' ? 0 : int.parse(history2[i].amount) * -1);
  }
  totals = a.reduce((value, element) => value + element);
  return totals;
}

List<added> today() {
  List<added> a = [];
  var history2 = Box.values.toList();
  DateTime date = new DateTime.now();
  for (var i = 0; i < history2.length; i++) {
    if (history2[i].dates.day == date.day) {
      a.add(history2[i]);
    }
  }
  return a;
}

List<added> week() {
  List<added> a = [];

  DateTime date = new DateTime.now();
  var history2 = Box.values.toList();
  for (var i = 0; i < history2.length; i++) {
    if (date.day - 7 <= history2[i].dates.day &&
        history2[i].dates.day <= date.day) {
      a.add(history2[i]);
    }
  }
  return a;
}

List<added> month() {
  List<added> a = [];
  var history2 = Box.values.toList();
  DateTime date = new DateTime.now();
  for (var i = 0; i < history2.length; i++) {
    if (history2[i].dates.month == date.month) {
      a.add(history2[i]);
    }
  }
  return a;
}

int total_chart(List<added> a) {
  var history2 = Box.values.toList();
  List a = [0, 0];
  for (var i = 0; i < history2.length; i++) {
    a.add(history2[i].type == 'Income'
        ? int.parse(history2[i].amount)
        : int.parse(history2[i].amount) * -1);
  }
  totals = a.reduce((value, element) => value + element);
  return totals;
}

List time(List<added> history2, bool hour) {
  List<added> a = [];
  List total = [];
  int counter = 0;
  for (var c = 0; c < history2.length; c++) {
    for (var i = c; i < history2.length; i++) {
      if (hour) {
        if (history2[i].dates.hour == history2[c].dates.hour) {
          a.add(history2[i]);
          counter = i;
        }
      } else {
        if (history2[i].dates.day == history2[c].dates.day) {
          a.add(history2[i]);
          counter = i;
        }
      }
    }
    total.add(total_chart(a));
    a.clear();
    c = counter;
  }

  return total;
}
