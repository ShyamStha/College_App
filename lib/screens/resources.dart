import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Resources extends StatefulWidget {
  @override
  _ResourcesState createState() => _ResourcesState();
}

class _ResourcesState extends State<Resources> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resources'),
        backgroundColor: Colors.purple[900],
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          Card(
            child: InkWell(
              onTap: _launchURL1,
              child: ListTile(
                leading: Icon(Icons.wb_iridescent),
                title: Text(
                  'About the Patan Multiple Campus...',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                  ),
                ),
              ),
            ),
            
          ),
          Card(
            child: InkWell(
              onTap: _launchURL2,
              child: ListTile(
                leading: Icon(Icons.wb_iridescent),
                title: Text(
                  'Auality and affordability!!Patan Multple Campus..',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _launchURL1() async {
    const url = 'https://edusanjal.com/college/patan-multiple-campus/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchURL2() async {
    const url = 'https://www.youtube.com/watch?v=1yBIJD4Tw3A';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
