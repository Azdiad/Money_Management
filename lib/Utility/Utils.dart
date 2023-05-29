import 'package:hive_flutter/hive_flutter.dart';
import 'package:money/Model/added.dart';

double totals = 0;

final Box = Hive.box<added>('data');
double total() {
  var history2 = Box.values.toList();

  double totalAmount = 0;
  for (var i = 0; i < history2.length; i++) {
    if (history2[i].type == 'Income') {
      totalAmount += double.parse(history2[i].amount);
    } else {
      totalAmount -= double.parse(history2[i].amount);
    }
  }
  return totalAmount;
}

double Income() {
  var history2 = Box.values.toList();
  double incomeAmount = 0;
  for (var i = 0; i < history2.length; i++) {
    if (history2[i].type == 'Income') {
      incomeAmount += double.parse(history2[i].amount);
    }
  }
  return incomeAmount;
}

double Expense() {
  var history2 = Box.values.toList();
  double expenseAmount = 0;
  for (var i = 0; i < history2.length; i++) {
    if (history2[i].type != 'Income') {
      expenseAmount += double.parse(history2[i].amount);
    }
  }
  return expenseAmount;
}

List<added> today() {
  List<added> a = [];
  var history2 = Box.values.toList();
  DateTime date = DateTime.now();
  for (var i = 0; i < history2.length; i++) {
    if (history2[i].dates.day == date.day) {
      a.add(history2[i]);
    }
  }
  return a;
}

List<added> week() {
  List<added> a = [];

  DateTime date = DateTime.now();
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
  DateTime date = DateTime.now();
  for (var i = 0; i < history2.length; i++) {
    if (history2[i].dates.month == date.month) {
      a.add(history2[i]);
    }
  }
  return a;
}

double total_chart(List<added> a) {
  var history2 = Box.values.toList();
  double totalAmount = 0;
  for (var i = 0; i < history2.length; i++) {
    totalAmount += history2[i].type == 'Income'
        ? double.parse(history2[i].amount)
        : -double.parse(history2[i].amount);
  }
  return totalAmount;
}

List<double> time(List<added> history2, bool hour) {
  List<added> a = [];
  List<double> total = [];
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

double calculateIncome(List<added> transactionData) {
  double income = 0;
  for (var transaction in transactionData) {
    if (transaction.type == 'Income') {
      income += double.parse(transaction.amount);
    }
  }
  return income;
}

double calculateExpense(List<added> transactionData) {
  double expense = 0;
  for (var transaction in transactionData) {
    if (transaction.type != 'Income') {
      expense += double.parse(transaction.amount);
    }
  }
  return expense;
}
