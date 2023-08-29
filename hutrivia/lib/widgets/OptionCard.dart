import 'package:flutter/material.dart';
import 'package:hutrivia/constants/Constants.dart';

class OptionCard extends StatelessWidget {
  const OptionCard({
    Key? key,
    required this.option,
    required this.color,
  }) : super(key: key);

  final String option;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: color,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 3),
          child: ListTile(
            title: Text(
              option,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 17.0,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w400,
                color: color == lightGrey ? black : white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
