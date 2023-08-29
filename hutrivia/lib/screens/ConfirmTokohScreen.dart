import 'package:flutter/material.dart';
import 'package:hutrivia/constants/Constants.dart';
import 'package:hutrivia/constants/fontStyle.dart';

class ConfirmTokohScreen extends StatelessWidget {
  const ConfirmTokohScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        shadowColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 30, left: 20, right: 20),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: white,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            child: ListView(
              children: [
                Container(
                  padding:
                      EdgeInsets.only(top: 35, bottom: 20, left: 35, right: 35),
                  width: 280,
                  height: 280,
                  child: Image.asset("T_assets/tokoh.png"),
                  alignment: Alignment.center,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(right: 10, left: 10, bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Kategori", style: Regular(13)),
                      Text("Tokoh-tokoh Kemerdekaan", style: Bold(18)),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 22),
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
                              "Berbagai pertanyaan mengenai tokoh-tokoh yang berperan penting dalam perjuangan menuju kemerdekaan Indonesia mulai dari para pahlawan nasional hingga tokoh inspiratif lainnya.",
                              textAlign: TextAlign.left,
                              style: Regular(12),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 12),
                              child: Row(
                                children: [
                                  Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: Color(0xFFBDB1B4),
                                      ),
                                      child: const Icon(
                                        Icons.question_mark_rounded,
                                        color: lightGrey,
                                      )),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      "10 Pertanyaan",
                                      textAlign: TextAlign.left,
                                      style: SemiBold(15),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  alignment: Alignment.center,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, "/homepage");
                        },
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 43, vertical: 8),
                          decoration: BoxDecoration(
                              color: Color(0xFFBDB1B4),
                              borderRadius: BorderRadius.circular(17)),
                          child: Text(
                            "Batal",
                            style: BatalButton(15),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, "/tokoh");
                        },
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                          decoration: BoxDecoration(
                              color: background,
                              borderRadius: BorderRadius.circular(17)),
                          child: Text(
                            "Mainkan",
                            style: BatalButton(15),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
