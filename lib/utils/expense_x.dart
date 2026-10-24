import '../models/category.dart';
import '../models/expense.dart';

extension MoneyX on double {
  String get asMoney => toStringAsFixed(2);
}

extension ExpenseListX on List<Expense> {
  double get total => fold(0, (sum, e) => sum + e.amount);

  Map<Category, double> get totalsByCategory {
    final result = <Category, double>{};
    for (final e in this) {
      result.update(e.category, (v) => v + e.amount, ifAbsent: () => e.amount);
    }
    return result;
  }

  List<Expense> inMonth(int year, int month) =>
      where((e) => e.date.year == year && e.date.month == month).toList();

  List<Expense> get newestFirst =>
      [...this]..sort((a, b) => b.date.compareTo(a.date));

  Category? get topCategory {
    if (isEmpty) return null;
    return totalsByCategory.entries
        .reduce((a, b) => a.value >= b.value ? a : b)
        .key;
  }
}
