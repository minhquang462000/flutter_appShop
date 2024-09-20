import 'package:flutter/material.dart';

class DetailAppBar extends StatelessWidget {
  const DetailAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
            ),
            style: IconButton.styleFrom(
                backgroundColor: Colors.white,
                padding: const EdgeInsets.all(15)),
          ),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.share_outlined,
            ),
            style: IconButton.styleFrom(
                backgroundColor: Colors.white,
                padding: const EdgeInsets.all(15)),
          ),
          const SizedBox(width: 10),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite,
            ),
            style: IconButton.styleFrom(
                backgroundColor: Colors.white,
                padding: const EdgeInsets.all(15)),
          ),
        ],
      ),
    );
  }
}
