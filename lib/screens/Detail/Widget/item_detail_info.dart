import 'package:app_shop/constains.dart';
import 'package:app_shop/models/product_model.dart';
import 'package:flutter/material.dart';

class ItemDetailInfo extends StatelessWidget {
  final Product item;

  const ItemDetailInfo({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          item.title,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 25),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "\$${item.price}",
                  style: const TextStyle(
                      fontWeight: FontWeight.w900, fontSize: 20),
                ),
                Row(
                  children: [
                    Container(
                      width: 50,
                      height: 25,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: kprimaryColor),
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      alignment: Alignment.center,
                      child: Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.white,
                            size: 15,
                          ),
                          Text(
                            item.rate.toString(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      "${item.review}",
                      style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                )
              ],
            ),
            const Spacer(),
            Text.rich(TextSpan(children: [
              const TextSpan(
                text: "Seller:",
                style: TextStyle(fontSize: 16),
              ),
              TextSpan(
                text: item.seller,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ])),
          ],
        )
      ],
    );
  }
}
