import 'package:Trimz/paiement.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import "package:latlong/latlong.dart";

class MapLocation extends StatefulWidget {
  @override
  _MapLocationState createState() => _MapLocationState();
}

class _MapLocationState extends State<MapLocation> {
  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Container(
                height: 350,
                width: deviceWidth,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: Theme.of(context).primaryColor.withOpacity(0.06)),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                      child: Text(
                        "Choisissez votre endroit",
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                    Container(
                        color: Colors.transparent,
                        height: 450.0,
                        child: Stack(
                          children: [
                            FlutterMap(
                              options: MapOptions(
                                center: LatLng(51.5, -0.09),
                                zoom: 13.0,
                              ),
                              layers: [
                                MarkerLayerOptions(
                                  markers: [
                                    Marker(
                                      width: 80.0,
                                      height: 80.0,
                                      point: LatLng(33.5156, 7.6583),
                                      builder: (ctx) => Container(
                                        child: FlutterLogo(),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                              children: <Widget>[
                                TileLayerWidget(
                                    options: TileLayerOptions(
                                        urlTemplate:
                                            "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                                        subdomains: ['a', 'b', 'c'])),
                                MarkerLayerWidget(
                                    options: MarkerLayerOptions(
                                  markers: [
                                    Marker(
                                      width: 80.0,
                                      height: 80.0,
                                      point: LatLng(33.5156, 7.6583),
                                      builder: (ctx) => Container(
                                        child: FlutterLogo(),
                                      ),
                                    ),
                                  ],
                                )),
                              ],
                            ),
                            Positioned(
                                right: 20,
                                bottom: 20,
                                child: Container(
                                  alignment: Alignment.centerRight,
                                  width: 60.0,
                                  decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .primaryColor
                                          .withOpacity(0.7),
                                      borderRadius:
                                          BorderRadius.circular(40.0)),
                                  child: Center(
                                    child: MaterialButton(
                                      onPressed: null,
                                      child: Icon(
                                        FontAwesomeIcons.minus,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                )),
                            Positioned(
                                right: 20,
                                bottom: 80,
                                child: Container(
                                  alignment: Alignment.centerRight,
                                  width: 60.0,
                                  decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .primaryColor
                                          .withOpacity(0.7),
                                      borderRadius:
                                          BorderRadius.circular(40.0)),
                                  child: Center(
                                    child: MaterialButton(
                                      onPressed: null,
                                      child: Icon(
                                        FontAwesomeIcons.plus,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ))
                          ],
                        )),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 60.0,
            width: double.infinity,
            child: RaisedButton(
              color: Theme.of(context).primaryColor,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Payment()));
              },
              child: Text(
                "Suivant",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
