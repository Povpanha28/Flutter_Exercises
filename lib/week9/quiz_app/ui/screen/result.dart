import 'package:app/week9/quiz_app/models/quiz.dart';
import 'package:app/week9/quiz_app/ui/widgets/appbutton.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final Quiz quiz;
  final VoidCallback onChangeScreen;
  const ResultScreen({
    super.key,
    required this.quiz,
    required this.onChangeScreen,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[300],
      body: Column(
        children: [
          Text(
            "You answered ${quiz.getScore()} on ${quiz.questions.length}: ",
            style: TextStyle(fontSize: 18),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...quiz.answers.map((answer) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(answer.question.title),
                      ...answer.question.choices.map(
                        (choice) => Row(
                          children: [
                            choice == answer.question.correctAnswer
                                ? Icon(Icons.check)
                                : Padding(padding: EdgeInsets.only(left: 25)),
                            Text(
                              choice,
                              style: choice == answer.userAnswer
                                  ? TextStyle(
                                      color:
                                          answer.userAnswer ==
                                              answer.question.correctAnswer
                                          ? Colors.green
                                          : Colors.red,
                                    )
                                  : TextStyle(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }),
              ],
            ),
          ),
          Appbutton(onChangeScreen: onChangeScreen, title: "Restart Quiz"),
        ],
      ),
    );
  }
}
