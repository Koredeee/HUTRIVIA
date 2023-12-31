// ignore_for_file: prefer_final_fields, prefer_const_constructors_in_immutables, prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hutrivia/constants/Constants.dart';
import 'package:hutrivia/constants/fontStyle.dart';
import 'package:hutrivia/models/DatabaseConnect.dart';
import 'package:hutrivia/models/QuestionModel.dart';
import 'package:hutrivia/widgets/NextButton.dart';
import 'package:hutrivia/widgets/OptionCard.dart';
import 'package:hutrivia/widgets/QuestionsWidget.dart';
import 'package:hutrivia/widgets/ResultBox.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

// taking the Stateful Widget cause it's going to be the parent widget and all the functions and variables will be in this widget so we will need to change state of our widget.
class CategoriTokohScreen extends StatefulWidget {
  @override
  State<CategoriTokohScreen> createState() => _CategoriTokohScreenState();
}

class _CategoriTokohScreenState extends State<CategoriTokohScreen> {
  // create object for DBConnect
  var db = DBconnect();

  late Future _questions;

  Future<List<Question>> getData() async {
    return db.fetchQuestionsTokoh();
  }

  @override
  void initState() {
    // TODO: implement initState
    _questions = getData();
    super.initState();
  }
  // List<Question> _questions = [
  //   Question(
  //       id: '10',
  //       title: 'Dokuritsu Junbi Cosakai adalah istilah Jepang dari ...',
  //       options: {'PPKI': false, 'BPUPKI': true, 'Panitia Sembilan': false}),
  //   Question(
  //       id: '10',
  //       title: 'Apa yang melatarbelakangi kemerdekaan Indonesia?',
  //       options: {
  //         'Jepang menyatakan kalah pada Perang Dunia Kedua': false,
  //         'Bom Hiroshima dan Nagasaki': false,
  //         'Semua jawaban benar': true
  //       }),
  // ];

  // create an index to loop through _questions
  int index = 0;

  // score variable
  int score = 0;

  // create a boolean value to check if the user has clicked
  bool isPressed = false;

  bool isAlreadySelected = false;

  bool showAnimation = true;

  // create a function to display the next question
  void nextQuestion(int questionLength) {
    if (index == questionLength - 1) {
      showDialog(
          context: context,
          barrierDismissible:
              false, // disable the dissmiss function on clicking outside of box
          builder: (ctx) => ResultBox(
                result: score,
                questionLength: questionLength,
                onPressed: startOver,
              ));
    } else {
      // conditional when the user select the options
      if (isPressed) {
        setState(() {
          index++; // when the index will change to 1. rebuild the app
          isPressed = false;
          isAlreadySelected = false;
        });
      } else {
        // we display the message that the user have to select the options
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: const Text('Mohon pilih salah satu opsi'),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        ));
      }
    }
  }

  // create a function for changing color
  void checkAnswerAndUpdate(bool value) {
    if (isAlreadySelected) {
      return;
    } else {
      if (value == true) {
        score += 10;
      }
      setState(() {
        isPressed = true;
        isAlreadySelected = true;
      });
    }
  }

  // start over function
  void startOver() {
    setState(() {
      index = 0;
      score = 0;
      isPressed = false;
      isAlreadySelected = false;
    });
    Navigator.pop(context);
    Navigator.pushNamed(context, "/homepage");
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: FutureBuilder(
        future: _questions as Future<List<Question>>,
        builder: (ctx, snapshot) {
          // if (snapshot.connectionState = ConnectionState.done) {
          if (!snapshot.hasData) CircularProgressIndicator();
          if (snapshot.hasError) {
            return Center(
              child: Text('${snapshot.error}'),
            );
          } else if (snapshot.hasData) {
            var extractedData = snapshot.data as List<Question>;
            if (showAnimation) {
              Timer(Duration(seconds: 3), () {
                if (!mounted) return;
                setState(() {
                  showAnimation = false;
                });
              });

              return Container(
                color: background,
                child: AnimatedBuilder(
                  animation: AlwaysStoppedAnimation(0),
                  builder: (BuildContext context, Widget? child) {
                    return Center(
                        child: LoadingAnimationWidget.threeArchedCircle(
                            color: white, size: 60));
                  },
                ),
              );
            }
            return Scaffold(
              backgroundColor: background,
              appBar: AppBar(
                title: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: const Text(
                    'HUTRIVIA',
                    style: TextStyle(
                      color: neutral,
                      fontSize: 32,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                automaticallyImplyLeading: false,
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
              ),
              body: Container(
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                // decoration: BoxDecoration(
                //   borderRadius: BorderRadius.only(
                //     topLeft: Radius.circular(20),
                //     topRight: Radius.circular(20),
                //   ),
                // ),
                child: Animate(
                  effects: [FadeEffect(duration: 800.ms)],
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 70),
                    child: ListView(children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, top: 35),
                          child: Text(
                            "Kategori",
                            style: Regular(16),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Text(
                            "Tokoh",
                            style: Bold(24),
                          ),
                        ),
                      ),
                      // add the questionWidget here
                      QuestionsWidget(
                        indexAction: index, // currently at 0.
                        question: extractedData[index]
                            .title, // means the first question in the list.
                        totalQuestions:
                            extractedData.length, // total length of the list.
                      ),
                      const Divider(color: neutral),
                      const SizedBox(height: 0),

                      // displaying the options and the correct and incorrect answers
                      for (int i = 0;
                          i < extractedData[index].options.length;
                          i++)
                        GestureDetector(
                          onTap: () => checkAnswerAndUpdate(
                              extractedData[index].options.values.toList()[i]),
                          child: OptionCard(
                            option:
                                extractedData[index].options.keys.toList()[i],
                            // we need to check if the answer is correct or not
                            // we need this value
                            color: isPressed
                                ? extractedData[index]
                                            .options
                                            .values
                                            .toList()[i] ==
                                        true
                                    ? correct
                                    : incorrect
                                : lightGrey,
                          ),
                        ),
                    ]),
                  ),
                ),
              ),
              floatingActionButton: GestureDetector(
                onTap: () => nextQuestion(extractedData.length),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: NextButton(
                    wording: index == extractedData.length - 1
                        ? "Selesai"
                        : "Pertanyaan Selanjutnya",
                  ),
                ),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerFloat,
            );
          }
          // } else {
          //   return const Center(
          //     child: CircularProgressIndicator(),
          //   );
          // }
          return SizedBox.shrink();
        },
      ),
    );
  }
}
