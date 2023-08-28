import 'package:flutter/material.dart';
import 'package:hutrivia/constants/Constants.dart';
import 'package:hutrivia/constants/fontStyle.dart';

class QuizCategoryCard extends StatelessWidget {
  final String categoryRoute;
  final String title;
  final String desc;
  final String img;

  const QuizCategoryCard({
    super.key,
    required this.categoryRoute,
    required this.title,
    required this.desc,
    required this.img,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, categoryRoute);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 22),
        decoration: BoxDecoration(
          color: lightGrey,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.left,
                    style: Bold(15),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Text(
                      desc,
                      textAlign: TextAlign.left,
                      style: Regular(11),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 115,
              height: 115,
              child: Image.asset(img),
            ),
          ],
        ),
      ),
    );
  }
}
