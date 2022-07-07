import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  FormScreen({Key? key}) : super(key: key);

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  String _title = "Flutter Form";

  String? _name;
  String? _email;
  String? _password;
  String? _url;
  String? phonenumber;
  String? Calorie;

  FocusNode nodeOne = FocusNode();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildName() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Name"),
      validator: (String? value) {
        if (value != null && value.isEmpty) {
          return "Name is Required";
        }
        return null;
      },
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 25),
      textCapitalization: TextCapitalization.characters,
      onSaved: (name) {
        _name = name;
      },
    );
  }

  Widget _buildEmail() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Email"),
      validator: (String? value) {
        if (value != null && value.isEmpty) {
          return "Email is Required";
        }
        bool emailValid = RegExp(
                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(value!);

        if (!emailValid) {
          return "Enter Valid Email";
        }
        return null;
      },
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 25),
      textCapitalization: TextCapitalization.characters,
      onSaved: (name) {
        _name = name;
      },
    );
  }

  Widget _buildPassword() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Password"),
      validator: (String? value) {
        if (value != null && value.isEmpty) {
          return "Password is Required";
        }
        return null;
      },
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 25,
      ),
      textCapitalization: TextCapitalization.characters,
      onSaved: (name) {
        _name = name;
      },
      obscureText: true,
    );
  }

  Widget _buildURL() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "URL"),
      validator: (String? value) {
        if (value != null && value.isEmpty) {
          return "URL is Required";
        }
        return null;
      },
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 25,
      ),
      textCapitalization: TextCapitalization.characters,
      onSaved: (name) {
        _name = name;
      },
      focusNode: nodeOne,
    );
  }

  Widget _buildPhoneNumber() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Phone Number"),
      validator: (String? value) {
        if (value != null && value.isEmpty) {
          return "Phone Number is Required";
        }
        return null;
      },
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 25,
      ),
      textCapitalization: TextCapitalization.characters,
      onSaved: (name) {
        _name = name;
      },
      keyboardType: TextInputType.number,
    );
  }

  Widget _buildCalorie() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Calorie"),
      validator: (String? value) {
        if (value != null && value.isEmpty) {
          return "Calorie is Required";
        }
        return null;
      },
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 25,
      ),
      textCapitalization: TextCapitalization.characters,
      onSaved: (name) {
        _name = name;
      },
      keyboardType: TextInputType.number,
    );
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    return Scaffold(
        appBar: AppBar(
          title: Text(_title),
          excludeHeaderSemantics: true,
        ),
        body: Container(
          margin: EdgeInsets.all(22),
          child: Form(
            key: _formKey,
            child: Center(
                child: SingleChildScrollView(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                  _buildName(),
                  _buildEmail(),
                  _buildPassword(),
                  _buildURL(),
                  _buildPhoneNumber(),
                  _buildCalorie(),
                  const SizedBox(height: 100),
                  ElevatedButton(
                    style: style,
                    onPressed: () {
                      if (!_formKey.currentState!.validate()) {
                        return;
                      }

                      _formKey.currentState!.save();

                      print(_name);
                    },
                    child: const Text(
                      'Enabled',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ]))),
          ),
        ));
  }
}
