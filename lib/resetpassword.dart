import 'package:courier_service/authentication.dart';
import 'package:courier_service/main.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:courier_service/authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: resetpassword(),
  ));
}

class resetpassword extends StatefulWidget {
  @override
  resetpass createState() => resetpass();
}

class resetpass extends State<resetpassword> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Reset Password'), backgroundColor: Colors.green),
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
                    height: 50,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: RaisedButton(
                        textColor: Colors.white,
                        color: Colors.green,
                        child: Text('Send Request'),
                        onPressed: () {
                          setState(() {
                            Future<void> resetPassword(String email) async {
                              FirebaseAuth _auth = FirebaseAuth.instance;
                              await _auth.sendPasswordResetEmail(email: email);
                            }
                          });
                        })),
              ],
            )));
  }
}
