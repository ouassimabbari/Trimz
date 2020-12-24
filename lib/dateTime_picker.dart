import 'package:Trimz/map_location.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Days {
  final String dayName, dayNumber, dayMonth;
  Days({
    this.dayName,
    this.dayNumber,
    this.dayMonth,
  });
}

class Times {
  final String time;
  bool available;
  Times({this.time, this.available});
}

class DateTimePicker extends StatefulWidget {
  DateTimePicker({Key key}) : super(key: key);

  @override
  _DateTimePickerState createState() => _DateTimePickerState();
}

class _DateTimePickerState extends State<DateTimePicker> {
  int selectedDayIndex;
  int selectedTimeIndex;
  int actualTimeRow;
  int timeRowWidgets;
  @override
  void initState() {
    super.initState();
    selectedDayIndex = 0;
    selectedTimeIndex = -1;
    actualTimeRow = 0;
  }

  final List<Days> days = [
    Days(
      dayName: "Mardi",
      dayMonth: "12",
      dayNumber: "22",
    ),
    Days(
      dayName: "Mercredi",
      dayMonth: "12",
      dayNumber: "23",
    ),
    Days(
      dayName: "Jeudi",
      dayMonth: "12",
      dayNumber: "24",
    ),
    Days(
      dayName: "Vendredi",
      dayMonth: "12",
      dayNumber: "25",
    ),
    Days(
      dayName: "Samedi",
      dayMonth: "12",
      dayNumber: "26",
    ),
    Days(
      dayName: "Dimanche",
      dayMonth: "12",
      dayNumber: "27",
    ),
  ];

  List<Times> timeValues = [
    Times(time: '08h00', available: true),
    Times(time: '08h30', available: false),
    Times(time: '09h00', available: true),
    Times(time: '09h30', available: true),
    Times(time: '10h00', available: true),
    Times(time: '10h30', available: false),
    Times(time: '11h00', available: true),
    Times(time: '11h30', available: true),
    Times(time: '12h00', available: true),
    Times(time: '12h30', available: true),
    Times(time: '13h00', available: true),
    Times(time: '13h30', available: true),
    Times(time: '14h00', available: false),
    Times(time: '14h30', available: true),
    Times(time: '15h00', available: true),
    Times(time: '15h30', available: true),
    Times(time: '16h00', available: false),
    Times(time: '16h30', available: true),
    Times(time: '17h00', available: true),
    Times(time: '17h30', available: true),
    Times(time: '18h00', available: false),
    Times(time: '18h30', available: true),
    Times(time: '19h00', available: true),
    Times(time: '19h30', available: true),
    Times(time: '20h00', available: true),
    Times(time: '20h30', available: true),
    Times(time: '21h00', available: false),
    Times(time: '21h30', available: true),
    Times(time: '22h00', available: true),
    Times(time: '22h30', available: true),
    Times(time: '23h00', available: false),
    Times(time: '23h30', available: true),
  ];

  Widget buildTimeRowWidget(int timeRow) {
    timeRow = timeRow * 4;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          buildTimeWidgets(timeRow),
          buildTimeWidgets(timeRow + 1),
          buildTimeWidgets(timeRow + 2),
          buildTimeWidgets(timeRow + 3),
        ],
      ),
    );
  }

  Widget buildTimeWidgets(int index) {
    final deviceWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTimeIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Container(
          width: deviceWidth / 6,
          height: 35.0,
          child: Material(
            color: selectedTimeIndex == index
                ? Theme.of(context).primaryColor
                : timeValues[index].available
                    ? Colors.white
                    : Colors.red.shade900,
            elevation: 8.0,
            borderRadius: BorderRadius.circular(20.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  timeValues[index].time,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: selectedTimeIndex == index
                        ? Colors.white
                        : timeValues[index].available
                            ? Color(0xFFACACAC)
                            : Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildDaysWidgets(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedDayIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 120.0,
              height: 80.0,
              child: Material(
                color: selectedDayIndex == index
                    ? Theme.of(context).primaryColor
                    : Colors.white,
                elevation: 8.0,
                borderRadius: BorderRadius.circular(20.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        days[index].dayName,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: selectedDayIndex == index
                              ? Colors.white
                              : Color(0xFFACACAC),
                        ),
                      ),
                      Text(
                        "${days[index].dayNumber}/${days[index].dayMonth}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: selectedDayIndex == index
                              ? Colors.white
                              : Color(0xFFACACAC),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0 / 4), //top padding 5
              height: 2,
              width: 30,
              color: selectedDayIndex == index
                  ? Theme.of(context).primaryColor.withOpacity(0.5)
                  : Colors.transparent,
            )
          ],
        ),
      ),
    );
  }

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
                  padding: const EdgeInsets.only(top: 24.0),
                  child: Container(
                      width: deviceWidth,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.06)),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                            child: Text(
                              "Choisissez votre créneau",
                              style: TextStyle(fontSize: 20.0),
                            ),
                          ),
                          Container(
                            color: Colors.transparent,
                            height: 100.0,
                            child: ListView.builder(
                                padding: EdgeInsets.only(
                                  left: 15.0,
                                ),
                                scrollDirection: Axis.horizontal,
                                itemCount: days.length,
                                itemBuilder: (context, index) {
                                  return buildDaysWidgets(index);
                                }),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                color: Colors.transparent,
                                height: 50,
                                child: ListView.builder(
                                    padding: EdgeInsets.only(
                                      left: 15.0,
                                    ),
                                    itemCount: 8,
                                    itemBuilder: (context, index) {
                                      print(index);
                                      return buildTimeRowWidget(index);
                                    }),
                              ),
                            ),
                          ),
                        ],
                      )))),
          SizedBox(
            height: 60.0,
            width: double.infinity,
            child: RaisedButton(
              color: Theme.of(context).primaryColor,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MapLocation()));
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
