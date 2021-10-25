import 'package:courier_service/orderdetail.dart';
import 'package:flutter/material.dart';
import 'package:courier_service/orderdetail.dart';

class order extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<order> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text('courier management'),
        ),
        drawer: Drawer(
            child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green,
              ),
              accountName: Text("Boby dhorajiya"),
              accountEmail: Text("dhorajiyaboby8@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  "B",
                  style: (TextStyle(
                    fontSize: 40.0,
                    color: Colors.green,
                  )),
                ),
              ),
            ),
            ListTile(
                leading: Icon(Icons.add),
                title: Text('place order'),
                onTap: () {
                  Navigator.pushReplacementNamed(context, 'orderdetail');
                }),
            ListTile(
                leading: Icon(Icons.edit),
                title: Text('modify order'),
                onTap: () {}),
            ListTile(
                leading: Icon(Icons.payment),
                title: Text('payment'),
                onTap: () {}),
          ],
        )));
  }
}
