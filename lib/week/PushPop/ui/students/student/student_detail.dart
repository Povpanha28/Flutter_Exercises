import 'package:flutter/material.dart';

class StudentDetails extends StatelessWidget {
  final String student;
  const StudentDetails({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(student)),
      body: Center(child: Text(student)),
    );
  }
}
