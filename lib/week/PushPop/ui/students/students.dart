import 'package:app/week/PushPop/ui/students/student/student_detail.dart';
import 'package:flutter/material.dart';

class Students extends StatelessWidget {
  const Students({super.key});

  @override
  Widget build(BuildContext context) {
    final students = ['Panha', 'Thyrak', 'Bunna'];
    return Scaffold(
      appBar: AppBar(title: const Text('students')),
      body: ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index) {
          final student = students[index];

          return ListTile(
            leading: const Icon(Icons.class_),
            title: Text(student),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // Go to the  ClassroomDetails
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => StudentDetails(student: student),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
