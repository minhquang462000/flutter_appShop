import 'package:flutter/material.dart';
import 'package:shop_rau/Utils/constants.dart';
import 'package:shop_rau/Widlets/bottom_nav_bar.dart';

class GroceryOnBoard extends StatelessWidget {
  const GroceryOnBoard({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          ClipPath(
            clipper: ClipPathOnBoard(),
            child: Container(
              color: onboardbackground,
              width: size.width,
              height: size.height * 0.6,
              child: Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Image.asset(
                  "assets/grocery/onboarding_profile.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.4,
            child: Column(
              children: [
                const SizedBox(height: 30),
                const Text(
                  "Buy Groceries \nEasilly With US",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
                ),
                const SizedBox(height: 30),
                const Text(
                  "Listen podcast and open your \nworld with this application",
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w800,
                      fontSize: 18),
                ),
                const SizedBox(height: 30),
                TextButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                          builder: (_) => const BottomNavBar()), (
                          route) => false);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          gradient: gradientColor),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 60, vertical: 25),
                      child: const Text(
                        "Get Started",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ClipPathOnBoard extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
        size.width / 2, size.height - 70, size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
