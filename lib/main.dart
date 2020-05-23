import 'package:flutter/material.dart';
import './widgets/transaction_add.dart';
import './models/transactions.dart';
import './widgets/transaction_card.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Planner',
      home: ExpensePlanner(),
      debugShowCheckedModeBanner: true,
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
    );
  }
}

class ExpensePlanner extends StatefulWidget {
  @override
  _ExpensePlannerState createState() => _ExpensePlannerState();
}

class _ExpensePlannerState extends State<ExpensePlanner> {
  List<Transaction> _transaction = [
    Transaction(
      id: '01',
      name: 'Insurance',
      amount: 2000.00,
      date: DateTime.now(),
    ),
    Transaction(
      id: '02',
      name: 'Milk',
      amount: 3000.00,
      date: DateTime.now(),
    ),
  ];

  void _addTransaction(String title, double amount) {
    final addTx = Transaction(
      amount: amount,
      name: title,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );

    setState(() {
      _transaction.add(addTx);
    });
  }

  void _startFloatButton(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          child: AddTransaction(_addTransaction),
          onTap: () {},
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Planner'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _startFloatButton(context),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                child: Text('Hey There!!!'),
                elevation: 10,
              ),
            ),
            TransactionCard(_transaction),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startFloatButton(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
