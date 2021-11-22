import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class Contacts extends StatefulWidget {
  @override
  _ContactsState createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: ListTile(
        leading: Icon(Icons.contact_phone),
        title: Column(
          children: <Widget>[
            Text('Patan Campus'),
            Text('Patan'),
            Text('01-5549133'),
            Text('https://pmc.edu.np'),
            SizedBox(height: 30.0),
            Container(
              height: 60.0,
              child: Column(
                children: <Widget>[
                  Text('For more details...'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        'Contact Us',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          launch('tel://01-5549133');
                        },
                        child: Icon(
                          FontAwesomeIcons.phone,
                          color: Colors.green,
                          size: 30.0,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 400.0,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/patan.jpg')),
              ),
            ),
          ],
        ),
        trailing: Padding(
          padding: const EdgeInsets.only(bottom: 40.0),
          child: IconButton(
              icon: Icon(
                FontAwesomeIcons.arrowLeft,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
      ),
    ));
  }
}
