import 'package:flutter/material.dart';
import 'package:share/share.dart';

class NoticeBoard extends StatelessWidget {
  final String text;
  final String topic;
  final String day;
  final String date;

  NoticeBoard({this.text, this.topic, this.day, this.date});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple[900],
        onPressed: () {
          Share.share(
            // '$text'.substring(6, text.toString().length - 50),
            '$date $day $text from PATAN CAMPUS',
          );
        },
        child: Icon(Icons.share),
      ),
      appBar: AppBar(
        title: Text(
          topic,
          style: TextStyle(
              fontSize: 30.0,
              fontFamily: 'Handlee',
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.purple[900],
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: IconButton(
                icon: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(context);
                }),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Colors.purple,
          Colors.white,
        ])),
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              height: 80.0,
              width: double.infinity,
              //color: Colors.red,
              child: Text(
                topic,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 35.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  Container(
                    height: 50.0,
                    width: double.infinity,
                    // color: Colors.yellow,
                    child: Text(
                      day,
                      style: TextStyle(
                        fontSize: 43.0,
                      ),
                    ),
                  ),
                  SizedBox(height: 15.0),
                  Container(
                    height: 30.0,
                    width: double.infinity,
                    //color: Colors.lightBlue,
                    child: Text(
                      date,
                      style: TextStyle(
                        fontSize: 25.0,
                      ),
                    ),
                  ),
                  SizedBox(height: 40.0),
                  Container(
                    //alignment: Alignment.center,
                    padding: EdgeInsets.only(left: 20.0),
                    height: 300.0,
                    // color: Colors.orange,
                    child: Text(
                      text,
                      style: TextStyle(fontSize: 30.0, fontFamily: 'Handlee'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
