import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:outline_material_icons/outline_material_icons.dart';

import 'dateTime_picker.dart';

var serviceList = [
  {'title': 'Coupe de cheveux', 'duration': 45, 'price': 60},
  {'title': 'Manicure', 'duration': 60, 'price': 70},
  {'title': 'Coloration', 'duration': 90, 'price': 120},
  {'title': 'Pedicure', 'duration': 30, 'price': 60},
];

class DetailScreen extends StatelessWidget {
  final stylist;

  DetailScreen(this.stylist);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 22.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                InkWell(
                  onTap: null,
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Theme.of(context).primaryColor,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
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
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 3 + 20,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    Image.asset(
                      'assets/images/detail_bg.png',
                      fit: BoxFit.fill,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      color: Theme.of(context).primaryColor.withOpacity(0.1),
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 60,
                top: MediaQuery.of(context).size.height / 3 - 120,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width / 3 - 20,
                        height: MediaQuery.of(context).size.height / 6 + 20,
                        decoration: BoxDecoration(
                          color: stylist['bgColor'],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Stack(
                          fit: StackFit.expand,
                          children: <Widget>[
                            Positioned(
                              top: 10,
                              right: -25,
                              child: Image.asset(
                                stylist['imgUrl'],
                                scale: 1.7,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 170,
                            height: 90,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color: Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.9)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Text(
                                    stylist['stylistName'],
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
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
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(
                                        Icons.star,
                                        size: 16,
                                        color: Color(0xffFF8573),
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        stylist['rating'],
                                        style: TextStyle(
                                          color: Color(0xffFF8573),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        '(${stylist['rateAmount']})',
                                        style: TextStyle(
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                right: 10,
                top: MediaQuery.of(context).size.height / 3 - 55,
                child: MaterialButton(
                  onPressed: () {},
                  padding: EdgeInsets.all(10),
                  shape: CircleBorder(),
                  color: Colors.white,
                  child: Icon(OMIcons.favoriteBorder),
                ),
              ),
            ],
          ),
          Expanded(
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color: Theme.of(context).primaryColor.withOpacity(0.06)),
                  child: ListView.builder(
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Services',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              ServiceTile(serviceList[0]),
                              ServiceTile(serviceList[1]),
                              ServiceTile(serviceList[2]),
                              ServiceTile(serviceList[3]),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Container(
                                    padding: EdgeInsets.all(20),
                                    width: MediaQuery.of(context).size.width,
                                    height:
                                        MediaQuery.of(context).size.height / 6,
                                    color: Theme.of(context).primaryColor,
                                    child: Column(
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            Text(
                                              'Hamza Fikri',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 20.0,
                                            ),
                                            Text(
                                              'Dec 18, 2020',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w300,
                                                color: Colors.white,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 30,
                                            ),
                                            Icon(
                                              Icons.star,
                                              color: Color(0xffFF8573),
                                              size: 16,
                                            ),
                                            SizedBox(
                                              width: 4,
                                            ),
                                            Icon(
                                              Icons.star,
                                              color: Color(0xffFF8573),
                                              size: 16,
                                            ),
                                            SizedBox(
                                              width: 4,
                                            ),
                                            Icon(
                                              Icons.star,
                                              color: Color(0xffFF8573),
                                              size: 16,
                                            ),
                                            SizedBox(
                                              width: 4,
                                            ),
                                            Icon(
                                              Icons.star,
                                              color: Color(0xffFF8573),
                                              size: 16,
                                            ),
                                            SizedBox(
                                              width: 3,
                                            ),
                                            Icon(
                                              Icons.star,
                                              color: Color(0xffFF8573),
                                              size: 16,
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          'Karim est le meilleur styliste...',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      })))
        ],
      ),
    );
  }
}

class ServiceTile extends StatelessWidget {
  final service;
  ServiceTile(this.service);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                width: MediaQuery.of(context).size.width / 2 - 40,
                child: Text(
                  service['title'],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                '${service['duration']} Min',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          Text(
            '${service['price']}Dhs',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          MaterialButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DateTimePicker()));
            },
            color: Theme.of(context).primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              'Réserver',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
