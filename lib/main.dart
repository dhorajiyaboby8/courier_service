import 'package:courier_service/card.dart';
import 'package:courier_service/existing_card.dart';
import 'package:courier_service/order.dart';
import 'package:courier_service/orderdetail.dart';
import 'package:courier_service/orderdetail2.dart';
import 'package:courier_service/paypal.dart';
import 'package:courier_service/resetpassword.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:courier_service/login.dart';
import 'package:courier_service/authentication.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
    initialRoute: 'orderdetail',
    routes: {
      'first': (context) => MyApp(),
      'login': (context) => login(),
      'order': (context) => order(),
      'orderdetail': (context) => orderdetail(),
      'orderdetail2': (context) => orderdetail2(),
      'resetpassword': (context) => resetpassword(),
    },
  ));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MyApp> {
  bool isLoading = false;
  TextEditingController _email = TextEditingController();
  TextEditingController _pass = TextEditingController();

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
                    controller: _email,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return null;
                      } else
                        return 'email cannot be empty';
                    },
                    decoration: InputDecoration(
                      icon: const Icon(Icons.person),
                      labelText: 'User Name',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextFormField(
                    obscureText: true,
                    controller: _pass,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return null;
                      } else
                        return 'password cannot be empty';
                    },
                    decoration: InputDecoration(
                      icon: const Icon(Icons.password),
                      labelText: 'Password',
                    ),
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'resetpassword');
                  },
                  textColor: Colors.green,
                  child: Text('Forgot your Password ?'),
                ),
                Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: RaisedButton(
                        textColor: Colors.white,
                        color: Colors.green,
                        child: Text('Login'),
                        onPressed: () {
                          if (_email.text.isNotEmpty && _pass.text.isNotEmpty) {
                            setState(() {
                              isLoading = true;
                            });
                            signin(_email.text, _pass.text).then((user) {
                              if (user != null) {
                                setState(() {
                                  isLoading = false;
                                });
                                print("Login successfull");
                              }
                            });
                          } else {
                            print("please enter fields");
                          }
                        })),
                Container(
                    child: Row(
                  children: <Widget>[
                    Text('Dont have account?'),
                    FlatButton(
                      textColor: Colors.green,
                      child: Text(
                        'Sign Up',
                        style: TextStyle(fontSize: 15),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, 'login');
                      },
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ))
              ],
            )));
  }
}
