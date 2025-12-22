import 'package:app/week/PushPop/ui/classrooms/classrooms.dart';
import 'package:app/week/PushPop/ui/students/students.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.transparent),
              child: Text('Drawer Header'),
            ),

            ListTile(
              title: const Text('Classrooms'),
              onTap: () {
                // Update the state of the app.
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Classrooms()),
                );
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('StudentsF'),
              onTap: () {
                // Update the state of the app.
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Students()),
                );
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
