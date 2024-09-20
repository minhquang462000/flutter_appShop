import 'package:app_shop/constains.dart';
import 'package:app_shop/models/product_model.dart';
import 'package:app_shop/screens/Detail/Widget/add_to_cart.dart';
import 'package:app_shop/screens/Detail/Widget/description.dart';
import 'package:app_shop/screens/Detail/Widget/image_slider.dart';
import 'package:app_shop/screens/Detail/Widget/item_detail_info.dart';
import 'package:flutter/material.dart';

import 'Widget/detail_app_bar.dart';

class DetailScreen extends StatefulWidget {
  final Product product;

  const DetailScreen({super.key, required this.product});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int currentImage = 0;
  int currentColor = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: AddToCart(product: widget.product),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      backgroundColor: kcontentColor,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //for back button, share and favorite
            const DetailAppBar(),
            // for Detail Image
            DetailImageSlider(
                image: widget.product.image,
                onChange: (index) {
                  setState(() {
                    currentImage = index;
                  });
                },
                currentIndex: currentImage),
            const SizedBox(height: 20),
            // for Info
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40),
                      topLeft: Radius.circular(40))),
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 20, bottom: 100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ItemDetailInfo(item: widget.product),
                  const SizedBox(height: 15),
                  const Text("Color",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  const SizedBox(height: 10),
                  Row(
                    children: List.generate(
                        widget.product.colors.length,
                        (index) => GestureDetector(
                              onTap: () {
                                setState(() {
                                  currentColor = index;
                                });
                              },
                              child: AnimatedContainer(
                                duration: const Duration(microseconds: 300),
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: currentColor == index
                                      ? Colors.white
                                      : widget.product.colors[index],
                                  border: currentColor == index
                                      ? Border.all(
                                          color: widget.product.colors[index])
                                      : null,
                                ),
                                padding: currentColor == index
                                    ? const EdgeInsets.all(2)
                                    : null,
                                margin: const EdgeInsets.only(right: 10),
                                child: Container(
                                  width: 20,
                                  height: 20,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: widget.product.colors[index]),
                                ),
                              ),
                            )),
                  ),
                  const SizedBox(height: 25),
                  Description(
                    description: widget.product.description,
                  )
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
