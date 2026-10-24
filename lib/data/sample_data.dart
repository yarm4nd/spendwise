import '../models/category.dart';
import '../models/expense.dart';

final sampleExpenses = <Expense>[
  Expense(
    id: 'e1',
    title: 'Lunch at campus',
    amount: 8.5,
    category: Category.food,
    date: DateTime(2026, 10, 12, 13),
  ),
  Expense(
    id: 'e2',
    title: 'Taxi home',
    amount: 4,
    category: Category.transport,
    date: DateTime(2026, 10, 12, 18),
  ),
  Expense(
    id: 'e3',
    title: 'Electricity',
    amount: 35,
    category: Category.bills,
    date: DateTime(2026, 10, 10),
  ),
  Expense(
    id: 'e4',
    title: 'Pharmacy',
    amount: 12.25,
    category: Category.health,
    date: DateTime(2026, 10, 2),
  ),
  Expense(
    id: 'e5',
    title: 'Headphones',
    amount: 59.99,
    category: Category.shopping,
    date: DateTime(2026, 9, 28),
    note: 'Birthday gift',
  ),
  Expense(
    id: 'e6',
    title: 'Shawarma',
    amount: 3.5,
    category: Category.food,
    date: DateTime(2026, 10, 11),
  ),
];
