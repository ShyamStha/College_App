import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:patancollege/screens/home.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:fluttertoast/fluttertoast.dart';

final GoogleSignIn googleSignIn = GoogleSignIn();

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool showSpinner = false;
  final formKey = GlobalKey<FormState>();
  validateFormAndSave() {
    if (formKey.currentState.validate()) {
      print('Validation Success!!');
    } else {
      print('failed');
    }
  }

  String email;
  String password;

  FirebaseAuth _auth = FirebaseAuth.instance;

  bool isAuth = false;
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  Future<FirebaseUser> _signInGoogle() async {
    GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;
    AuthCredential credential = GoogleAuthProvider.getCredential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);

    final FirebaseUser firebaseuser =
        (await firebaseAuth.signInWithCredential(credential)).user;

    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) => HomePage()));
  }

  Widget buildAuthScreen() {
    return Text('Authenticated');
  }

  Scaffold buildUnAuthScreen() {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Form(
          key: formKey,
          child: Container(
            padding: EdgeInsets.only(left: 20.0, right: 15.0),
            height: double.infinity,
            decoration: BoxDecoration(
              // color: Colors.pink,
              gradient: LinearGradient(colors: [
                Colors.purple[900],
                Colors.blue,
              ]),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  validator: (val) => val.length == 0 ? 'Enter Email' : null,
                  onChanged: (value) {
                    email = value;
                  },
                  decoration: InputDecoration(
                    icon: Icon(
                      FontAwesomeIcons.envelope,
                      color: Colors.white,
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Enter your email',
                  ),
                ),
                SizedBox(height: 30.0),
                TextFormField(
                  validator: (val) => val.length == 0 ? 'Enter Password' : null,
                  obscureText: true,
                  onChanged: (value) {
                    password = value;
                  },
                  decoration: InputDecoration(
                    icon: Icon(
                      FontAwesomeIcons.lock,
                      color: Colors.white,
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(),
                    hintText: 'Enter your password',
                  ),
                ),
                SizedBox(height: 30.0),
                RaisedButton(
                    child: Text('Login'),
                    color: Colors.white,
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                    ),
                    onPressed: () async {
                      validateFormAndSave();
                      setState(() {
                        showSpinner = true;
                      });
                      try {
                        final newUser = await _auth.signInWithEmailAndPassword(
                            email: email, password: password);
                        if (newUser != null) {
                          Navigator.pushNamed(context, '/noticeboard');
                        }
                        Fluttertoast.showToast(
                            msg: "LogIn Successful",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.TOP,
                            // timeInSecForIosWeb: 1,for ios only
                            backgroundColor: Colors.white,
                            textColor: Colors.black,
                            fontSize: 16.0);
                        setState(() {
                          showSpinner = false;
                        });
                      } catch (e) {
                        print(e);
                      }
                    }),
                SizedBox(height: 15.0),
                Text(
                  'OR',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                      fontFamily: 'Lobster Two'),
                ),
                SizedBox(height: 15.0),
                Container(
                  height: 45.0,
                  width: 300.0,
                  child: GestureDetector(
                    child: Image.asset('assets/google.png'),
                    onTap: () async {
                      setState(() {
                        showSpinner = true;
                      });
                      final user = await _signInGoogle();
                      Fluttertoast.showToast(
                          msg: "Google SignedIn Successfully!!!",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.TOP,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.white,
                          textColor: Colors.black,
                          fontSize: 16.0);
                      setState(() {
                        showSpinner = false;
                      });
                    },
                  ),
                ),
                SizedBox(height: 15.0),
                Row(
                  children: <Widget>[
                    Text(
                      'Don\'t have account??',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                    SizedBox(width: 10),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/register');
                        print('ok');
                      },
                      child: Text(
                        'RegisterHere',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.yellow,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return isAuth ? buildAuthScreen() : buildUnAuthScreen();
  }
}
