import 'package:flutter/material.dart';

void main() {
  runApp(
    // Ex1
    const MaterialApp(
      home: Center(
        child: Text(
          'Hello! My name is Ngovseng Povpanha',
          style: TextStyle(
            color: Colors.orange,
            decoration: TextDecoration.none,
          ),
        ),
      ),
    ),
  );
}
