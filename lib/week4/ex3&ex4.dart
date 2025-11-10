import 'package:flutter/material.dart';

void main() {
  runApp(
    // Ex3
    MaterialApp(
      home: Container(
        color: Colors.grey,
        padding: EdgeInsets.all(2.2),
        margin: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.center, // Centers children horizontally
          children: [
            CustomCard(text: "OOP", color: Colors.blue[100]!),
            CustomCard(text: "DART", color: Colors.blue[300]!),
            CustomCard(text: "FLUTTER", color: Colors.blue[600]!),
            CustomCard(
              text: "Hahaha",
              color: null,
              linear: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.blue[300]!, Colors.blue[600]!],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

// Ex 4

class CustomCard extends StatelessWidget {
  final String text;
  final Color? color;
  final LinearGradient? linear;
  const CustomCard({
    super.key,
    required this.text,
    this.color = Colors.blue,
    this.linear = null,
  });

  const CustomCard.linearGradient({
    super.key,
    required this.text,
    this.color = null,
    this.linear,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: color,
        gradient: linear,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            decoration: TextDecoration.none,
          ),
        ),
      ),
    );
  }
}
