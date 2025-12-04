import 'package:app/week9/quiz_app/models/quiz.dart';
import 'package:app/week9/quiz_app/ui/widgets/appbutton.dart';
import 'package:flutter/material.dart';

class QuestionScreen extends StatelessWidget {
  final Quiz quiz;
  final VoidCallback onChangeScreen;
  final int currQuestionIndex;
  const QuestionScreen({
    super.key,
    required this.onChangeScreen,
    required this.currQuestionIndex,
    required this.quiz,
  });

  void getUserAnswer(String choice) {
    quiz.addAnswer(
      Answer(userAnswer: choice, question: quiz.questions[currQuestionIndex]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[300],
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                quiz.questions[currQuestionIndex].title,
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            ...quiz.questions[currQuestionIndex].choices.map(
              (choice) => Padding(
                padding: const EdgeInsets.all(20.0),
                child: Appbutton(
                  onChangeScreen: () => {
                    onChangeScreen(),
                    getUserAnswer(choice),
                  },
                  title: choice,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
