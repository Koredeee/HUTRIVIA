// ignore_for_file: unnecessary_const, file_names

import 'package:flutter/material.dart';
import 'package:hutrivia/constants/Constants.dart';
import 'package:hutrivia/constants/fontStyle.dart';

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
    final int totalResult = questionLength * 10;

    return AlertDialog(
      backgroundColor: neutral,
      content: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'SKOR',
              style: TextStyle(
                  color: Color(0xFF2C353C),
                  fontFamily: "Poppins",
                  fontSize: 32,
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 20),
            CircleAvatar(
                child: Text(
                  '$result',
                  style: TextStyle(
                      color: neutral,
                      fontFamily: "Poppins",
                      fontSize: 40,
                      fontWeight: FontWeight.w700),
                ),
                radius: 70,
                backgroundColor: result == totalResult / 2
                    ? Color(
                        0xFFD7C739) // when the result is half of the questions
                    : result < totalResult / 2
                        ? incorrect // when the result is less than half
                        : correct // when the result is more than half
                ),
            const SizedBox(
              height: 25,
            ),
            Text(
              result == totalResult / 2
                  ? 'Tidak Buruk!' // when the result is half of the questions
                  : result < totalResult / 2
                      ? 'Coba lagi, ya!' // when the result is less than half
                      : 'Kerja Bagus!',
              style: const TextStyle(
                  color: black,
                  fontFamily: "Poppins",
                  fontSize: 20,
                  fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 25),
            GestureDetector(
              onTap: onPressed,
              child: Container(
                decoration: BoxDecoration(
                  color: neutral,
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(color: background),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 10.0, bottom: 10, left: 20, right: 20),
                  child: const Text(
                    'Main Lagi',
                    style: TextStyle(
                      color: background,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      // letterSpacing: 1.0,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
