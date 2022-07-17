import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../model/transaction.dart';

class TransactionList extends StatelessWidget {
  List<Transaction> transactions;
  Function deleteTransaction;
  TransactionList(this.transactions, this.deleteTransaction, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.6,
        child: transactions.isEmpty
            ? LayoutBuilder(
                builder: (context, constraints) => Column(
                      children: <Widget>[
                        Text(
                          "No transaction to show yet!",
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: constraints.maxHeight * 0.6,
                          child: Image.asset(
                            "assets/waiting.png",
                            fit: BoxFit.contain,
                            colorBlendMode: BlendMode.exclusion,
                          ),
                        ),
                      ],
                    ))
            : ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 8),
                      elevation: 5,
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.purple,
                          child: FittedBox(
                            child: Text("\$${transactions[index].amount}"),
                          ),
                        ),
                        title: Text(
                          transactions[index].title,
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        subtitle: Text(
                          DateFormat.yMMMd().format(transactions[index].date),
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        trailing: MediaQuery.of(context).size.width > 400
                            ? OutlinedButton.icon(
                                onPressed: () {
                                  deleteTransaction(transactions[index].id);
                                },
                                icon: Icon(Icons.delete),
                                label: Text("Delete"),
                                style: OutlinedButton.styleFrom(
                                    primary: Theme.of(context).errorColor),
                              )
                            : IconButton(
                                icon: Icon(Icons.delete),
                                color: Theme.of(context).errorColor,
                                onPressed: () {
                                  deleteTransaction(transactions[index].id);
                                },
                              ),
                      ));
                },
                itemCount: transactions.length,
              ));
  }
}
