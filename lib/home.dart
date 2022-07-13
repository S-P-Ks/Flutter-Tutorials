import 'package:flutter/material.dart';
import 'package:flutter_tutorials/widgets/new_transaction.dart';
import 'package:flutter_tutorials/widgets/transaction_list.dart';
import 'model/transaction.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter App"),
      ),
      body: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            child: const Card(
              color: Colors.blue,
              elevation: 5,
              child: Text("Chart!"),
            ),
          ),
          AddTransaction(),
          TransactionList()
        ],
      ),
    );
  }
}
