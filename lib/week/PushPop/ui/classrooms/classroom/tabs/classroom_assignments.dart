import 'package:flutter/material.dart';

class ClassroomAssignments extends StatelessWidget {
  final String classroomId;
  const ClassroomAssignments({super.key, required this.classroomId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Assignments for classroom : $classroomId")),
    );
  }
}
