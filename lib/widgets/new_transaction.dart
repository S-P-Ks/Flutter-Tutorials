import 'package:flutter/material.dart';

class AddTransaction extends StatelessWidget {
  AddTransaction({Key? key}) : super(key: key);

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: "Title"),
              controller: titleController,
            ),
            TextField(
              decoration: InputDecoration(labelText: "Amount"),
              controller: amountController,
              keyboardType: TextInputType.number,
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
              onPressed: () {
                print(titleController.text);
                print(amountController.text);
              },
              child: const Text('Add Transaction'),
            ),
          ],
        ),
      ),
    );
  }
}
