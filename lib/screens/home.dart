import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:patancollege/widgets/cards.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'news.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool showSpinner = false;
  GoogleSignIn googleSignIn = GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    Widget imagecarousel = Container(
      height: 200.0,
      child: Carousel(
        boxFit: BoxFit.fill,
        images: [
          AssetImage('assets/mira.jpg'),
          AssetImage('assets/mira.jpg'),
          AssetImage('assets/mira.jpg'),
          AssetImage('assets/mira.jpg'),
          AssetImage('assets/mira.jpg'),
          AssetImage('assets/mira.jpg'),
          AssetImage('assets/mira.jpg'),
        ],
        animationCurve: Curves.fastOutSlowIn,
        dotColor: Colors.purple,
        dotSpacing: 30.0,
        dotSize: 6.0,
        indicatorBgPadding: 1.0,
        borderRadius: true,
        moveIndicatorFromBottom: 180.0,
        overlayShadow: true,
      ),
    );
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.purple[900],
      //   title: Text(
      //     'Patan Campus',
      //     style: TextStyle(fontSize: 30.0, fontFamily: 'Lobster Two'),
      //   ),
      //   centerTitle: true,
      // ),
      backgroundColor: Colors.white,
      drawer: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Drawer(
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text(
                  'PATAN MULTIPLE CAMPUS',
                  style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: 'Handlee',
                      fontWeight: FontWeight.bold),
                ),
                accountEmail: Text(
                  'pmc.edu.np',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
                currentAccountPicture: GestureDetector(
                  child: CircleAvatar(
                    radius: 30.0,
                    backgroundImage: AssetImage('assets/patan.jpg'),
                    backgroundColor: Colors.purple[600],
                  ),
                ),
                decoration: BoxDecoration(
                    color: Colors.lightBlue.shade700,
                    gradient: LinearGradient(colors: [
                      Colors.purple[600],
                      Colors.purple,
                    ])),
              ),
              Ink(
                onPressed: () async {
                  setState(() {
                    showSpinner = true;
                  });
                  await Navigator.pushNamed(context, '/noticeboard');
                  setState(() {
                    showSpinner = false;
                  });
                },
                title: Text('Notice Board'),
                icon: Icon(
                  FontAwesomeIcons.thumbtack,
                  color: Colors.red[600],
                ),
              ),
              Ink(
                onPressed: () async {
                  setState(() {
                    showSpinner = true;
                  });
                  await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => News()),
                  );
                  setState(() {
                    showSpinner = false;
                  });
                },
                title: Text('News'),
                icon: Icon(
                  FontAwesomeIcons.newspaper,
                  color: Colors.grey,
                ),
              ),
              Ink(
                onPressed: () {},
                title: Text('Downloads'),
                icon: Icon(
                  FontAwesomeIcons.download,
                  color: Colors.lightBlue,
                ),
              ),
              Ink(
                onPressed: () async {
                  setState(() {
                    showSpinner = true;
                  });

                  await Navigator.pushNamed(context, '/gallery');

                  setState(() {
                    showSpinner = false;
                  });
                },
                title: Text('Gallery'),
                icon: Icon(
                  FontAwesomeIcons.images,
                  color: Colors.red,
                ),
              ),
              Ink(
                onPressed: () async {
                  setState(() {
                    showSpinner = true;
                  });
                  await Navigator.pushNamed(context, '/contacts');

                  setState(() {
                    showSpinner = false;
                  });
                },
                title: Text('Contacts'),
                icon: Icon(
                  FontAwesomeIcons.phone,
                  color: Colors.green,
                ),
              ),
              Ink(
                onPressed: () async {
                  setState(() {
                    showSpinner = true;
                  });

                  await Navigator.pushNamed(context, '/calender');

                  setState(() {
                    showSpinner = false;
                  });
                },
                title: Text(
                  'Calender/Events',
                ),
                icon: Icon(
                  FontAwesomeIcons.calendarAlt,
                  color: Colors.orange,
                ),
              ),
              Ink(
                onPressed: () async {
                  setState(() {
                    showSpinner = true;
                  });

                  await Navigator.pushNamed(context, '/staff');

                  setState(() {
                    showSpinner = false;
                  });
                },
                title: Text(
                  'Staff Directory',
                ),
                icon: Icon(
                  FontAwesomeIcons.userPlus,
                  color: Colors.pink,
                ),
              ),
              Ink(
                onPressed: () async {
                  setState(() {
                    showSpinner = true;
                  });

                  await Navigator.pushNamed(context, '/resources');

                  setState(() {
                    showSpinner = false;
                  });
                },
                title: Text(
                  'Resources',
                ),
                icon: Icon(
                  FontAwesomeIcons.folder,
                  color: Colors.yellow[800],
                ),
              ),
              Ink(
                onPressed: () async {
                  setState(() {
                    showSpinner = true;
                  });

                  await Navigator.pushNamed(context, '/aboutus');
                  setState(() {
                    showSpinner = false;
                  });
                },
                title: Text('AboutUs'),
                icon: Icon(
                  FontAwesomeIcons.addressBook,
                  color: Colors.black87,
                ),
              ),
              Divider(
                color: Colors.pink,
              ),
              Ink(
                onPressed: () async {
                  setState(() {
                    showSpinner = true;
                  });

                  await Navigator.pushNamed(context, '/admins');
                  setState(() {
                    showSpinner = false;
                  });
                },
                title: Text('Developers Profile'),
                icon: Icon(FontAwesomeIcons.users),
              ),
              Ink(
                onPressed: () async {
                  setState(() {
                    showSpinner = true;
                  });
                  await googleSignIn.signOut();
                  await Navigator.pushNamed(context, '/login');
                  setState(() {
                    showSpinner = false;
                  });
                },
                title: Text('Logout'),
                icon: Icon(
                  FontAwesomeIcons.signOutAlt,
                  color: Colors.brown,
                ),
              ),
            ],
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 250.0,
            centerTitle: true,
            backgroundColor: Colors.purple[900],
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'Notice',
                style: TextStyle(
                  fontFamily: 'Handlee',
                  fontSize: 25.0,
                ),
              ),
              background: imagecarousel,
            ),
          ),
          SliverFillRemaining(
            child: Cards(),
          ),
        ],
      ),
    );
  }
}

//I have done refactoring here so that code will be DRY
class Ink extends StatelessWidget {
  final Function onPressed;
  final Widget title;
  final Widget icon;
  Ink({@required this.onPressed, this.title, this.icon});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: ListTile(
        title: title,
        leading: icon,
      ),
    );
  }
}
