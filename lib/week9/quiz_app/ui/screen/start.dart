import 'package:app/week9/quiz_app/ui/widgets/appbutton.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  final VoidCallback onChangeScreen;
  const StartScreen({super.key, required this.onChangeScreen});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[500],
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Welcome to the Quiz !!",
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              Appbutton(onChangeScreen: onChangeScreen, title: "Start Quiz"),
            ],
          ),
        ),
      ),
    );
  }
}
