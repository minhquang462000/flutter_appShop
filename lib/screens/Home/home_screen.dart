import 'package:app_shop/models/product_model.dart';
import 'package:app_shop/screens/Home/Widget/Image_slider.dart';
import 'package:app_shop/screens/Home/Widget/categories.dart';
import 'package:app_shop/screens/Home/Widget/product_card.dart';
import 'package:flutter/material.dart';

import 'Widget/home_app_bar.dart';
import 'Widget/search_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentSlider = 0;
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<List<Product>> selectCategories = [
      all,
      shoes,
      beauty,
      womenFashion,
      jewelry,
      menFashion
    ];
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                //Custom bar
                const CustomAppBar(),
                const SizedBox(height: 10),
                //Search bar
                const SearchBarCustom(),
                const SizedBox(height: 20),
                ImageSlider(
                    currentSlideIndex: currentSlider,
                    onChange: (value) {
                      setState(() {
                        currentSlider = value;
                      });
                    }),
                const SizedBox(height: 20),
                // Categories
                Categories(
                  selectedIndex: selectedIndex,
                  onChange: (index) {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Special For You",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
                    ),
                    Text(
                      "See all",
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                // Card Product
                GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.8,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20),
                    itemCount: selectCategories[selectedIndex].length,
                    itemBuilder: (context, index) {
                      return ProductCard(
                        product: selectCategories[selectedIndex][index],
                      );
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
