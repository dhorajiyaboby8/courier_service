import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class orderdetail2 extends StatelessWidget {
  const orderdetail2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appTitle = 'ORDER DETAIL';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
          backgroundColor: Colors.green,
        ),
        body: MyCustomForm(),
      ),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  MyCustomForm({Key? key}) : super(key: key);

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _dateController = TextEditingController();

  DateTime selectedDate = DateTime.now();
  int maxlength = 10;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
              cursorHeight: 20,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'enter invoice number';
                }
                return null;
              },
              decoration: InputDecoration(
                icon: const Icon(Icons.person),
                labelText: 'Invoice Number',
              )),
          TextFormField(
            cursorHeight: 20,
            decoration: InputDecoration(
              icon: const Icon(Icons.date_range),
              labelText: 'DD/MM/YYYY',
            ),
            onTap: () async {
              DateTime date = DateTime(1900);
              FocusScope.of(context).requestFocus(new FocusNode());

              date = (await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2020),
                  lastDate: DateTime(2022)))!;

              _dateController.text = date.toIso8601String();
            },
          ),
          TextFormField(
              cursorHeight: 20,
              decoration: InputDecoration(
                icon: const Icon(Icons.portrait_rounded),
                labelText: 'product detail',
              )),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter valid address';
              }
              return null;
            },
            decoration: InputDecoration(
              icon: const Icon(Icons.countertops_rounded),
              labelText: "Quentity",
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
