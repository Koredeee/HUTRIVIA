import 'package:flutter/material.dart';
import 'package:hutrivia/constants/Constants.dart';

class NextButton extends StatelessWidget {
  final String wording;
  NextButton({required this.wording});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: neutral, borderRadius: BorderRadius.circular(10.0)),
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Text(
        wording,
        textAlign: TextAlign.center,
      ),
    );
  }
}
