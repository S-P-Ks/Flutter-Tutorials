import 'package:flutter/material.dart';
import 'package:flutter_tutorials/model/transaction.dart';
import 'package:flutter_tutorials/widgets/chart_bar.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransaction;
  const Chart(this.recentTransaction, {Key? key}) : super(key: key);

  List<Map<String, Object>> get groupTransactionValue {
    return List.generate(7, (index) {
      final weekday = DateTime.now().subtract(Duration(days: index));
      var totalSum = 0.00;

      for (int i = 0; i < recentTransaction.length; i++) {
        if (recentTransaction[i].date.day == weekday.day &&
            recentTransaction[i].date.month == weekday.month &&
            recentTransaction[i].date.year == weekday.year) {
          totalSum = totalSum + recentTransaction[i].amount;
        }
      }

      return {
        "day": DateFormat.E().format(weekday).substring(0, 1),
        "amount": totalSum
      };
    });
  }

  double get totalSpending {
    return groupTransactionValue.fold(
        0.0, (sum, item) => sum + (item["amount"] as double));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(20),
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupTransactionValue
              .map((data) {
                return Flexible(
                  fit: FlexFit.tight,
                  child: ChartBar(
                      data["day"] as String,
                      data["amount"] as double,
                      totalSpending == 0.0
                          ? 0.0
                          : (data["amount"] as double) / totalSpending),
                );
              })
              .toList()
              .reversed
              .toList(),
        ),
      ),
    );
  }
}
