import 'package:flutter/material.dart';
import 'package:patancollege/screens/aboutus.dart';
import 'package:patancollege/screens/calenders.dart';
import 'package:patancollege/screens/contacts.dart';
import 'package:patancollege/screens/gallery.dart';
import 'package:patancollege/screens/home.dart';
import 'package:patancollege/screens/login.dart';
import 'package:patancollege/screens/map_screen.dart';
import 'package:patancollege/screens/register.dart';
import 'package:patancollege/screens/resources.dart';
import 'package:patancollege/screens/staff_details.dart';
import 'package:shimmer/shimmer.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:patancollege/screens/news.dart';

import 'screens/admins.dart';
import 'screens/welcome_screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) => Splash(),
      '/noticeboard': (context) => HomePage(),
      '/gallery': (context) => Gallery(),
      '/contacts': (context) => Contacts(),
      '/about': (context) => About(),
      '/register': (context) => Register(),
      '/login': (context) => Login(),
      '/aboutus': (context) => About(),
      '/welcome': (context) => Welcome(),
      '/calender': (context) => Calender(),
      '/staff': (context) => Staff(),
      '/map': (context) => Mapscreen(),
      '/news': (context) => News(),
      '/resources': (context) => Resources(),
      '/admins': (context) => Admin(),
    },
  ));
}

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  final FirebaseMessaging _messaging = FirebaseMessaging();
  @override
  void initState() {
    super.initState();
    _mockCheckForSession().then((status) {
      if (status) {
        _navigateToLogIn();
      }
    });
    _messaging.getToken().then((token) {
      print(token);
    });
  }

  Future<bool> _mockCheckForSession() async {
    await Future.delayed(Duration(milliseconds: 5000), () {});
    return true;
  }

  void _navigateToLogIn() async {
    Navigator.pushNamed(context, '/welcome');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Colors.white,
          Colors.white24,
        ])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //Image.asset('assets/patan.jpg'),

            Shimmer.fromColors(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Text(
                        'WELCOME TO',
                        style: TextStyle(fontSize: 50.0, shadows: <Shadow>[
                          Shadow(
                            blurRadius: 18.0,
                            color: Colors.black,
                            offset: Offset.fromDirection(120, 12),
                          ),
                        ]),
                      ),
                      SizedBox(height: 30.0),
                      Text(
                        'PATAN CAMPUS',
                        style: TextStyle(fontSize: 40.0, shadows: <Shadow>[
                          Shadow(
                            blurRadius: 18.0,
                            color: Colors.red,
                            offset: Offset.fromDirection(100, 20),
                          ),
                        ]),
                      ),
                    ],
                  ),
                ),
                baseColor: Colors.red,
                highlightColor: Colors.pink)
          ],
        ),
      ),
    );
  }
}
