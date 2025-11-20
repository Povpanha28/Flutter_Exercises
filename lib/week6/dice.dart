import 'dart:math';
import 'package:flutter/material.dart';

const String diceImage2 = 'assets/ex5/dice-2.png';
const String diceImage1 = 'assets/ex5/dice-1.png';
const String diceImage3 = 'assets/ex5/dice-3.png';
const String diceImage5 = 'assets/ex5/dice-5.png';
const String diceImage6 = 'assets/ex5/dice-6.png';
const String diceImage4 = 'assets/ex5/dice-4.png';

List<String> diceImgList = [
  diceImage1,
  diceImage2,
  diceImage3,
  diceImage4,
  diceImage5,
  diceImage6,
];

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() => _DiceRollerState(); // it means to return the __DiceRollerState();
}

class _DiceRollerState extends State<DiceRoller> {
  String activeDiceImage = diceImage2;

  void rollDice() {
    //  Display the dice 4 !
    print("clicked");
    setState(() {
      Random random = Random();
      int randomInt = random.nextInt(6);
      print(randomInt);
      activeDiceImage = diceImgList[randomInt];
    });
  }
  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(activeDiceImage, width: 200),
        const SizedBox(height: 20),
        TextButton(
          onPressed: rollDice,
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            textStyle: const TextStyle(fontSize: 28),
          ),
          child: const Text('Roll Dice'),
        ),
      ],
    );
  }
}

void main() => runApp(
  const MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(child: DiceRoller()),
    ),
  ),
);
