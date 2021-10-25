import 'package:courier_service/authentication.dart';
import 'package:courier_service/main.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: login(),
  ));
}

class login extends StatefulWidget {
  @override
  loginpage createState() => loginpage();
}

class loginpage extends State<login> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _pass = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('courier management'), backgroundColor: Colors.green),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'EASY2FAST',
                      style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )),
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      '',
                      style: TextStyle(fontSize: 20),
                    )),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                    controller: _name,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter valid username';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      icon: const Icon(Icons.person),
                      labelText: 'USER NAME',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  child: TextFormField(
                    controller: _email,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter valid email';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      icon: const Icon(Icons.mail),
                      labelText: 'EMAIL',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextFormField(
                    controller: _pass,
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter correct email';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      icon: const Icon(Icons.password),
                      labelText: 'Password',
                    ),
                  ),
                ),
                Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: RaisedButton(
                        textColor: Colors.white,
                        color: Colors.green,
                        child: Text('REGISTER'),
                        onPressed: () {
                          if (_name.text.isNotEmpty &&
                              _email.text.isNotEmpty &&
                              _pass.text.isNotEmpty) {
                            setState(() {
                              isLoading = true;
                            });
                            createAccount(_name.text, _email.text, _pass.text)
                                .then((user) {
                              if (user != null) {
                                setState(() {
                                  isLoading = false;
                                });
                                print("Register successfull");
                                Navigator.pushNamed(context, 'first');
                              }
                            });
                          } else {
                            print("please enter fields");
                          }
                        })),
                Container(
                    child: Row(
                  children: <Widget>[
                    Text(''),
                    FlatButton(
                      textColor: Colors.green,
                      child: Text(
                        'Sign In',
                        style: TextStyle(fontSize: 17),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, 'first');
                      },
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ))
              ],
            )));
  }
}
