import 'package:flutter/material.dart';

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
  int _expenseCount = 0;
  double _total = 0;

  void _addSampleExpense() {
    setState(() {
      _expenseCount++;
      _total += 2.50; // a coffee, for now
    });
  }

  void _reset() {
    setState(() {
      _expenseCount = 0;
      _total = 0;
    });
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
      floatingActionButton: _buildFab(),
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
        Text(
          '$_expenseCount expenses · '
          '${_total.toStringAsFixed(2)} USD',
        ),
      ],
    );
  }

  Widget _buildFab() {
    return FloatingActionButton.extended(
      onPressed: _addSampleExpense,
      icon: const Icon(Icons.add),
      label: const Text('Add coffee'),
    );
  }
}
