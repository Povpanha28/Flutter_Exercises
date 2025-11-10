import 'package:flutter/material.dart';

enum ButtonType {
  primary(color: Colors.blue),
  secondary(color: Colors.green),
  disabled(color: Colors.grey);

  final Color color;
  const ButtonType({required this.color});
}

enum IconPosition { left, right }

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Custom Buttons")),

        body: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            spacing: 10,
            children: [
              CustomButton(label: "Submit", icon: Icon(Icons.check)),
              CustomButton(
                label: "Tiktok",
                icon: Icon(Icons.tiktok),
                buttonType: ButtonType.secondary,
                iconPosition: IconPosition.right,
              ),
              CustomButton(
                label: "Disabled",
                icon: Icon(Icons.tiktok),
                buttonType: ButtonType.disabled,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String label;
  final Icon icon;
  final ButtonType buttonType;
  final IconPosition iconPosition;

  const CustomButton({
    super.key,
    required this.label,
    required this.icon,
    this.buttonType = ButtonType.primary,
    this.iconPosition = IconPosition.left,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonType.color,
        foregroundColor: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 10,
        children: iconPosition == IconPosition.left
            ? [icon, Text(label)]
            : [Text(label), icon],
      ),
    );
  }
}
