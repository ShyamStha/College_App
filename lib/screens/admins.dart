import 'package:flutter/material.dart';

class Admin extends StatefulWidget {
  @override
  _AdminState createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(backgroundColor: Colors.black54),
        // backgroundColor: Colors.grey,
        body: Column(
      children: <Widget>[
        SizedBox(
          height: 50,
        ),
        CircleAvatar(
          backgroundImage: AssetImage("assets/sth.jpg"),
          radius: 60,
        ),
        Container(
          height: 50,
          child: Card(
            child: Row(
              children: <Widget>[
                Text("Name:"),
                Text(
                  "Santosh Thapa",
                  style: TextStyle(fontSize: 20),
                )
              ],
            ),
          ),
        ),
        Container(
          height: 50,
          child: Card(
            child: Row(
              children: <Widget>[
                Text("Level:"),
                Text(
                  "Bachelor",
                  style: TextStyle(fontSize: 20),
                )
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
