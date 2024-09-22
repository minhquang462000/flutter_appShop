import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_figure/constain.dart';

import 'bottom_navigate_bar_cus.dart';

class HeaderCustom extends StatelessWidget {
  const HeaderCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: false,
      // Giữ header khi cuộn
      floating: true,
      // Hiệu ứng hiện lên khi cuộn lên
      expandedHeight: 50,
      flexibleSpace: FlexibleSpaceBar(
          background: Container(
        color: kheaderColor,
        padding: const EdgeInsets.only(left: 8, right: 5, top: 5, bottom: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 5,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BottomNavigateBarCus()));
                },
                child: Image.asset(
                  "assets/images/logo.png",
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
                flex: 10,
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(
                      left: 10, right: 3, top: 3, bottom: 3),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Flexible(
                          flex: 3,
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Bạn đang tìm gì...",
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  color: Colors.grey,
                                  fontSize: 16),
                            ),
                          )),
                      Expanded(
                        child: Container(
                          height: double.infinity,
                          decoration: BoxDecoration(
                              color: kheaderColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Icon(
                            Icons.search_outlined,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                )),
            Expanded(
                flex: 4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: const Icon(
                        Icons.person_2_outlined,
                        color: Colors.white,
                      ),
                    ),
                    Stack(children: [
                      GestureDetector(
                        onTap: () {},
                        child: const Icon(
                          Icons.favorite_border,
                          color: Colors.white,
                        ),
                      ),
                      Positioned(
                          top: 0,
                          left: 0,
                          child: Container(
                            alignment: Alignment.center,
                            width: 15,
                            height: 15,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: const Color(0xffff0000),
                                border:
                                    Border.all(color: Colors.white, width: 1)),
                            child: const Text(
                              "46",
                              style: TextStyle(
                                  fontSize: 8,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ))
                    ]),
                    Stack(children: [
                      GestureDetector(
                        onTap: () {},
                        child: const Icon(
                          Icons.shopping_cart_outlined,
                          color: Colors.white,
                        ),
                      ),
                      Positioned(
                          top: 0,
                          left: 0,
                          child: Container(
                            alignment: Alignment.center,
                            width: 15,
                            height: 15,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: const Color(0xffff0000),
                                border:
                                    Border.all(color: Colors.white, width: 1)),
                            child: const Text(
                              "46",
                              style: TextStyle(
                                  fontSize: 8,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ))
                    ]),
                  ],
                ))
          ],
        ),
      )),
    );
  }
}
