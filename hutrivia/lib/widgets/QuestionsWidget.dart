import 'package:flutter/material.dart';
import 'package:hutrivia/constants/Constants.dart';
import 'package:hutrivia/constants/fontStyle.dart';

class QuestionsWidget extends StatelessWidget {
  const QuestionsWidget(
      {Key? key,
      required this.question,
      required this.indexAction,
      required this.totalQuestions})
      : super(key: key);

  // we need the question title and the total number of questions, and the index

  final String question;
  final int indexAction;
  final int totalQuestions;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        decoration: BoxDecoration(
          color: neutral,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: lightGrey, width: 3),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 60.0, horizontal: 10),
          child: Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                Text(
                  'Pertanyaan ${indexAction + 1}/$totalQuestions:',
                  style: RegularSecond(17),
                  textAlign: TextAlign.center,
                ),
                Text(
                  question,
                  style: Regular(17),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
