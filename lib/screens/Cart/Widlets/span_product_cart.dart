import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Provider/cart_provider.dart';
import '../../../constains.dart';

class SpanProductCart extends StatelessWidget {
  final List cartItems;
  final CartProvider provider;

  const SpanProductCart(
      {super.key, required this.cartItems, required this.provider});

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          final cartItem = cartItems[index];
          return Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 15, vertical: 10),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: kcontentColor,
                        ),
                        padding: const EdgeInsets.all(10),
                        child: Image.asset(
                          cartItem.image,
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            cartItem.title,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                          const SizedBox(height: 5),
                          Text(cartItem.title,
                              style: const TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12)),
                          const SizedBox(height: 10),
                          Text(
                            "\$${cartItem.price}",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 20,
                right: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {
                        cartItems.removeAt(index);
                      },
                      icon: const Icon(
                        Icons.delete_outline,
                        color: Colors.red,
                        size: 20,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      width: 80,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: kcontentColor,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          productQuantity(Icons.add, index, provider),
                          Text(
                            cartItem.quantity.toString(),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 16),
                          ),
                          productQuantity(Icons.remove, index, provider),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );;
  }
}
// Phương thức để xử lý số lượng sản phẩm
Widget productQuantity(IconData icon, int index, CartProvider provider) {
  return GestureDetector(
    onTap: () {
      icon == Icons.add
          ? provider.incrementQtn(index)
          : provider.decrementQtn(index);
    },
    child: Icon(
      icon,
      size: 16,
    ),
  );
}