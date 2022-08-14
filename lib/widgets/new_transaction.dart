import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  //const NewTransaction({Key? key}) : super(key: key);
  final Function newTxnAdd;
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  NewTransaction(this.newTxnAdd);

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmt = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmt <= 0) {
      return;
    }

    newTxnAdd(enteredTitle, enteredAmt);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              //onChanged: (value) => titleInput = value,
              controller: titleController,
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              //onChanged: (value) => amountInput = value,
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
            ),
            TextButton(
                child: Text('Add Transaction'),
                //onPressed: () => {print(titleInput), print(amountInput)},
                onPressed: submitData
                //{print(titleController.text), print(amountController.text)},
                )
          ],
        ),
      ),
    );
  }
}
