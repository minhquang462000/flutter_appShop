import 'package:app_shop/Provider/cart_provider.dart';
import 'package:app_shop/Provider/favorite_provider.dart';
import 'package:app_shop/screens/nav_bar_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import "package:provider/provider.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        // statusBarIconBrightness: Brightness.dark,
        systemNavigationBarContrastEnforced: true,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarDividerColor: Colors.white));
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => CartProvider()),
          ChangeNotifierProvider(create: (_) => FavoriteProvider())
        ],
        child: MaterialApp(
          title: 'AppQuang',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const BottomNavBar(),
          debugShowCheckedModeBanner: false,
        ));
  }
}
