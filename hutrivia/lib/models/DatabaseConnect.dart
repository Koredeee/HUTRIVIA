// ignore_for_file: avoid_print

import 'package:http/http.dart' as http;
import './QuestionModel.dart';
import 'dart:convert';

class DBconnect {
  final url = Uri.parse(
      'https://hutriviadb-default-rtdb.asia-southeast1.firebasedatabase.app/questions.json');

  final urlTokoh = Uri.parse(
      'https://hutriviadb-default-rtdb.asia-southeast1.firebasedatabase.app/questions_2.json');

  Future<void> addQuestion(Question question) async {
    http.post(
      url,
      body: json.encode(
        {
          'title': question.title,
          'options': question.options,
        },
      ),
    );
  }

  // fetch the data from database
  Future<List<Question>> fetchQuestions() async {
    // 'then' method returns a 'response' which is our data
    return http.get(url).then((response) {
      //decoding the response (our data)
      var data = json.decode(response.body) as Map<String, dynamic>;

      List<Question> newQuestions = [];

      data.forEach(
        (key, value) {
          var newQuestion = Question(
            id: key, // the encrypted key/the title we gave to our data
            title: value['title'],
            // convert Map<String, dynamic> -> Map<String, bool>
            options: Map.castFrom(value['options']),
          );

          // create a place to store the questions (var newQuestion)
          newQuestions.add(newQuestion);
        },
      );
      return newQuestions;
    });
  }

  Future<List<Question>> fetchQuestionsTokoh() async {
    // 'then' method returns a 'response' which is our data
    return http.get(urlTokoh).then((response) {
      //decoding the response (our data)
      var data = json.decode(response.body) as Map<String, dynamic>;

      List<Question> newQuestions = [];

      data.forEach(
        (key, value) {
          var newQuestion = Question(
            id: key, // the encrypted key/the title we gave to our data
            title: value['title'],
            // convert Map<String, dynamic> -> Map<String, bool>
            options: Map.castFrom(value['options']),
          );

          // create a place to store the questions (var newQuestion)
          newQuestions.add(newQuestion);
        },
      );
      return newQuestions;
    });
  }
}
