// ignore_for_file: prefer_final_fields, prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hutrivia/Constants.dart';
import 'package:hutrivia/models/DatabaseConnect.dart';
import 'package:hutrivia/models/QuestionModel.dart';
import 'package:hutrivia/widgets/NextButton.dart';
import 'package:hutrivia/widgets/OptionCard.dart';
import 'package:hutrivia/widgets/QuestionsWidget.dart';
import 'package:hutrivia/widgets/ResultBox.dart';

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
          children: [
            GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, "/umum");
                },
                child: Text("Umum")),
            GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, "/tokoh");
                },
                child: Text("Tokoh"))
          ],
        ));
  }
}
