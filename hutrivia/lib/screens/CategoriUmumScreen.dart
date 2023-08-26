// ignore_for_file: prefer_final_fields, prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hutrivia/constants/Constants.dart';
import 'package:hutrivia/models/DatabaseConnect.dart';
import 'package:hutrivia/models/QuestionModel.dart';
import 'package:hutrivia/widgets/NextButton.dart';
import 'package:hutrivia/widgets/OptionCard.dart';
import 'package:hutrivia/widgets/QuestionsWidget.dart';
import 'package:hutrivia/widgets/ResultBox.dart';

// taking the Stateful Widget cause it's going to be the parent widget and all the functions and variables will be in this widget so we will need to change state of our widget.
class CategoriUmumScreen extends StatefulWidget {
  @override
  State<CategoriUmumScreen> createState() => _CategoriUmumScreenState();
}

class _CategoriUmumScreenState extends State<CategoriUmumScreen> {
  // create object for DBConnect
  var db = DBconnect();

  late Future _questions;

  Future<List<Question>> getData() async {
    return db.fetchQuestions();
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
          content: const Text('Please select any option'),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.symmetric(vertical: 20),
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
        score++;
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
    return FutureBuilder(
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
          int finalIdx = extractedData.length;
          return Scaffold(
            backgroundColor: background,
            appBar: AppBar(
              title: const Text('HUTRIVIA'),
              backgroundColor: background,
              shadowColor: Colors.transparent,
              actions: [
                Padding(
                  padding: const EdgeInsets.all(18),
                  child: Text(
                    'Score: $score',
                    style: const TextStyle(fontSize: 18),
                  ),
                )
              ],
            ),
            body: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(children: [
                // add the questionWidget here
                QuestionsWidget(
                  indexAction: index, // currently at 0.
                  question: extractedData[index]
                      .title, // means the first question in the list.
                  totalQuestions:
                      extractedData.length, // total length of the list.
                ),
                const Divider(color: neutral),
                const SizedBox(height: 25.0),

                // displaying the options and the correct and incorrect answers
                for (int i = 0; i < extractedData[index].options.length; i++)
                  GestureDetector(
                    onTap: () => checkAnswerAndUpdate(
                        extractedData[index].options.values.toList()[i]),
                    child: OptionCard(
                      option: extractedData[index].options.keys.toList()[i],
                      // we need to check if the answer is correct or not
                      // we need this value
                      color: isPressed
                          ? extractedData[index].options.values.toList()[i] ==
                                  true
                              ? correct
                              : incorrect
                          : neutral,
                    ),
                  ),
              ]),
            ),
            floatingActionButton: GestureDetector(
              onTap: () => nextQuestion(extractedData.length),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: NextButton(
                  wording: extractedData[index] == finalIdx - 1
                      ? "Finish"
                      : "Next Question",
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
        return Container(
          color: Colors.blue,
          child: Icon(
            Icons.facebook,
            size: 100,
          ),
        );
      },
    );
  }
}
