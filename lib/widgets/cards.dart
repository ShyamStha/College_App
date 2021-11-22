import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:patancollege/screens/notice_details.dart';

class Cards extends StatefulWidget {
  @override
  _CardsState createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  Widget singleCard(date, time, day, topic, hiddenTime, title) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: Card(
        elevation: 0.5,
        child: Column(
          children: <Widget>[
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                //  Text(date),
                Expanded(
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '$date ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Time:$time',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ],
                  ),
                ),

                Expanded(
                  child: Column(
                    children: [
                      Text(
                        topic,
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 16.0,
                        ),
                      ),
                      Opacity(
                        opacity: 0.0,
                        child: Text(
                          hiddenTime,
                          style: TextStyle(
                            fontSize: 2.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                //  Text(date),
                Expanded(
                  child: Text(
                    day,
                    style: TextStyle(
                      color: Colors.purple,
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                    ),
                  ),
                ),
                Expanded(
                    child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 13.0,
                  ),
                )),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          //imagecarousel,
          //from here we take data to mobile screen not sending ok
          StreamBuilder(
              stream: Firestore.instance
                  .collection('task')
                  .orderBy('hiddenTime', descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                return Expanded(
                  child: ListView.builder(
                      itemCount: snapshot.data.documents.length,
                      itemBuilder: (context, index) {
                        DocumentSnapshot ds = snapshot.data.documents[index];
                        return InkWell(
                          onTap: () {
                            print('I am pressed');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NoticeBoard(
                                        text: ds['title'],
                                        topic: ds['topic'],
                                        day: ds['day'],
                                        date: ds['date'],
                                      )),
                            );
                          },
                          child: singleCard(
                            ds['date'].toString(),
                            ds['time'].toString(),
                            ds['day'].toString(),
                            ds['topic'].toString(),
                            ds['hiddenTime'].toString(),
                            ds['title'].toString(),
                          ),
                        );
                      }),
                );
              })
        ],
      ),
    );
  }
}
