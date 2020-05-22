import 'package:flutter/material.dart';

class AddTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function add_transaction;

  AddTransaction(this.add_transaction);

  void submittedData() {
    final checkTitle = titleController.text;
    final checkAmount = double.parse(amountController.text).roundToDouble();

    if (checkTitle.isEmpty || checkAmount <= 0) {
      print("Need to add some dada");
      return;
    }
    add_transaction(
        titleController.text,
        // double.parse(amountController.text).roundToDouble(),
        checkAmount);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          TextField(
            textCapitalization: TextCapitalization.words,
            maxLength: 20,
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
            onSubmitted: (_) => submittedData(),
          ),
          FlatButton(
            child: Text(
              'Add Transaction',
            ),
            onPressed: () => submittedData(),
            textColor: Colors.purple,
          ),
        ],
      ),
    );
  }
}
