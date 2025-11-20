import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: ScoreDemo()));
}

class ScoreDemo extends StatelessWidget {
  const ScoreDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Score Bar")),
      body: ListView(
        children: [
          ScoreBar(title: "Math Score"),
          ScoreBar(title: "Flutter Score"),
          ScoreBar(title: "Art Score"),
        ],
      ),
    );
  }
}

class ScoreBar extends StatefulWidget {
  final String title;
  const ScoreBar({super.key, required this.title});

  @override
  State<ScoreBar> createState() => _ScoreBarState();
}

class _ScoreBarState extends State<ScoreBar> {
  int score = 0;
  final int maxScore = 10;

  void increaseScore() {
    setState(() {
      if (score < maxScore) score += 1;
    });
  }

  void decreaseScore() {
    setState(() {
      if (score > 0) score -= 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    double progress = score / maxScore;

    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.lightBlue,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            widget.title,
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),

          Text(
            "Score: $score",
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 10),

          Container(
            width: 250,
            height: 25,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey.shade300,
            ),
            
            child: Stack(
              children: [
                FractionallySizedBox(
                  widthFactor: progress,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.green,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: increaseScore,
                child: const Text("Increase"),
              ),

              const SizedBox(width: 20),

              ElevatedButton(
                onPressed: decreaseScore,
                child: const Text("Decrease"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
