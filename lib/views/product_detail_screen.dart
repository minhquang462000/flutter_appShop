import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:readmore/readmore.dart';
import 'package:shop_rau/Utils/constants.dart';
import 'package:shop_rau/model/product.dart';

class ProductDetailScreen extends StatefulWidget {
  final Grocery product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: headerParts(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: size.height * 0.35,
                ),
                Positioned(
                    bottom: 10,
                    right: 30,
                    left: 30,
                    child: Container(
                      height: 200,
                      decoration:
                          BoxDecoration(shape: BoxShape.circle, boxShadow: [
                        BoxShadow(
                            blurRadius: 12,
                            spreadRadius: 20,
                            color: widget.product.color.withOpacity(0.2))
                      ]),
                    )),
                ClipPath(
                  clipper: ClipPathDetail(),
                  child: Container(
                    height: size.height * 0.3,
                    width: size.width,
                    color: widget.product.color.withOpacity(0.15),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 20,
                  right: 20,
                  child: Hero(
                    tag: widget.product.image,
                    child: Image.asset(
                      widget.product.image,
                      width: size.width,
                      height: 300,
                      fit: BoxFit.contain,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 30),
            //for detail info
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.product.name,
                    style: const TextStyle(
                        fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      RatingBar.builder(
                        initialRating: widget.product.rate,
                        itemSize: 25,
                        allowHalfRating: true,
                        itemBuilder: (context, index) => const Icon(
                          Icons.star_rounded,
                          color: Colors.orange,
                        ),
                        onRatingUpdate: (rating) {},
                      ),
                      Text(
                        '\(${widget.product.rate}\)',
                        style: const TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() => quantity > 1 ? quantity-- : null);
                            },
                            child: Container(
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                  color: Colors.green[50],
                                  shape: BoxShape.circle),
                              child: const Center(
                                child: Text(
                                  "-",
                                  style: TextStyle(
                                      fontSize: 25, color: Colors.green),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            quantity.toString(),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          const SizedBox(width: 10),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                quantity++;
                              });
                            },
                            child: Container(
                              height: 35,
                              width: 35,
                              decoration: const BoxDecoration(
                                  color: Colors.green, shape: BoxShape.circle),
                              child: const Center(
                                child: Text(
                                  "+",
                                  style: TextStyle(
                                      fontSize: 25, color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Description",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  ReadMoreText(
                    '${widget.product.name} ${widget.product.description}',
                    style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        height: 1.5,
                        color: Colors.black26),
                    trimLength: 110,
                    trimCollapsedText: " Read More",
                    trimExpandedText: " Read Less",
                    colorClickableText: widget.product.color,
                    moreStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: widget.product.color),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    height: 175,
                    width: size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey.shade300,
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 60,
                          left: 70,
                          child: CircleAvatar(
                            radius: 20,
                            backgroundColor: widget.product.color,
                          ),
                        ),
                        const Positioned(
                          top: 73,
                          left: 83,
                          child: CircleAvatar(
                            radius: 7,
                            backgroundColor: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 100,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Price",
                  style: TextStyle(
                      color: Colors.black12,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: size.width * 0.3,
                  child: Text(
                    '\$${widget.product.price * quantity}',
                    style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis),
                  ),
                )
              ],
            ),
            TextButton(
              onPressed: () {},
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: gradientColor),
                child: const Text(
                  "Add to Cart",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 22),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  AppBar headerParts(BuildContext context) {
    return AppBar(
      leadingWidth: 80,
      backgroundColor: widget.product.color.withOpacity(0.15),
      actions: [
        Container(
          margin: const EdgeInsets.only(left: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), color: Colors.white),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new),
            color: widget.product.color,
          ),
        ),
        const Spacer(),
        Container(
          margin: const EdgeInsets.only(right: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), color: Colors.white),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart_outlined),
            color: widget.product.color,
          ),
        ),
      ],
    );
  }
}

class ClipPathDetail extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 50);
    path.quadraticBezierTo(
      size.width / 2,
      size.height + 50,
      size.width,
      size.height - 50,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
