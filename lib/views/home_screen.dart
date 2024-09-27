import 'package:flutter/material.dart';
import 'package:shop_rau/Widlets/header_part.dart';
import 'package:shop_rau/Widlets/product_item_display.dart';

import '../Utils/constants.dart';
import '../model/product.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String category = 'ALL';
  List<Grocery> grocery = groceryItems;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      const HeaderPart(),
      const SizedBox(height: 30),
      // for search
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Container(
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white),
                child: const Center(
                  child: TextField(
                    // onChanged: (){},
                    decoration: InputDecoration(
                        prefixIcon:
                            Icon(Icons.search, color: Colors.grey, size: 30),
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        hintText: "Search Grocery",
                        hintStyle: TextStyle(fontSize: 18, color: Colors.grey)),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.green[50],
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Icon(
                Icons.tune_rounded,
                color: Colors.green,
              ),
            )
          ],
        ),
      ),
      const SizedBox(height: 20),
      //for category
      categoryItems(),
      const SizedBox(height: 20),
      // display the category items
      //Scroll view
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Row(
                        children: List.generate(
                          grocery.length,
                              (index) => GestureDetector(
                            onTap: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (_) => ProductItemDisplay(
                              //       product: grocery[index],
                              //     ),
                              //   ),
                              // );
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: ProductItemDisplay(
                                product: grocery[index],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
    ])));
  }

  Padding categoryItems() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
              groceryCategories.length,
              (index) => GestureDetector(
                    onTap: () {
                      setState(() {
                        category = groceryCategories[index];
                        // category == "ALL"
                        //     ? grocery = groceryItems
                        //     : grocery = groceryItems
                        //         .where((element) =>
                        //             element.category.toLowerCase() ==
                        //             category.toLowerCase())
                        //         .toList();
                      });
                    },
                    child: SizedBox(
                      height: 50,
                      child: Column(
                        children: [
                          Text(
                            groceryCategories[index],
                            style: TextStyle(
                              fontSize: category == groceryCategories[index]
                                  ? 18
                                  : 16,
                              color: category == groceryCategories[index]
                                  ? textGreen
                                  : Colors.black26,
                              fontWeight: category == groceryCategories[index]
                                  ? FontWeight.w900
                                  : FontWeight.w500,
                            ),
                          ),
                          category == groceryCategories[index]
                              ? const CircleAvatar(
                                  radius: 4,
                                  backgroundColor: textGreen,
                                )
                              : const SizedBox(),
                        ],
                      ),
                    ),
                  ))),
    );
  }
}
