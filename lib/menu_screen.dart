import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:Trimz/main.dart';

class MenuScreen extends StatefulWidget {
  static int selectedMenuIndex = 0;
  final Function returnSelectedMenuIndex;
  MenuScreen({@required this.returnSelectedMenuIndex});

  int get index {
    return selectedMenuIndex;
  }

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  List<String> menuItems = [
    'Accueil',
    'Boutique',
    'Fil d\'atualités',
    'Boite de messagerie',
    'Profil',
    'Support',
  ];

  List<IconData> icons = [
    FontAwesomeIcons.home,
    FontAwesomeIcons.shoppingCart,
    FontAwesomeIcons.newspaper,
    FontAwesomeIcons.envelope,
    FontAwesomeIcons.userAlt,
    FontAwesomeIcons.questionCircle,
  ];

  Widget buildMenuRow(int index) {
    return InkWell(
      onTap: () {
        setState(() {
          MenuScreen.selectedMenuIndex = index;
          widget.returnSelectedMenuIndex();
        });
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 24.0),
        child: Row(
          children: [
            Icon(
              icons[index],
              color: MenuScreen.selectedMenuIndex == index
                  ? Colors.white
                  : Colors.white.withOpacity(0.5),
            ),
            SizedBox(
              width: 16.0,
            ),
            Text(
              menuItems[index],
              style: TextStyle(
                  color: MenuScreen.selectedMenuIndex == index
                      ? Colors.white
                      : Colors.white.withOpacity(0.5),
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 24.0,
              horizontal: 20.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 24.0,
                      backgroundColor: Colors.orange,
                      backgroundImage: AssetImage("assets/images/MyPic.jpg"),
                    ),
                    SizedBox(
                      width: 16.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Ouassim",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 22.0,
                          ),
                        ),
                        Text(
                          "Statut actif",
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: menuItems
                      .asMap()
                      .entries
                      .map((mapEntry) => buildMenuRow(mapEntry.key))
                      .toList(),
                ),
                Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.cog,
                      color: Colors.white.withOpacity(0.5),
                    ),
                    SizedBox(
                      width: 16.0,
                    ),
                    Text(
                      "Paramétres  |  Déconnexion",
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.5),
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [startingColor, mainColor])),
      ),
    );
  }
}
