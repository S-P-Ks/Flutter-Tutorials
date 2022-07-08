import 'package:flutter/material.dart';
import 'package:flutter_tutorials/Product.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login Page")),
      body: WillPopScope(
          onWillPop: () async {
            bool res = await showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      title: const Text("Confirm"),
                      content: const Text("Do you want to go back ?"),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(false);
                            },
                            child: const Text("No")),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(true);
                            },
                            child: const Text("Yes"))
                      ],
                    ));
            return Future.value(res);
          },
          child: Center(
            child: Column(
              children: <Widget>[
                const Text(
                  "Login Page",
                  style: TextStyle(fontSize: 20),
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => ProductScreen()));
                    },
                    child: const Text("Products Page"))
              ],
            ),
          )),
    );
  }
}
