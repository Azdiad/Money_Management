import 'package:money/Utility/m.dart';

List<money> geter() {
  money incomes = money();
  incomes.type = 'incomess';
  incomes.amount = '54065';
  incomes.description = 'salary';
  incomes.dates = DateTime.now();
  incomes.buy = false;

  money expenses = money();

  expenses.type = 'gadgets spend';
  expenses.amount = '2000';
  expenses.description = 'expense for purchase';
  expenses.dates = DateTime.now();

  return [incomes, expenses];
}
