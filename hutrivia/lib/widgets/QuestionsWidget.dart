import 'package:flutter/material.dart';
import 'package:hutrivia/constants/Constants.dart';

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
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(
        'Question ${indexAction + 1}/$totalQuestions: $question',
        style: const TextStyle(fontSize: 24.0, color: black),
      ),
    );
  }
}
