import 'package:app_shop/models/categories.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  final int selectedIndex;
  final Function onChange;

  Categories({super.key, required this.selectedIndex, required this.onChange});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 110,
        child: ListView.builder(
          itemCount: categoriesList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                widget.onChange(index);
              },
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: widget.selectedIndex == index
                        ? Colors.blue[200]
                        : Colors.transparent),
                child: Column(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage(categoriesList[index].image),
                              fit: BoxFit.cover)),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      categoriesList[index].title,
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              ),
            );
          },
        ));
  }
}
