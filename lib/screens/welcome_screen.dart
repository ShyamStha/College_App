import 'package:flutter/material.dart';
import 'package:patancollege/screens/login.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Stack(
          children: <Widget>[
            Image.asset(
              'assets/mira.jpg',
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 450.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black.withOpacity(1),
                        Colors.black.withOpacity(0.9),
                        Colors.black.withOpacity(0.8),
                        Colors.black.withOpacity(0.7),
                        Colors.black.withOpacity(0.6),
                        Colors.black.withOpacity(0.5),
                        Colors.black.withOpacity(0.4),
                        Colors.black.withOpacity(0.1),
                        Colors.black.withOpacity(0.001),
                        Colors.black.withOpacity(0.001),
                      ]),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  'Welcome Here!!!',
                  textAlign: TextAlign.center,
                  textScaleFactor: 1,
                  style: TextStyle(
                    fontSize: 80.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Lobster Two',
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Patan Campus Welcomes You',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 40.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Handlee'),
                ),
                SizedBox(height: 20.0),
                Text(
                  'Stay Updated',
                  style: TextStyle(
                    color: Colors.pink,
                    fontFamily: 'Handlee',
                    fontSize: 45.0,
                  ),
                ),
                SizedBox(height: 10.0),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: GestureDetector(
                    onTap: () async {
                      setState(() {
                        showSpinner = true;
                      });
                      await Navigator.push(
                          context, MaterialPageRoute(builder: (_) => Login()));
                      setState(() {
                        showSpinner = false;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.pink,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 50.0),
              ],
            )
          ],
        ),
      ),
    );
  }
}
