import 'package:flutter/material.dart';

import 'models/category.dart';
import 'models/expense.dart';
import 'utils/expense_x.dart';

void main() {
  runApp(const SpendWiseApp());
}

class SpendWiseApp extends StatelessWidget {
  const SpendWiseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SpendWise',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF760A3A), // TIU maroon
        ),
      ),
      home: const WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  // 1. REPLACED old counters with the real List of Expenses
  final List<Expense> _expenses = [];

  void _addCoffee() {
    setState(() {
      _expenses.add(
        Expense(
          // Timestamp used as a quick unique ID
          id: DateTime.now().microsecondsSinceEpoch.toString(),
          title: 'Coffee',
          amount: 2.5,
          category: Category.food,
          date: DateTime.now(),
        ),
      );
    });
  }

  // Challenge from Slide 34: Add a second button for Taxi
  void _addTaxi() {
    setState(() {
      _expenses.add(
        Expense(
          id: DateTime.now().microsecondsSinceEpoch.toString(),
          title: 'Taxi',
          amount: 4.0,
          category: Category.transport,
          date: DateTime.now(),
        ),
      );
    });
  }

  void _reset() {
    // setState(_expenses.clear) passes a tear-off as the callback
    setState(_expenses.clear);
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('SpendWise'),
        actions: [
          IconButton(
            onPressed: _reset,
            icon: const Icon(Icons.refresh),
            tooltip: 'Reset',
          ),
        ],
      ),
      body: Center(child: _buildSummary(scheme, text)),
      // Using a Row to hold both buttons from the challenge
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton.extended(
            onPressed: _addTaxi,
            icon: const Icon(Icons.local_taxi),
            label: const Text('Add taxi'),
            backgroundColor: Colors.blue.shade100,
          ),
          const SizedBox(width: 12),
          FloatingActionButton.extended(
            onPressed: _addCoffee,
            icon: const Icon(Icons.add),
            label: const Text('Add coffee'),
          ),
        ],
      ),
    );
  }

  Widget _buildSummary(ColorScheme scheme, TextTheme text) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.account_balance_wallet, size: 96, color: scheme.primary),
        const SizedBox(height: 16),
        Text('Welcome to SpendWise', style: text.headlineSmall),
        const SizedBox(height: 8),

        // 2. Used our Extension methods to calculate length and total
        Text(
          '${_expenses.length} expenses · '
          '${_expenses.total.asMoney} USD',
          style: text.bodyLarge,
        ),

        // 3. Display the top category (Challenge from Slide 34)
        if (_expenses.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              'Top: ${_expenses.topCategory?.emoji} ${_expenses.topCategory?.label}',
              style: TextStyle(color: scheme.onSurfaceVariant),
            ),
          ),
      ],
    );
  }
}
