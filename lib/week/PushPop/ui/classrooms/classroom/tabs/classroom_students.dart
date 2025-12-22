import 'package:flutter/material.dart';

class ClassroomStudents extends StatelessWidget {
  final String classroomId;
  const ClassroomStudents({super.key, required this.classroomId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Students for classroom : $classroomId")),
    );
  }
}
