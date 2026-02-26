import 'package:app/week6_small_practice/ui/screens/library/library_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//
//  Launch the application with the given list of providers
//
void mainCommon(List<Provider> providers) {
  runApp(
    MultiProvider(
      providers: providers,
      child: MaterialApp(home: LibraryScreen()),
    ),
  );
}
