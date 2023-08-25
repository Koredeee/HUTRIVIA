// ignore_for_file: unnecessary_const, file_names

import 'package:flutter/material.dart';
import 'package:hutrivia/Constants.dart';

class ResultBox extends StatelessWidget {
  const ResultBox(
      {Key? key,
      required this.result,
      required this.questionLength,
      required this.onPressed})
      : super(key: key);

  final int result;
  final int questionLength;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: background,
      content: Padding(
        padding: const EdgeInsets.all(70),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Result',
              style: TextStyle(color: neutral, fontSize: 22),
            ),
            const SizedBox(height: 20),
            CircleAvatar(
                child: Text(
                  '$result/$questionLength',
                  style: TextStyle(fontSize: 30),
                ),
                radius: 70,
                backgroundColor: result == questionLength / 2
                    ? Colors.yellow // when the result is half of the questions
                    : result < questionLength / 2
                        ? incorrect // when the result is less than half
                        : correct // when the result is more than half
                ),
            const SizedBox(
              height: 20,
            ),
            Text(
              result == questionLength / 2
                  ? 'Almost There' // when the result is half of the questions
                  : result < questionLength / 2
                      ? 'Try Again' // when the result is less than half
                      : 'Great!',
              style: const TextStyle(color: neutral),
            ),
            const SizedBox(height: 25),
            GestureDetector(
              onTap: onPressed,
              child: const Text(
                'Start Over',
                style: TextStyle(
                    color: neutral,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0),
              ),
            )
          ],
        ),
      ),
    );
  }
}
