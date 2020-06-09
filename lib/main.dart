import 'package:flutter/material.dart';
import 'package:weathercards/Screens/SplashScreen.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SplashScreen(),
      ),
    ),
  );
}
