// ignore_for_file: prefer_final_fields, prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:hutrivia/constants/Constants.dart';
import 'package:hutrivia/constants/fontStyle.dart';
import 'package:hutrivia/widgets/QuizCategoryCard.dart';

// taking the Stateful Widget cause it's going to be the parent widget and all the functions and variables will be in this widget so we will need to change state of our widget.
class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
          backgroundColor: background,
          body: Padding(
            padding: const EdgeInsets.only(
                top: 100, bottom: 30, left: 20, right: 20),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: white,
              ),
              child: ListView(
                children: [
                  Container(
                    width: 220,
                    height: 220,
                    alignment: Alignment.center,
                    child: Image.asset("T_assets/garuda.png"),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      "Pilih kategori dulu, ya!",
                      style: SemiBold(20),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  QuizCategoryCard(
                    categoryRoute: "/confirm_umum",
                    title: "Umum",
                    desc:
                        "Tes pengetahuan umum kemerdekaan dari masa perjuangan hingga masa proklamasi",
                    img: "T_assets/umum.png",
                  ),
                  Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, "/tokoh");
                    },
                    child: QuizCategoryCard(
                        categoryRoute: "/confirm_tokoh",
                        title: "Tokoh-tokoh Kemerdekaan",
                        desc:
                            "Tes pengetahuan mengenai tokoh-tokoh kemerdekaan Indonesia",
                        img: "T_assets/tokoh.png"),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
