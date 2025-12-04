import 'package:app/week9/quiz_app/models/quiz.dart';

Quiz quiz = Quiz(
  questions: [
    Question(
      title: "Who is the best ?",
      correctAnswer: "Ronaldo",
      choices: ["Ronaldo", "Messi", "Neymar"],
    ),
    Question(
      title: "Which team is the best team ?",
      correctAnswer: "Real Madrid",
      choices: ["Real Madrid", "Barcelona", "ManChester United"],
    ),
  ],
);
