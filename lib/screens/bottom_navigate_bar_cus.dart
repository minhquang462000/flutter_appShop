import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'AdressShop/address_shop_screen.dart';
import 'Holine/hotline_screen.dart';
import 'Home/home_screen.dart';

class BottomNavigateBarCus extends StatefulWidget {
  const BottomNavigateBarCus({super.key});

  @override
  State<BottomNavigateBarCus> createState() => _BottomNavigateBarCusState();
}

class _BottomNavigateBarCusState extends State<BottomNavigateBarCus> {
  int currentIndex = 0;
  List screen = const [
    HomeScreen(),
    HomeScreen(),
    AddressShopScreen(),
    HotlineScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        elevation: 1,
        height: 55,
        padding: const EdgeInsets.only(top: 8, bottom: 3),
        notchMargin: 10,
        color: Colors.white,
        shape: const CircularNotchedRectangle(),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  currentIndex = 0;
                });
              },
              borderRadius: BorderRadius.circular(100),
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  currentIndex == 0
                      ? Colors.red.withOpacity(0.5)
                      : Colors.grey.withOpacity(0.5),
                  BlendMode.srcATop,
                ),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/icons/home.png',
                      width: 25,
                      height: 25,
                    ),
                    const Text(
                      "Trang chủ",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  currentIndex = 1;
                });
              },
              borderRadius: BorderRadius.circular(100),
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  currentIndex == 1
                      ? Colors.red.withOpacity(0.5)
                      : Colors.grey.withOpacity(0.5),
                  BlendMode.srcATop,
                ),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/icons/category.png',
                      width: 25,
                      height: 25,
                    ),
                    const Text(
                      "Danh mục",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  currentIndex = 2;
                });
              },
              borderRadius: BorderRadius.circular(100),
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  currentIndex == 2
                      ? Colors.red.withOpacity(0.5)
                      : Colors.grey.withOpacity(0.5),
                  BlendMode.srcATop,
                ),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/icons/location.png',
                      width: 25,
                      height: 25,
                    ),
                    const Text(
                      "Cửa hàng",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  currentIndex = 3;
                });
              },
              borderRadius: BorderRadius.circular(100),
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  currentIndex == 3
                      ? Colors.red.withOpacity(0.5)
                      : Colors.grey.withOpacity(0.5),
                  BlendMode.srcATop,
                ),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/icons/phone-call.png',
                      width: 25,
                      height: 25,
                    ),
                    const Text(
                      "Hotline",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: screen[currentIndex],
    );
  }
}
