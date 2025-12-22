import 'package:flutter/material.dart';

class ClassroomFeeds extends StatelessWidget {
  final String classroomId;
  const ClassroomFeeds({super.key, required this.classroomId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Feeds for classroom : $classroomId")),
    );
  }
}