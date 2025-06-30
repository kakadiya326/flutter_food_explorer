import 'package:flutter/material.dart';
import 'screens/categories_screen.dart';

void main() {
  runApp(FoodApp());
}

class FoodApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food App',
      theme: ThemeData(primarySwatch: Colors.orange),
      home: CategoriesScreen(),
    );
  }
}
