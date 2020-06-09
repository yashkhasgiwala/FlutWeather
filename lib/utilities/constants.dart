import 'package:flutter/material.dart';

const ksplashScreen = TextStyle(
  fontSize: 25,
  fontWeight: FontWeight.bold,
  fontFamily: 'Pacifico',
);
const kTextFieldInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  icon: Icon(
    Icons.location_city,
    color: Colors.white,
  ),
  hintText: 'Enter City Name',
  hintStyle: TextStyle(
    color: Colors.grey,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
    borderSide: BorderSide.none,
  ),
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Spartan MB',
);
const ksmallText = TextStyle(
  fontSize: 20,
  fontFamily: 'Pacifico',
  fontWeight: FontWeight.bold,
  color: Colors.black,
);

const knumber = TextStyle(
  fontSize: 19,
  fontWeight: FontWeight.bold,
);
const kbignumber = TextStyle(
  fontSize: 35,
  fontWeight: FontWeight.w600,
);
