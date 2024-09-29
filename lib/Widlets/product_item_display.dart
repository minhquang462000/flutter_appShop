import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_rau/model/product.dart';

class ProductItemDisplay extends StatelessWidget {
  final Grocery product;

  const ProductItemDisplay({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.55,
      padding: const EdgeInsets.only(bottom: 30, left: 20, top: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: CupertinoColors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(children: [
            Positioned(
              bottom: 0,
              right: 50,
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(5, 5),
                      blurRadius: 30,
                      spreadRadius: 15,
                      color: product.color.withOpacity(0.3),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Center(
                child: Hero(
                  tag: product.image,
                  child: SizedBox(
                    height: 140,
                    child: Image.asset(
                      product.image,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            )
          ]),
          const SizedBox(
            height: 20,
          ),
          Text(
            product.name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.category,
                    style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '\$${product.price}',
                    style: const TextStyle(
                        color: Colors.green,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.orange[600],
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        bottomLeft: Radius.circular(15))),
                child: const Icon(
                  Icons.shopping_bag_rounded,
                  color: Colors.white,
                  size: 20,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
