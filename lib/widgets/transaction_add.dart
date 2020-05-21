import 'package:flutter/material.dart';

class AddTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function add_transaction;

  AddTransaction(this.add_transaction);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              labelText: "Title",
            ),
            controller: titleController,
          ),
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Spent',
            ),
            controller: amountController,
          ),
          FlatButton(
            child: Text(
              'Add Transaction',
            ),
            onPressed: () {
              add_transaction(
                titleController.text,
                double.parse(amountController.text),
              );
            },
            textColor: Colors.purple,
          ),
        ],
      ),
    );
  }
}
