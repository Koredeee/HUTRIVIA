// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hutrivia/constants/fontStyle.dart';
// import 'package:hutrivia/Constants.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SpalshScreenState();
}

class _SpalshScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), navigationPage);
  }

  void navigationPage() {
    Navigator.pushNamed(context, "/homepage");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F6FA),
      body: Column(
        children: [
<<<<<<< HEAD
          Image.asset('T_assets/splash.png'),
          Text(
            "HUTRIVIA",
          )
=======
          Padding(padding: EdgeInsets.symmetric(vertical: 100)),
          Image.asset(
            'T_assets/splash.png',
            height: 223,
            alignment: Alignment.center,
          ),
          Text(
            textAlign: TextAlign.center,
            "HUTRIVIA",
            style: Bold(60),
          ),
          Text(
            textAlign: TextAlign.center,
            "Ayo tes pengetahuan kamu seputar kemerdekaan Indonesia!",
            style: Regular(16),
          ),
>>>>>>> origin/main
        ],
      ),
    );
  }
}
