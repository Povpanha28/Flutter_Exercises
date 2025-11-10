import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 100),
              Container(height: 400, color: Colors.blue),
              Row(
                children: [
                  Expanded(child: Container(color: Colors.green, height: 100)),
                  Container(color: Colors.pink, height: 100, width: 100),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(color: Colors.yellow, height: 100),
                  ),
                  SizedBox(height: 100, width: 20),
                  Expanded(
                    flex: 1,
                    child: Container(color: Colors.yellow, height: 100),
                  ),
                  SizedBox(height: 100, width: 20),

                  Expanded(
                    flex: 1,
                    child: Container(color: Colors.yellow, height: 100),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Expanded(child: Container(color: Colors.pink)),
            ],
          ),
        ),
      ),
    ),
  );
}
