// ignore_for_file: prefer_final_fields, prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:hutrivia/constants/Constants.dart';

// taking the Stateful Widget cause it's going to be the parent widget and all the functions and variables will be in this widget so we will need to change state of our widget.
class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: background,
        appBar: AppBar(
          title: const Text('HUTRIVIA'),
          backgroundColor: background,
          shadowColor: Colors.transparent,
        ),
        body: ListView(
          padding: EdgeInsets.all(150),
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/umum");
              },
              child: Text(
                "Umum",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.pinkAccent, fontSize: 30),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/tokoh");
              },
              child: Text(
                "Tokoh",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.pink.shade400, fontSize: 30),
              ),
            )
          ],
        ));
  }
}
