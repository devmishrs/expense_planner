import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './transactions.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Planner',
      home: ExpensePlanner(),
      debugShowCheckedModeBanner: true,
    );
  }
}

class ExpensePlanner extends StatelessWidget {
  List<Transaction> transaction = [
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Planner'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              child: Text('Hey There!!!'),
              elevation: 10,
            ),
          ),
          Column(
            children: transaction.map((tr) {
              return Card(
                elevation: 5,
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.purple,
                          width: 2,
                        ),
                      ),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        '₹${tr.amount}',
                        style: TextStyle(
                          color: Colors.purple[200],
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          tr.name,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          DateFormat.yMMMEd().format(tr.date),
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
