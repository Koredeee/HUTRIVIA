// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hutrivia/constants/Constants.dart';
import 'package:hutrivia/constants/fontStyle.dart';
import 'package:hutrivia/models/DatabaseConnect.dart';
import 'package:hutrivia/models/QuestionModel.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ConfirmUmumScreen extends StatefulWidget {
  const ConfirmUmumScreen({super.key});

  @override
  State<ConfirmUmumScreen> createState() => _ConfirmUmumScreenState();
}

class _ConfirmUmumScreenState extends State<ConfirmUmumScreen> {
  var db = DBconnect();

  late Future _questions;

  Future<List<Question>> getData() async {
    return db.fetchQuestions();
  }

  void initState() {
    _questions = getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        shadowColor: Colors.transparent,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 30, left: 20, right: 20),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: white,
          ),
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, "/umum");
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              child: FutureBuilder(
                future: _questions as Future<List<Question>>,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Container(
                      color: white,
                      child: AnimatedBuilder(
                        animation: CurvedAnimation(
                          parent: AlwaysStoppedAnimation(0),
                          curve: Interval(0.0, 50.0),
                        ),
                        builder: (BuildContext context, Widget? child) {
                          return Center(
                            child: LoadingAnimationWidget.threeArchedCircle(
                              color: background,
                              size: 60,
                            ),
                          );
                        },
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    var totalQuestions = snapshot.data as List<Question>;

                    return ListView(
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                              top: 35, bottom: 20, left: 35, right: 35),
                          width: 280,
                          height: 280,
                          child: Image.asset("T_assets/umum.png"),
                          alignment: Alignment.center,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 10, left: 10, bottom: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Kategori", style: Regular(13)),
                              Text("Umum", style: Bold(20)),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 22),
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
                                      "Berbagai pertanyaan seputar sejarah kemerdekaan Indonesia mulai dari masa perjuangan hingga masa proklamasi.",
                                      textAlign: TextAlign.left,
                                      style: Regular(12),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 12),
                                      child: Row(
                                        children: [
                                          Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                color: Color(0xFFBDB1B4),
                                              ),
                                              child: const Icon(
                                                Icons.question_mark_rounded,
                                                color: lightGrey,
                                              )),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: Text(
                                              "${totalQuestions.length} Pertanyaan",
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
                        Center(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 2, vertical: 20),
                            alignment: Alignment.center,
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 43, vertical: 8),
                                    decoration: BoxDecoration(
                                        color: Color(0xFFBDB1B4),
                                        borderRadius:
                                            BorderRadius.circular(17)),
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
                                    Navigator.pushNamed(context, "/umum");
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 30, vertical: 8),
                                    decoration: BoxDecoration(
                                        color: background,
                                        borderRadius:
                                            BorderRadius.circular(17)),
                                    child: Text(
                                      "Mainkan",
                                      style: BatalButton(15),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    );
                  }

                  return SizedBox.shrink();
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
