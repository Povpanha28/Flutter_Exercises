import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("My Hobbies")),
        body: Container(
          color: Colors.grey,
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.center, // Centers children horizontally
            children: [
              HobbyCard(
                title: "Travelling",
                icon: Icon(Icons.card_travel, color: Colors.pink),
              ),
              HobbyCard(
                title: "Skating",
                icon: Icon(Icons.skateboarding, color: Colors.pink),
                color: Colors.cyan,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

class HobbyCard extends StatelessWidget {
  final String title;
  final Color color;
  final Icon icon;
  const HobbyCard({
    super.key,
    this.color = Colors.blue,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      padding: EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),

      child: Row(
        children: [
          Container(
            // padding: EdgeInsets.symmetric(horizontal: 30),
            margin: EdgeInsets.only(left: 30, right: 20),
            child: icon,
          ),
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              decoration: TextDecoration.none,
            ),
          ),
        ],
      ),
    );
  }
}
