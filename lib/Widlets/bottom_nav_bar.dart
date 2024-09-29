import 'package:flutter/material.dart';
import 'package:shop_rau/Utils/constants.dart';
import 'package:shop_rau/views/home_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndex = 0;
  final List<Widget> pages = [
    const HomeScreen(),
    const Center(child: Text("Data")),
    const HomeScreen(),
    const Center(child: Text("Mail")),
    const Center(child: Text("Profile")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        backgroundColor: backgroundColor,
        unselectedItemColor: Colors.black12,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        items: [
          const BottomNavigationBarItem(
              icon: Icon(Icons.home_filled), label: ""),
          const BottomNavigationBarItem(
              icon: Icon(Icons.insert_chart), label: ""),
          BottomNavigationBarItem(
              icon: Container(
                padding: const EdgeInsets.all(15),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.green),
                child: const Icon(Icons.qr_code_scanner, color: Colors.white,),
              ), label: ""),
          const BottomNavigationBarItem(
              icon: Icon(Icons.email_rounded), label: ""),
          const BottomNavigationBarItem(
              icon: Icon(Icons.person_rounded), label: ""),
        ],
      ),
    );
  }
}
