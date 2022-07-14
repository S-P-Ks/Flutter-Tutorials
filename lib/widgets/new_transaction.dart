import 'package:flutter/material.dart';

class AddTransaction extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final Function addNewTransaction;

  AddTransaction(this.addNewTransaction, {Key? key}) : super(key: key);

  void submitData(BuildContext context) {
    final double amount = double.parse(amountController.text);
    final String title = titleController.text;

    print(amount);
    print(title);

    if (title.isEmpty || amount <= 0) {
      return;
    }
    print("Helo");
    addNewTransaction(title, amount);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: Colors.black,
      child: Container(
        padding: const EdgeInsets.all(10),
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
            TextButton(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.all(16.0),
                primary: Colors.blue,
                textStyle: const TextStyle(fontSize: 15),
              ),
              onPressed: () => submitData(context),
              child: const Text('Add Transaction'),
            ),
          ],
        ),
      ),
    );
  }
}
