import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Gallery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    singleCard(image) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Card(
          child: Column(
            children: <Widget>[
              Image.asset(image),
              SizedBox(height:20.0),
              Image.asset(image),
              Image.asset(image),
              Image.asset(image),
              Image.asset(image),
              Image.asset(image),
              Image.asset(image),
              Image.asset(image),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      body: new Column(
        children: [
          StreamBuilder(
              stream: Firestore.instance.collection('images').snapshots(),
              builder: (context, snapshot) {
                return Expanded(
                  child: ListView.builder(
                      itemCount: snapshot.data.documents.length,
                      itemBuilder: (context, index) {
                        DocumentSnapshot ds = snapshot.data.documents[index];
                        // return Image.asset(ds['image'].toString());
                        return singleCard(ds['image'].toString());
                      }),
                );
              })
        ],
      ),
    );
  }
}
