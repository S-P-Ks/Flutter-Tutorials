import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double billAmount = 0,
      tipPercentage = 5,
      people = 1,
      tipAmount = 0,
      totalAmount = 0;

  String tipText = "";
  String totalText = "";

  void calculate() {
    if (people == 1) {
      setState(() {
        tipAmount = billAmount * (tipPercentage / 100);
        totalAmount = billAmount + tipAmount;

        tipText = "Tip = ${tipAmount.toStringAsFixed(2)}";
        totalText = "Total Amount = ${totalAmount.toStringAsFixed(2)}";
      });
    } else {
      setState(() {
        tipAmount = billAmount * (tipPercentage / 100);
        tipAmount = tipAmount / people;
        double billAmountPerPerson = billAmount / people;
        totalAmount = billAmountPerPerson + tipAmount;

        tipText = "Tip = ${tipAmount.toStringAsFixed(2)} per person";
        totalText =
            "Total Amount = ${totalAmount.toStringAsFixed(2)} per person";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Tip Calculator")),
        backgroundColor: Colors.white,
        body: Container(
          margin: EdgeInsets.all(25),
          child: SingleChildScrollView(
              child: Center(
                  child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset("./assets/money.jpg",
                  height: 200, colorBlendMode: BlendMode.colorBurn),
              TextField(
                onChanged: ((value) => billAmount = double.parse(value)),
                decoration: const InputDecoration(hintText: "Bill Amount"),
                keyboardType: TextInputType.number,
                style: const TextStyle(
                    fontSize: 20,
                    fontFamily: "EduQLDBeginner",
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  const Text(
                    "Tip % :",
                    style: TextStyle(
                        fontFamily: "EduQLDBeginner",
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: (() {
                      if (tipPercentage > 1) {
                        setState(() {
                          tipPercentage -= 1;
                        });
                      }
                    }),
                    child: const Icon(Icons.remove_circle),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    "${tipPercentage} %",
                    style: const TextStyle(
                        fontSize: 20,
                        fontFamily: "EduQLDBeginner",
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  GestureDetector(
                    onTap: (() {
                      setState(() {
                        tipPercentage += 1;
                      });
                    }),
                    child: const Icon(Icons.add_circle),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  const Text("People :",
                      style: TextStyle(
                          fontFamily: "EduQLDBeginner",
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  Spacer(),
                  GestureDetector(
                    onTap: (() {
                      if (people > 1) {
                        setState(() {
                          people -= 1;
                        });
                      }
                    }),
                    child: const Icon(Icons.remove_circle),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    "${people} %",
                    style: const TextStyle(
                        fontSize: 20,
                        fontFamily: "EduQLDBeginner",
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  GestureDetector(
                    onTap: (() {
                      setState(() {
                        people += 1;
                      });
                    }),
                    child: const Icon(Icons.add_circle),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () => {print("Pressed"), calculate()},
                child: Container(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                    child: const Text(
                      "Calculate",
                      style: TextStyle(fontSize: 17, color: Colors.white),
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              tipAmount == 0 && totalAmount == 0
                  ? const Text(
                      "Please insert value...",
                      style: TextStyle(
                        fontFamily: 'EduQLDBeginner',
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    )
                  : Container(),
              tipAmount != 0
                  ? Text(
                      tipText,
                      style: const TextStyle(
                        fontFamily: 'EduQLDBeginner',
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    )
                  : Container(),
              SizedBox(
                height: 20,
              ),
              totalAmount != 0
                  ? Text(
                      totalText,
                      style: const TextStyle(
                          fontFamily: 'EduQLDBeginner',
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    )
                  : Container()
            ],
          ))),
        ));
  }
}
