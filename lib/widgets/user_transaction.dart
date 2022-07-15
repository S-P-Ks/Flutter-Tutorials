import 'package:flutter/material.dart';
import 'package:flutter_tutorials/widgets/chart.dart';
import 'package:flutter_tutorials/widgets/new_transaction.dart';
import 'package:flutter_tutorials/widgets/transaction_list.dart';

import '../model/transaction.dart';

class UserTransaction extends StatelessWidget {
  List<Transaction> _transactions;
  Function deleteTransaction;
  UserTransaction(this._transactions, this.deleteTransaction, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: <Widget>[TransactionList(_transactions, deleteTransaction)],
    ));
  }
}
