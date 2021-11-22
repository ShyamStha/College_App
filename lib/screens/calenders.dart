import 'package:flutter/material.dart';

class Calender extends StatefulWidget {
  @override
  _CalenderState createState() => _CalenderState();
}

class _CalenderState extends State<Calender> {
  @override
  Widget build(BuildContext context) {
    DateTime _dateTime = DateTime.now();
    String _dateText = '';
    Future<Null> selectDueDate(BuildContext context) async {
      final picked = await showDatePicker(
        context: context,
        initialDate: _dateTime,
        firstDate: DateTime(2018),
        lastDate: DateTime(2080),
      );
    }

    @override
    void initState() {
      // TODO: implement initState
      super.initState();
      _dateText = '${_dateTime.day}/${_dateTime.month}/${_dateTime.year}';
    }

    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            SizedBox(height: 40),
            Text(
              'Calender',
              style: TextStyle(
                fontSize: 100.0,
                color: Colors.purple,
                fontFamily: 'Lobster Two',
              ),
            ),
            SizedBox(height: 20.0),
            Container(
                child: Image.asset(
              'assets/calender.png',
              fit: BoxFit.cover,
            )),
            SizedBox(height: 40.0),
            OutlineButton(
              onPressed: () {
                selectDueDate(context);
              },
              child: Text(
                'ShowDate',
                style: TextStyle(fontSize: 22.0, color: Colors.purple),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0),
              ),
              borderSide: BorderSide(color: Colors.purple),
            ),
          ],
        ),
      ),
    );
  }
}
