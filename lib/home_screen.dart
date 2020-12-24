import 'package:flutter/material.dart';
import 'package:Trimz/detail_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const stylistData = [
  {
    'stylistName': 'Karim Guedouz',
    'salonName': 'Trimz',
    'rating': '4.8',
    'rateAmount': '56',
    'imgUrl': 'assets/images/Karim.png',
    'bgColor': Color(0xffFFF0EB),
  },
  {
    'stylistName': 'Ilham Bennani',
    'salonName': 'Trimz',
    'rating': '4.7',
    'rateAmount': '80',
    'imgUrl': 'assets/images/ilham.PNG',
    'bgColor': Color(0xffEBF6FF),
  },
  {
    'stylistName': 'Nabil Gaada',
    'salonName': 'Trimz',
    'rating': '4.7',
    'rateAmount': '70',
    'imgUrl': 'assets/images/Nabil_gaada.png',
    'bgColor': Color(0xffFFF3EB),
  }
];

class HomeScreen extends StatefulWidget {
  final Function menuCallBack;

  HomeScreen({@required this.menuCallBack});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.0, vertical: 22.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              InkWell(
                  onTap: widget.menuCallBack,
                  child: Icon(FontAwesomeIcons.bars)),
              Column(
                children: [
                  Text(
                    'Emplacement',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18.0,
                      color: Theme.of(context).primaryColor.withOpacity(0.4),
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.mapMarkerAlt,
                        color: Theme.of(context).primaryColor,
                      ),
                      SizedBox(
                        width: 8.0,
                      ),
                      Text(
                        'Casablanca,',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 22.0,
                        ),
                      ),
                      Text(
                        ' Maroc',
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 22.0,
                        ),
                      )
                    ],
                  )
                ],
              ),
              CircleAvatar(
                radius: 20.0,
                backgroundImage: AssetImage("assets/images/MyPic.jpg"),
              )
            ],
          ),
        ),
        Expanded(
          child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: Theme.of(context).primaryColor.withOpacity(0.06)),
              child: ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return Column(
                      children: <Widget>[
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Stylistes',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                        StylistCard(stylistData[0]),
                        StylistCard(stylistData[1]),
                        StylistCard(stylistData[2]),
                      ],
                    );
                  })),
        )
      ],
    );
  }
}

class StylistCard extends StatelessWidget {
  final stylist;
  StylistCard(this.stylist);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: stylist['bgColor'],
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 20,
            right: -60,
            child: Image.asset(
              stylist['imgUrl'],
              width: MediaQuery.of(context).size.width * 0.60,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10, left: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  stylist['stylistName'],
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  stylist['salonName'],
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.star,
                      size: 16,
                      color: Theme.of(context).primaryColor,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      stylist['rating'],
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailScreen(stylist)));
                  },
                  color: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'Profil',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
