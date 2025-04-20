import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:real_estate_app/feature/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        fontFamily: 'Euclid Circular A',
        useMaterial3: true,
      ),
      home: const MainScreen(),
    );
  }
}
