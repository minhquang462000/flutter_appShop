import 'package:flutter/material.dart';
import 'package:shop_rau/Widlets/header_part.dart';
import 'package:shop_rau/Widlets/product_item_display.dart';
import 'package:shop_rau/views/product_detail_screen.dart';

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
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ProductDetailScreen(
                        product: grocery[index],
                      ),
                    ),
                  );
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
      const Padding(
        padding: EdgeInsets.only(top: 15, left: 20),
        child: Text(
          "RecentShop",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            children: List.generate(
                grocery.length,
                (index) => GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => ProductDetailScreen(
                                    product: grocery[index])));
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          width: size.width * 0.9,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: grocery[index].color.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                width: 50,
                                height: 50,
                                padding: const EdgeInsets.all(10),
                                child: Image.asset(grocery[index].image),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    grocery[index].name,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  Text(
                                    grocery[index].category,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey,
                                        fontSize: 12),
                                  )
                                ],
                              ),
                              const Spacer(),
                              Text(
                                '\$${grocery[index].price}',
                                style: const TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              )
                            ],
                          ),
                        ),
                      ),
                    )),
          ),
        ),
      )
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
                        category == "ALL"
                            ? grocery = groceryItems
                            : grocery = groceryItems
                                .where((element) =>
                                    element.category.toLowerCase() ==
                                    category.toLowerCase())
                                .toList();
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
