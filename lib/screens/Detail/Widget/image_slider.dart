import 'package:flutter/material.dart';

class DetailImageSlider extends StatelessWidget {
  final Function(int) onChange;
  final String image;
  final int currentIndex;

  const DetailImageSlider(
      {super.key,
      required this.image,
      required this.onChange,
      required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 250,
          child: PageView.builder(
              onPageChanged: onChange,
              itemBuilder: (context, index) {
                return Hero(tag: image, child: Image.asset(image));
              }),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
              5,
              (i) => AnimatedContainer(
                    duration: const Duration(microseconds: 300),
                    width: currentIndex == i ? 15 : 8,
                    height: 8,
                    margin: const EdgeInsets.only(right: 3),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: currentIndex == i
                            ? Colors.black
                            : Colors.transparent,
                        border: Border.all(color: Colors.black)),
                  )),
        ),
      ],
    );
  }
}
