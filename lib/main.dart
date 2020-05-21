import 'package:flutter/material.dart';
import './widgets/transaction_main.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Planner'),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              child: Text('Hey There!!!'),
              elevation: 10,
            ),
          ),
          MainTransaction(),
        ],
      ),
    );
  }
}
