import 'package:coffee_shop/screens/layout.dart';
import 'package:coffee_shop/theme/app_color.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// Main app widget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coffee Shop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: AppColor.first, // <- fond général en noir
          brightness: Brightness.dark, // <- rend les textes/icônes en clair
        colorSchemeSeed: AppColor.first
      ),
      home: Layout(), // Replace with your first screen
    );
  }
}
