import 'package:flutter/material.dart';
import '../models/transactions.dart';
import './transaction_add.dart';
import './transaction_card.dart';

class MainTransaction extends StatefulWidget {
  @override
  _MainTransactionState createState() => _MainTransactionState();
}

class _MainTransactionState extends State<MainTransaction> {
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        AddTransaction(_addTransaction),
        TransactionCard(_transaction),
      ],
    );
  }
}
