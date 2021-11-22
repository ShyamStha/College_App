import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Staff extends StatefulWidget {
  @override
  _StaffState createState() => _StaffState();
}

class _StaffState extends State<Staff> {
  List<int> num = [
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20,
  ];
  List<String> names = [
    'Ram',
    'Shyam',
    'Laxman',
    'Krishna',
    'Mahesh',
    'Ram',
    'Shyam',
    'Laxman',
    'Krishna',
    'Mahesh',
    'Ram',
    'Shyam',
    'Laxman',
    'Krishna',
    'Mahesh',
    'Ram',
    'Shyam',
    'Laxman',
    'Krishna',
    'Mahesh'
  ];
  List<int> contacts = [
    9861170211,
    9849757073,
    9813647136,
    9841488053,
    9863625874,
    9861170211,
    9849757073,
    9813647136,
    9841488053,
    9863625874,
    9861170211,
    9849757073,
    9813647136,
    9841488053,
    9863625874,
    9861170211,
    9849757073,
    9813647136,
    9841488053,
    9863625874,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.purple,
        title: Text(
          'Staff Directory',
          style: TextStyle(
            fontFamily: 'Lobster Two',
            fontSize: 30.0,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: num.length,
        itemBuilder: (BuildContext context, index) {
          return ListTile(
            leading: Text(
              num[index].toString(),
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            title: Text(
              names[index],
              style: TextStyle(
                fontFamily: 'Handlee',
                fontSize: 20.0,
              ),
            ),
            trailing: InkWell(
              onTap: () {
                launch('tel:${contacts[index].toString()}');
              },
              child: Text(
                contacts[index].toString(),
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
