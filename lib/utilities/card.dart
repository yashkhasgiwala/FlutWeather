import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weathercards/utilities/constants.dart';
import 'package:weathercards/Screens/CardScreen.dart';
import 'package:google_fonts/google_fonts.dart';

int index;

class Card2 extends StatefulWidget {
  @override
  _Card2State createState() => _Card2State();
}

class _Card2State extends State<Card2> {
  String capitalize(String string) {
    if (string == null) {
      throw ArgumentError("string: $string");
    }

    if (string.isEmpty) {
      return string;
    }

    return string[0].toUpperCase() + string.substring(1);
  }

  Widget builditems(BuildContext context, index) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) {
        setState(() {
          cityname.removeAt(index);
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Image(
                        image: AssetImage('images/drop.png'),
                        height: 35,
                        color: Colors.white,
                        width: 30,
                      ),
                      SizedBox(
                        height: 35,
                        width: 5,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Humidity',
                            style: ksmallText,
                          ),
                          Text(
                            cityname[index]['main']['humidity'].toString() +
                                "%",
                            style: knumber,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Image.network(
                    "http://openweathermap.org/img/w/" +
                        cityname[index]['weather'][0]['icon'] +
                        ".png",
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Pressure',
                        style: ksmallText,
                      ),
                      Text(
                        cityname[index]['main']['pressure'].toString() + " Pa",
                        style: knumber,
                      ),
                    ],
                  ),
                ],
              ),
              Text(
                capitalize(
                  cityname[index]['weather'][0]['description'],
                ),
                style: GoogleFonts.pacifico(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    cityname[index]['name'],
                    style: GoogleFonts.pacifico(
                      fontWeight: FontWeight.bold,
                      fontSize: 29,
                    ),
                  ),
                  Text(
                    cityname[index]['main']['temp'].toInt().toString() + "°C",
                    style: kbignumber,
                  )
                ],
              ),
            ],
          ),
          decoration: BoxDecoration(
            color: Colors.teal.withOpacity(0.5),
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          height: 215.0,
          width: MediaQuery.of(context).size.width * 1.0,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: builditems,
      itemCount: cityname.length,
    );
  }
}
