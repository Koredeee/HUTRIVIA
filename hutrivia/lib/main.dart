import 'package:flutter/material.dart';
import 'package:hutrivia/models/DatabaseConnect.dart';
import 'package:hutrivia/screens/CategoriTokohScreen.dart';
import 'package:hutrivia/screens/CategoriUmumScreen.dart';
import 'package:hutrivia/screens/ConfirmTokohScreen.dart';
import 'package:hutrivia/screens/HomeScreen.dart';
import 'package:hutrivia/screens/ConfirmUmumScreen.dart';
import 'package:hutrivia/widgets/SplashScreen.dart';

void main() {
  var db = DBconnect();

  // we pass the parameters from QuestionModel.dart
  // db.addQuestion(
  //   Question(
  //     id: '20',
  //     title: 'Apa tugas dari pantiia sembilan?',
  //     options: {
  //       'Mematangkan rumusan dasar negara': true,
  //       'Menyilidiki hal-hal penting yang berkaitan dengan pembentukan negara Indonesia':
  //           false,
  //       'Membahas hal praktis dari penetapan dasar negara hingga pembentukan lembaga negara':
  //           false,
  //     },
  //   ),
  // );

  // fetching data from the database
  db.fetchQuestions();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var routes = {
    "/homepage": (context) => HomeScreen(),
    "/umum": (context) => CategoriUmumScreen(),
    "/tokoh": (context) => CategoriTokohScreen(),
    "/confirm_umum": (context) => ConfirmUmumScreen(),
    "/confirm_tokoh": (context) => ConfirmTokohScreen(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // remove the debug banner
      debugShowCheckedModeBanner: false,
      // set a homepage
      routes: routes,
      home: SplashScreen(),
    );
  }
}
