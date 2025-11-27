import 'package:app/week8/EX4/ui/joke.dart';
import 'package:flutter/material.dart';

import 'data/jokeData.dart';

Color appColor = Colors.green[300] as Color;

void main() => runApp(MaterialApp(home: FavoriteJokeList()));

class FavoriteJokeList extends StatefulWidget {
  const FavoriteJokeList({super.key});

  @override
  State<FavoriteJokeList> createState() => _FavoriteJokeListState();
}

class _FavoriteJokeListState extends State<FavoriteJokeList> {
  int? selectedIndex; // <-- store the one active favorite

  void setFavorite(int index) {
    setState(() {
      if (selectedIndex == index) {
        selectedIndex = null; // tap again → remove favorite
      } else {
        selectedIndex = index; // switch favorite to this item
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: appColor,
        title: const Text("Favorite Jokes"),
      ),
      body: ListView.builder(
        itemCount: jokes.length,
        itemBuilder: (context, index) {
          return FavoriteCard(
            data: jokes[index],
            isFavorite: selectedIndex == index, // true for only one
            onFavoriteClick: () => setFavorite(index),
          );
        },
      ),
    );
  }
}
