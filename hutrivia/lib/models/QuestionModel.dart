// create questions model here

class Question {
  // define how a question will lokok like
  final String id;
  final String title;
  final Map<String, bool> options;

  // options will be like - {'1' => true, '2' => false}

  // constructor
  Question({required this.id, required this.title, required this.options});

  // override the toString method to print the questions on console
  @override
  String toString() {
    return 'Question(id: $id, title: $title, options: $options)';
  }
}
