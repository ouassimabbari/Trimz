import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Confirmation extends StatelessWidget {
  const Confirmation({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    return Material(
      child: Padding(
        padding: EdgeInsets.only(top: 60.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 22.0),
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
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.4),
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
                padding: const EdgeInsets.only(top: 24.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color: Theme.of(context).primaryColor.withOpacity(0.06)),
                  child: Column(children: <Widget>[
                    SizedBox(
                      height: 50.0,
                    ),
                    Text(
                      "Votre rendez-vous a bien été enregistré",
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 80.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 50.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.popUntil(context, ModalRoute.withName('/'));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            color: Theme.of(context).primaryColor,
                          ),
                          child: SizedBox(
                            height: 60,
                            width: deviceWidth / 2 + deviceWidth / 5,
                            child: Center(
                              child: Text(
                                "Retour à la page d'accueil",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
