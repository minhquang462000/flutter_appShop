import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_figure/screens/header_custom.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            const HeaderCustom(),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return ListTile(
                    title: Text('Mục $index'),
                  );
                },
                childCount: 50, // Số lượng mục trong danh sách
              ),
            ),
          ],
        ),
      ),
    );
  }
}
