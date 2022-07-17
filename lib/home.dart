import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tutorials/widgets/chart.dart';
import 'package:flutter_tutorials/widgets/new_transaction.dart';
import 'package:flutter_tutorials/widgets/transaction_list.dart';
import 'model/transaction.dart';
import 'widgets/user_transaction.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  var bS;

  var _showChart = false;

  late PersistentBottomSheetController _bSC;

  final GlobalKey<ScaffoldState> _key = GlobalKey();

  final List<Transaction> _transactions = [
    Transaction(1, "Shoes", 10, DateTime.now()),
  ];

  List<Transaction> get _recentTransactions {
    return _transactions
        .where(
            (tx) => tx.date.isAfter(DateTime.now().subtract(Duration(days: 7))))
        .toList();
  }

  void _addNewTransaction(String title, double amount, DateTime date) {
    setState(() {
      _transactions
          .add(Transaction(_transactions.length + 1, title, amount, date));
      print(_transactions.length);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        backgroundColor: Colors.transparent,
        builder: (_) {
          return Container(
            height: MediaQuery.of(ctx).size.height,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20),
              ),
              child: Container(
                  padding: const EdgeInsets.all(10),
                  color: Colors.black,
                  child: AddTransaction(_addNewTransaction)),
            ),
          );
          // return GestureDetector(
          //   onTap: () {},
          //   behavior: HitTestBehavior.opaque,
          //   child: AddTransaction(_addNewTransaction),
          // );
        });
  }

  void _deleteTransaction(int id) {
    setState(() {
      _transactions.removeWhere((tx) => tx.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    var appBar = AppBar(
      title: const Text(
        "Flutter App",
      ),
      actions: <Widget>[
        IconButton(
            onPressed: () => _startAddNewTransaction(context),
            icon: const Icon(
              Icons.add,
              color: Colors.black,
            ))
      ],
    );

    final transactionInterface = Container(
        height:
            (MediaQuery.of(context).size.height - appBar.preferredSize.height) *
                0.5,
        child: UserTransaction(_transactions, _deleteTransaction));

    final chartInterface = Container(
        height: (MediaQuery.of(context).size.height -
                appBar.preferredSize.height -
                MediaQuery.of(context).padding.top) *
            0.4,
        child: Chart(_recentTransactions));

    final isLandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      key: _key,
      appBar: appBar,
      body: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          if (isLandScape)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text("Show Chart"),
                Switch(
                    value: _showChart,
                    onChanged: (val) {
                      setState(() {
                        _showChart = val;
                      });
                    })
              ],
            ),
          if (isLandScape) _showChart ? chartInterface : transactionInterface,
          if (!isLandScape) chartInterface,
          if (!isLandScape) transactionInterface,
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _startAddNewTransaction(context),
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
