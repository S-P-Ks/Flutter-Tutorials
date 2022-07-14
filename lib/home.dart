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

  void _addNewTransaction(String title, double amount) {
    setState(() {
      _transactions.add(
          Transaction(_transactions.length + 1, title, amount, DateTime.now()));
      print(_transactions.length);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        backgroundColor: Colors.transparent,
        builder: (_) {
          return ClipRRect(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
            ),
            child: Container(
                padding: const EdgeInsets.all(10),
                color: Colors.black,
                child: AddTransaction(_addNewTransaction)),
          );
          // return GestureDetector(
          //   onTap: () {},
          //   behavior: HitTestBehavior.opaque,
          //   child: AddTransaction(_addNewTransaction),
          // );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
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
      ),
      body: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          Chart(_recentTransactions),
          UserTransaction(_transactions),
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
