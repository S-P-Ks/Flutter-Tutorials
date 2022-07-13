import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../model/transaction.dart';

class TransactionList extends StatelessWidget {
  TransactionList({Key? key}) : super(key: key);

  final List<Transaction> transactions = [
    Transaction(1, "Title 1", 10, DateTime.now()),
    Transaction(2, "Title 2", 20, DateTime.now()),
    Transaction(3, "Title 3", 30, DateTime.now()),
    Transaction(4, "Title 4", 40, DateTime.now())
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: transactions
          .map((tx) => Card(
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.purple, width: 2)),
                      child: Text(
                        "\$${tx.amount.toString()}",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.purple),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          tx.title,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Text(
                          DateFormat.yMMMd().format(tx.date),
                          style: const TextStyle(color: Colors.grey),
                        )
                      ],
                    )
                  ],
                ),
              ))
          .toList(),
    );
  }
}
