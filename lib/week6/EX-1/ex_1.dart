import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Custom buttons")),
        body: const Column(
          children: [
            CustomButton(),
            SizedBox(height: 10),
            CustomButton(),
            SizedBox(height: 10),
            CustomButton(),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatefulWidget {
  const CustomButton({super.key});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool selected = false;

  String get text => selected ? "Selected" : "Not Selected";
  Color get bgColor => selected ? Colors.blue : Colors.grey[300]!;
  Color get textColor => selected ? Colors.white : Colors.black;

  void changeBtnState() {
    setState(() {
      selected = !selected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 400,
        height: 100,
        child: ElevatedButton(
          onPressed: changeBtnState, // toggle on press
          style: ElevatedButton.styleFrom(backgroundColor: bgColor),
          child: Center(
            child: Text(text, style: TextStyle(color: textColor, fontSize: 20)),
          ),
        ),
      ),
    );
  }
}
