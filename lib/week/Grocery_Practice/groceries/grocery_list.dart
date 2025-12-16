import 'package:app/week/Grocery_Practice/models/grocery.dart';
import 'package:flutter/material.dart';
import '../data/mock_grocery_repository.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  void onCreate() {
    // TODO-4 - Navigate to the form screen using the Navigator push
  }

// this widget is use to create groceryList 
  Widget _groceryList(BuildContext context, int index) {
    return ListTile(
      title: Text(dummyGroceryItems[index].name),
      leading: Container(
        width: 15,
        height: 15,
        color: dummyGroceryItems[index].category.color,
      ),
      trailing: Text(dummyGroceryItems[index].quantity.toString()),
      onTap: (){},
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(child: Text('No items added yet.'));

    if (dummyGroceryItems.isNotEmpty) {
      // TODO-1 - Display groceries with an Item builder and  LIst Tile
      content = ListView.builder(
        itemBuilder: (context, index) => _groceryList(context, index),
        itemCount: dummyGroceryItems.length,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
        actions: [IconButton(onPressed: () => {}, icon: const Icon(Icons.add))],
      ),
      body: content,
    );
  }
}

class GroceryTile extends StatelessWidget {
  const GroceryTile({super.key, required this.grocery});

  final Grocery grocery;

  @override
  Widget build(BuildContext context) {
    // TODO-2 - Display groceries with an Item builder and  LIst Tile
    return const Text("TODO");
  }
}
