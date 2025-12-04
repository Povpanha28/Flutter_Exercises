import 'package:app/week9/quiz_app/ui/screen/start.dart';
import 'package:app/week9/quiz_app/ui/screen/question.dart';
import 'package:app/week9/quiz_app/ui/screen/result.dart';
import 'package:flutter/material.dart';
import '../data//repository_mock.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int currScreenIndex = 0;
  int currQuestionIndex = 0;

  void showQuestion() {
    setState(() {
      currScreenIndex = 1;
      currQuestionIndex = 0;
    });
  }

  void showStart() {
    quiz.resetAnswer();
    setState(() {
      currScreenIndex = 0;
    });
  }

  void showNextQuestion() {
    setState(() {
      if (currQuestionIndex < quiz.questions.length - 1) {
        currQuestionIndex++;
      } else {
        showResult();
      }
    });
  }

  void showResult() {
    setState(() {
      currScreenIndex = 2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: switch (currScreenIndex) {
        0 => StartScreen(onChangeScreen: showQuestion),
        1 => QuestionScreen(
          quiz: quiz,
          onChangeScreen: showNextQuestion,
          currQuestionIndex: currQuestionIndex,
        ),
        2 => ResultScreen(quiz: quiz, onChangeScreen: showStart),
        _ => const Placeholder(), // Default case using a wildcard pattern '_'
      },
      // home: ResultScreen(quiz: quiz),
    );
  }
}
