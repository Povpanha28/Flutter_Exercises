import 'package:flutter/material.dart';

void main() {
  MaterialApp(
    home: Container(
      padding: EdgeInsets.all(2.2),
      margin: EdgeInsets.all(20),
      child: Column(
        children: [
          CustomButton(color: Colors.blue[300], text: "OOP"),
          CustomButton(color: Colors.blue[600], text: "Flutter"),
          CustomButton(color: Colors.blue[900], text: "Java"),
          CustomButton(
            color: Colors.blue[900],
            text: "Java",
            linear: LinearGradient(colors: [Colors.red, Colors.blue]),
          ),
        ],
      ),
    ),
  );
}

class CustomButton extends StatelessWidget {
  final Color? color;
  final String text;
  final LinearGradient? linear;
  const CustomButton({
    super.key,
    this.color,
    required this.text,
    this.linear = null,
  });
  const CustomButton.linear({
    super.key,
    this.color = null,
    required this.text,
    this.linear,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        gradient: linear,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(text, style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
