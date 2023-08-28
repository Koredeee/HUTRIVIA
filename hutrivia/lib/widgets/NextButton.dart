import 'package:flutter/material.dart';
import 'package:hutrivia/constants/Constants.dart';

class NextButton extends StatelessWidget {
  final String wording;
  const NextButton({super.key, required this.wording});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: neutral,
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(color: background),
      ),
      padding: const EdgeInsets.symmetric(vertical: 11.0),
      child: Text(
        wording,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: background,
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
      ),
    );
  }
}
