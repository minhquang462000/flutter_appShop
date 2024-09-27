import 'package:flutter/material.dart';
import 'package:shop_rau/views/grocery_on_board.dart';

void main() {
  runApp(const MyApp());
}
 class MyApp extends StatelessWidget {
   const MyApp({super.key});
 
   @override
   Widget build(BuildContext context) {
     return const MaterialApp(
       debugShowCheckedModeBanner: false,
       home: GroceryOnBoard(),
     );
   }
 }



 
