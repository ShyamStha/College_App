import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class News extends StatefulWidget {
  final image;
  News({this.image});
  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  singleCard(heading, news, date) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(60.0),
      child: Card(
        child: Row(
          children: <Widget>[
            // CircleAvatar(
            //   backgroundColor: Colors.white,
            //   radius: 30.0,

            //  child: Icon(FontAwesomeIcons.newspaper,
            //  size: 40.0
            //  ),
            // ),
            Expanded(
              child: Column(
                children: <Widget>[
                  Text(
                    heading,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                    ),
                  ),
                  Text(
                    news,
                    style: TextStyle(
                      fontFamily: 'Handlee',
                      fontSize: 18.0,
                    ),
                  ),
                  Text(
                    date,
                    style: TextStyle(color: Colors.blue),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Appbar'),
        centerTitle: true,
        backgroundColor: Colors.purple[900],
      ),
      body: Column(
        children: <Widget>[
          StreamBuilder(
              stream: Firestore.instance
                  .collection('news')
                  .orderBy('clock', descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                return Expanded(
                  child: ListView.builder(
                      itemCount: snapshot.data.documents.length,
                      itemBuilder: (context, index) {
                        DocumentSnapshot ds = snapshot.data.documents[index];

                        return singleCard(
                            ds['heading'], ds['news'], ds['clock'].toString());
                      }),
                );
              })
        ],
      ),
    );
  }
}
