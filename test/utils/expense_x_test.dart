import 'package:flutter_test/flutter_test.dart';
import 'package:spendwise/data/sample_data.dart';
import 'package:spendwise/models/category.dart';
import 'package:spendwise/models/expense.dart';
import 'package:spendwise/utils/expense_x.dart';

void main() {
  // <--- THIS IS THE MISSING LINE
  test('October total is 63.25', () {
    expect(sampleExpenses.inMonth(2026, 10).total, closeTo(63.25, 0.001));
  });

  test('top category of October is bills', () {
    expect(sampleExpenses.inMonth(2026, 10).topCategory, Category.bills);
  });

  test('empty list has no top category and zero total', () {
    expect(<Expense>[].topCategory, isNull);
    expect(<Expense>[].total, 0);
  });

  test('asMoney formats two decimals', () {
    expect(3.0.asMoney, '3.00');
  });
}
