import 'package:flutter/material.dart';
import 'package:shop_figure/screens/bottom_navigate_bar_cus.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Shop_Fg",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true
      ),
      home: const BottomNavigateBarCus(),
      debugShowCheckedModeBanner: false,
    );
  }

}
