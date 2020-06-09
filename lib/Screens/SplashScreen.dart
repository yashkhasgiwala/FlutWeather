import 'dart:async';
import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';
import 'package:weathercards/utilities/constants.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'CardScreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  AnimationController _controllerIcon, _controllerTitle, _controllerLoader;
  Animation<double> _animation, _animation1, _animation2;
  @override
  void initState() {
    super.initState();
    _controllerIcon = AnimationController(
        duration: const Duration(milliseconds: 6000), vsync: this);
    _animation = CurvedAnimation(parent: _controllerIcon, curve: Curves.easeIn);

    _controllerLoader = AnimationController(
        duration: const Duration(milliseconds: 15000), vsync: this);
    _animation2 =
        CurvedAnimation(parent: _controllerIcon, curve: Curves.easeIn);

    _controllerTitle = AnimationController(
        duration: const Duration(milliseconds: 8500), vsync: this);
    _animation1 =
        CurvedAnimation(parent: _controllerTitle, curve: Curves.easeIn);

    _controllerIcon.forward();
    _controllerLoader.forward();
    _controllerTitle.forward();
    Timer(
        Duration(milliseconds: 10000),
        () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CardScreen()),
            ));
  }

  final theImage = Image.network(
      "https://images.unsplash.com/photo-1513002749550-c59d786b8e6c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80",
      fit: BoxFit.cover);
  @override
  void didChangeDependencies() {
    precacheImage(theImage.image, context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            height: double.infinity,
            child: theImage,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 218.0),
                child: Center(
                  child: FadeTransition(
                    opacity: _animation,
                    child: BoxedIcon(
                      WeatherIcons.day_sunny_overcast,
                      size: 70,
                      color: Colors.yellow,
                    ),
                  ),
                ),
              ),
              FadeTransition(
                opacity: _animation1,
                child: Text(
                  'Flut Weather',
                  style: ksplashScreen,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 198.0,
                  bottom: 12,
                ),
                child: FadeTransition(
                  opacity: _animation2,
                  child: SpinKitSquareCircle(
                    color: Colors.yellow,
                    size: 50.0,
                    controller: AnimationController(
                        vsync: this,
                        duration: const Duration(milliseconds: 1000)),
                  ),
                ),
              ),
              FadeTransition(
                opacity: _animation2,
                child: Text(
                  'Fetching Weather...',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
