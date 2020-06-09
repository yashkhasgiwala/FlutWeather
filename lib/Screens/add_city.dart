import 'package:flutter/material.dart';
import 'package:weathercards/utilities/constants.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String cityName;
  bool abc = false;
  @override
  final theImage = Image.network(
      "https://images.unsplash.com/photo-1519501025264-65ba15a82390?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=700&q=80",
      fit: BoxFit.cover);
  @override
  void didChangeDependencies() {
    precacheImage(theImage.image, context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            Container(
              height: double.infinity,
              width: double.infinity,
              child: theImage,
            ),
            SafeArea(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(
                        top: 80.0, left: 20, right: 20, bottom: 20),
                    child: TextField(
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      decoration: kTextFieldInputDecoration,
                      onChanged: (value) {
                        cityName = value;
                      },
                    ),
                  ),
                  FloatingActionButton.extended(
                    elevation: 15,
                    backgroundColor: Colors.red.withOpacity(0.8),
                    onPressed: () {
                      if (cityName == null) {
                        return showDialog(
                            context: context,
                            builder: (context) => new AlertDialog(
                                  title: new Text('Enter a valid name'),
                                  actions: <Widget>[
                                    new GestureDetector(
                                      onTap: () =>
                                          Navigator.of(context).pop(false),
                                      child: Text(
                                        "OK  ",
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  ],
                                ));
                      } else {
                        Navigator.pop(context, cityName);
                      }
                    },
                    label: Text(
                      'Get Weather',
                      style: kButtonTextStyle,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
