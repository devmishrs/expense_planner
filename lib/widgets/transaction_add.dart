import 'package:flutter/material.dart';

class AddTransaction extends StatefulWidget {
  final Function add_transaction;

  AddTransaction(this.add_transaction);

  @override
  _AddTransactionState createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submittedData() {
    final checkTitle = titleController.text;
    final checkAmount = double.parse(amountController.text).roundToDouble();

    if (checkTitle.isEmpty || checkAmount <= 0) {
      print("Need to add some dada");
      return;
    }
    widget.add_transaction(
        titleController.text,
        // double.parse(amountController.text).roundToDouble(),
        checkAmount);
    Navigator.of(context).pop();
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
            textColor: Theme.of(context).primaryColor, //Colors.purple,
          ),
        ],
      ),
    );
  }
}
