class Quiz {
  List<Question> questions;
  List<Answer> answers = [];

  Quiz({required this.questions});

  void addAnswer(Answer userAnswer) {
    // Ensure only one answer per question
    // answers.removeWhere((a) => a.question == userAnswer.question);
    answers.add(userAnswer);
  }

  int getScore() {
    int score = 0;

    for (var answer in answers) {
      if (answer.isCorrect()) {
        score++;
      }
    }
    return score;
  }

  void resetAnswer() {
    answers = [];
  }
}

class Question {
  String title;
  String correctAnswer;
  List<String> choices;

  Question({
    required this.title,
    required this.correctAnswer,
    required this.choices,
  });
}

class Answer {
  Question question;
  String userAnswer;

  Answer({required this.userAnswer, required this.question});

  bool isCorrect() {
    return question.correctAnswer == userAnswer;
  }
}
