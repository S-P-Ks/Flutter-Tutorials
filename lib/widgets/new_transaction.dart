import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddTransaction extends StatefulWidget {
  final Function addNewTransaction;

  AddTransaction(this.addNewTransaction, {Key? key}) : super(key: key);

  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  final TextEditingController titleController = TextEditingController();

  final TextEditingController amountController = TextEditingController();

  DateTime? _selectedDate;

  void submitData(BuildContext context) {
    if (titleController.text.isEmpty ||
        amountController.text.isEmpty ||
        _selectedDate == null) {
      return;
    }

    final double amount = double.parse(amountController.text);
    final String title = titleController.text;

    print("Helo");
    widget.addNewTransaction(title, amount, _selectedDate);

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime.now())
        .then((value) {
      setState(() {
        _selectedDate = value;
      });
      print(_selectedDate);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        color: Colors.black,
        child: Container(
          padding: EdgeInsets.only(
              left: 10,
              top: 10,
              right: 10,
              bottom: MediaQuery.of(context).viewInsets.bottom + 10),
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                style: const TextStyle(color: Colors.white),
                cursorColor: Colors.red,
                decoration: const InputDecoration(
                  labelText: "Title",
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                ),
                controller: titleController,
                onSubmitted: (_) => submitData(context),
              ),
              TextField(
                style: const TextStyle(color: Colors.white),
                cursorColor: Colors.red,
                decoration: const InputDecoration(
                    labelText: "Amount",
                    labelStyle: TextStyle(color: Colors.white),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white))),
                controller: amountController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => submitData(context),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                      child: Text(
                    _selectedDate == null
                        ? "No date choosen!"
                        : DateFormat.yMd().format(_selectedDate!),
                    style: Theme.of(context).textTheme.button,
                  )),
                  const SizedBox(
                    width: 10,
                  ),
                  TextButton(
                    onPressed: _presentDatePicker,
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(10),
                    ),
                    child: const Text(
                      "Choose Date",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
              ElevatedButton(
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(16.0),
                  textStyle: Theme.of(context).textTheme.button,
                ),
                onPressed: () => submitData(context),
                child: const Text('Add Transaction'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
