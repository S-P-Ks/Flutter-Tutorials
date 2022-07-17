import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPctOfTotal;

  const ChartBar(this.label, this.spendingAmount, this.spendingPctOfTotal,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) => Column(
              children: <Widget>[
                Container(
                  height: constraints.maxHeight * 0.15,
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Text("\$${spendingAmount.toStringAsFixed(0)}"),
                  ),
                ),
                SizedBox(
                  height: constraints.maxHeight * 0.025,
                ),
                Container(
                  height: constraints.maxHeight * 0.6,
                  width: 10,
                  child: Stack(children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1),
                        color: const Color.fromRGBO(220, 220, 220, 1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    FractionallySizedBox(
                      heightFactor: (spendingPctOfTotal / 2),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    )
                  ]),
                ),
                SizedBox(
                  height: constraints.maxHeight * 0.025,
                ),
                Container(
                  height: constraints.maxHeight * 0.15,
                  child: Text(label),
                )
              ],
            ));
  }
}
