import 'package:app_shop/Provider/cart_provider.dart';
import 'package:app_shop/constains.dart';
import 'package:app_shop/screens/Cart/Widlets/check_out.dart';
import 'package:app_shop/screens/Cart/Widlets/span_product_cart.dart';
import 'package:app_shop/screens/nav_bar_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = CartProvider.of(context);
    final finalList = provider.cart;
    return Scaffold(
      bottomSheet: const CheckOut(),
      backgroundColor: kcontentColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const BottomNavBar()));
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                    ),
                    style: IconButton.styleFrom(
                        backgroundColor: Colors.white,
                        padding: const EdgeInsets.all(15)),
                  ),
                  const Text(
                    "My Cart",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    textAlign: TextAlign.center,
                  ),
                  Container()
                ],
              ),
            ),
            SpanProductCart(cartItems: finalList, provider: provider)
          ],
        ),
      ),
    );
  }
}
