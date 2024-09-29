import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shop_rau/views/grocery_on_board.dart';

import 'Utils/constants.dart';

void main() {
  runApp(const MyApp());
}
 class MyApp extends StatefulWidget {
   const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    // Thay đổi màu của status bar
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
     systemNavigationBarColor: backgroundColor
    ));
  }
   @override
   Widget build(BuildContext context) {
     return const MaterialApp(
       debugShowCheckedModeBanner: false,
       home: GroceryOnBoard(),
     );
   }
}



 
