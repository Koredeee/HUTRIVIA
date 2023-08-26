// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
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
          Image.asset('T_assets/splash.png'),
          Text(
            "HUTRIVIA",
          )
        ],
      ),
    );
  }
}
