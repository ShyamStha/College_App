import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'About Us',
          style: TextStyle(
            fontFamily: 'Lobster Two',
            fontSize: 30.0,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.purple[900],
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 20.0),
            margin: EdgeInsets.only(top: 20.0),
            child: Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: AssetImage('assets/patan.jpg'),
                  radius: 65.0,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      'Patan Campus',
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                    Text('Patan,Lalitpur'),
                    Text('9861170211'),
                    InkWell(
                      child: Text(
                        'http://pmc.edu.np',
                        style: TextStyle(
                            fontSize: 20.0,
                            decoration: TextDecoration.underline,
                            color: Colors.blue),
                      ),
                      onTap: _launchURL,
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          'GetLocation',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.0),
                        ),
                        IconButton(
                            icon: Icon(
                              FontAwesomeIcons.mapMarkerAlt,
                              size: 30.0,
                              color: Colors.blue,
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, '/map');
                            }),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          Card(
            child: Text(
              ''' Patan Multiple Campus is the only constituent campus of T.U in Lalitpur district, the second largest city in the valley. It was formally founded on 17th Bhadra, 2011 B.S, and it was then named as .  The college was inaugurated by the then crown prince His Majesty Mahendra Bir Bikram Shah on Bhadra 31, 2021 BS.
                      
                      Several educationists had tirelessly worked for the establishment of the college in Lalitpur district. They include: Prof. Mangal Raj Joshi, Prof. Asharam Shakya, Mr. Kamal Mani Dixit, Prof. Hem Raj Joshi, Mr. Indra Raj Mishra, Mr. Pradhumna Lal Joshi, Mr. Bhairab Bahadur Pradhan, Mr. Raj Bahadur Chipalu, and Laxmi Prasad Rimal.
                      
                      After the implementation of national education system, the Patan Inter College was renamed as Patan Multiple Campus on Shravan 1, 2030 BS. Since then the campus has been functioning as a constituent campus of the T.U. In accordance with the 2055 Decentralization Act of the TU, the campus has entered into decentralization since 2056 BS. Twenty-five students, including a girl, were at the Patan Inter College at the time of its foundation. However, as a result of the educational awareness in the people of Lalitpur, and also because of the efforts of the campus administration, now the campus is successful in conducting Bachelor and Degree level programmes in the Morning, Day and Evening shifts in Humanities, Science and Management. At present, 306 teachers and 116 employees are directly involved as the human resources for the smooth functioning of different level programmes.
                      
                      To the North of Patan Dhoka, the campus has had 47 Ropani, 6 Ana, 2 Paisa and 2 Dam plain land, considered as the historical treasure of the campus. Out of the land, the campus has already received the land ownership documents for 17 plots, and for the remaining 25 plots, totaling 33-8-0-1, the campus has made all necessary correspondence to the concerned authorities for the land ownership letter. However, till now the campus has not received any ownership letter. The campus has ceded some portion of its land because of the government's decision to expand the road to the North-East side from the campus wall, leading to Chakupat. Approximately, 1.5 meter land along the campus wall has got shrunk in the process of road expansion. The campus has another piece of land at Pulchok. The 10-6-2-0 area of land at Pulchok was donated by the queen Jagadamba. At present, LABIM Mall has been built in around the 190000 square feet of the same land. The Mall has been one of the income sources of campus.
                      
                       ''',
              style: TextStyle(
                fontFamily: 'Handlee',
                fontSize: 20.0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  _launchURL() async {
    const url = 'https://pmc.edu.np';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
