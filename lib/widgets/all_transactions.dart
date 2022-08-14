import 'package:flutter/material.dart';

import '../models/transaction.dart';
import './new_transaction.dart';
import './transaction_list.dart';

class AllTransactions extends StatefulWidget {
  const AllTransactions({Key? key}) : super(key: key);

  @override
  State<AllTransactions> createState() => _AllTransactionsState();
}

class _AllTransactionsState extends State<AllTransactions> {
  final List<Transaction> enteredTransactions = [
    Transaction(
        id: 't1', title: 'New shoes', amount: 3000, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'Weekly Groceries', amount: 550, date: DateTime.now())
  ];

  void _addNewTransaction(String txTitle, double txAmt) {
    final newTxn = Transaction(
        id: DateTime.now().toString(),
        title: txTitle,
        amount: txAmt,
        date: DateTime.now());

    setState(() {
      enteredTransactions.add(newTxn);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(_addNewTransaction),
        TransactionList(enteredTransactions)
      ],
    );
  }
}
