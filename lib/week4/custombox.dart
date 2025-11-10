import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              CustomBox(
                text: "Hello 1",
                start: Color(0xFF457DF5),
                end: Color(0xFF0335B6),
              ),
              CustomBox(text: "Hello 2", start: Colors.blue, end: Colors.red),
              CustomBox(
                text: "Hello 3",
                start: Colors.pink,
                end: Colors.purple,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

class CustomBox extends StatelessWidget {
  final String text;
  final Color start;
  final Color end;

  const CustomBox({
    super.key,
    required this.text,
    required this.start,
    required this.end,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(40),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.topRight,
          colors: [start, end],
        ),
      ),
      child: Text(text, style: TextStyle(fontSize: 35, color: Colors.white)),
    );
  }
}
