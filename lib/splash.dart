
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

import 'display.dart';
class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 6,
     navigateAfterSeconds: new Display(),     
      image:Image.asset('images/fide-logo.png'),
      loadingText: Text("Loading"),
      photoSize: 200.0,
      loaderColor: Colors.blue,
    );
  }
}