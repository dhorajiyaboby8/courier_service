import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

Future main() async {
  const appTitle = 'ORDER DETAIL';
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  return MaterialApp(
    title: appTitle,
    home: Scaffold(
      appBar: AppBar(
        title: const Text(appTitle),
        backgroundColor: Colors.green,
      ),
      body: orderdetail(),
    ),
  );
}

class orderdetail extends StatefulWidget {
  orderdetail({Key? key}) : super(key: key);

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<orderdetail> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _dateController = TextEditingController();
  TextEditingController _name = TextEditingController();
  TextEditingController _number = TextEditingController();
  TextEditingController _enumber = TextEditingController();
  TextEditingController _add = TextEditingController();
  TextEditingController _address = TextEditingController();
  TextEditingController _pincode = TextEditingController();
  TextEditingController _city = TextEditingController();
  TextEditingController _state = TextEditingController();

  int maxlength = 10;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
              controller: _name,
              cursorHeight: 20,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter proper name';
                }
                return null;
              },
              decoration: InputDecoration(
                icon: const Icon(Icons.person),
                labelText: 'Buyer Name *',
              )),
          TextFormField(
              controller: _number,
              cursorHeight: 20,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter valid mobile';
                }
                return null;
              },
              decoration: InputDecoration(
                icon: const Icon(Icons.phone),
                labelText: 'Buyer Mobile *',
              )),
          TextFormField(
              controller: _enumber,
              cursorHeight: 20,
              decoration: InputDecoration(
                icon: const Icon(Icons.phone),
                labelText: 'Alternate Mobile',
              )),
          TextFormField(
            controller: _add,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter valid address';
              }
              return null;
            },
            decoration: InputDecoration(
              icon: const Icon(Icons.home),
              labelText: "Address Line 1 *",
            ),
          ),
          TextFormField(
            controller: _address,
            decoration: InputDecoration(
              icon: const Icon(Icons.home),
              labelText: "Address Line 2",
            ),
          ),
          TextFormField(
            controller: _pincode,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter valid pincode';
              }
              return null;
            },
            decoration: InputDecoration(
              icon: const Icon(Icons.home),
              labelText: "pincode *",
            ),
          ),
          TextFormField(
            controller: _city,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter city name';
              }
              return null;
            },
            decoration: InputDecoration(
              icon: const Icon(Icons.home),
              labelText: "city *",
            ),
          ),
          TextFormField(
            controller: _state,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter proper state name';
              }
              return null;
            },
            decoration: InputDecoration(
              icon: const Icon(Icons.home),
              labelText: "State*",
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              // ignore: prefer_const_constructors
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.green)),
              onPressed: () {
                Map<String, dynamic> data = {
                  "field 1": _name.text,
                  "field 2": _number.text,
                  "field 3": _enumber.text,
                  "field 4": _add.text,
                  "field 5": _address.text,
                  "field 6": _pincode.text,
                  "field 7": _city.text,
                  "field 8": _state.text,
                };
                FirebaseFirestore.instance.collection("test").add(data);
                if (_formKey.currentState!.validate()) {
                  Navigator.pushNamed(context, 'orderdetail2');
                }
              },
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}
