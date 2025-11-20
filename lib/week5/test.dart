import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView(
          children: [
            Container(color: Colors.red, height: 100, width: 500),
            SizedBox(height: 20),
            Container(color: Colors.red, height: 100, width: 500),
            SizedBox(height: 20),

            Container(color: Colors.red, height: 100, width: 500),
            SizedBox(height: 20),

            Container(color: Colors.red, height: 100, width: 500),
            SizedBox(height: 20),

            Container(color: Colors.red, height: 100, width: 500),
            SizedBox(height: 20),
            Container(color: Colors.red, height: 100, width: 500),
            SizedBox(height: 20),
            Container(color: Colors.red, height: 100, width: 500),
            SizedBox(height: 20),
            Container(color: Colors.red, height: 100, width: 500),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
