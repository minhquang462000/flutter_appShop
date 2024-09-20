import 'package:flutter/material.dart';

class ImageSlider extends StatelessWidget {
  final Function(int) onChange;
  final int currentSlideIndex;

  const ImageSlider(
      {super.key, required this.currentSlideIndex, required this.onChange});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 220,
          width: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: PageView(
              scrollDirection: Axis.horizontal,
              allowImplicitScrolling: true,
              onPageChanged: onChange,
              physics: const ClampingScrollPhysics(),
              children: [
                Image.asset(
                  "assets/images/slider.jpg",
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  "assets/images/image1.png",
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  "assets/images/slider.jpg",
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  "assets/images/slider3.png",
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
        ),
        Positioned.fill(
            bottom: 10,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                    5,
                    (i) => AnimatedContainer(
                          duration: const Duration(microseconds: 300),
                          width: currentSlideIndex == i ? 15 : 8,
                          height: 8,
                          margin: const EdgeInsets.only(right: 3),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: currentSlideIndex == i
                                  ? Colors.black
                                  : Colors.transparent,
                              border: Border.all(color: Colors.black)),
                        )),
              ),
            ))
      ],
    );
  }
}
