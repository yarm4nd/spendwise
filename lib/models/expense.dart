import 'category.dart';

class Expense {
  final String id;
  final String title;
  final double amount;
  final Category category;
  final DateTime date;
  final String? note;

  // Item 2: Immutable Expense with named required params
  const Expense({
    required this.id,
    required this.title,
    required this.amount,
    required this.category,
    required this.date,
    this.note,
  });

  bool get isLarge => amount >= 50;

  @override
  String toString() =>
      'Expense($title, $amount, ${category.name}, ${date.toIso8601String()})';

  // Item 6: copyWith
  Expense copyWith({
    String? title,
    double? amount,
    Category? category,
    DateTime? date,
    String? note,
  }) {
    return Expense(
      id: id,
      title: title ?? this.title,
      amount: amount ?? this.amount,
      category: category ?? this.category,
      date: date ?? this.date,
      note: note ?? this.note,
    );
  }

  // Item 6: toMap
  Map<String, Object?> toMap() => {
    'id': id,
    'title': title,
    'amount': amount,
    'category': category.name,
    'date': date.toIso8601String(),
    'note': note,
  };

  // Item 6: fromMap
  factory Expense.fromMap(Map<String, Object?> map) {
    return Expense(
      id: map['id'] as String,
      title: map['title'] as String,
      amount: (map['amount'] as num).toDouble(),
      category: Category.fromName(map['category'] as String?),
      date: DateTime.parse(map['date'] as String),
      note: map['note'] as String?,
    );
  }

  // Item 6: == and hashCode
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Expense &&
          other.id == id &&
          other.title == title &&
          other.amount == amount &&
          other.category == category &&
          other.date == date &&
          other.note == note;

  @override
  int get hashCode => Object.hash(id, title, amount, category, date, note);
}
