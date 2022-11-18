import 'package:flutter/material.dart';
import 'package:shop/constants/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: ColorApp.backgroundScreenColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 44),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: categoryHorizontalItemList(),
                );
              },
              itemCount: 10,
            ),
          ),
        ),
      ),
    );
  }
}

class categoryHorizontalItemList extends StatelessWidget {
  const categoryHorizontalItemList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Container(
              height: 56,
              width: 56,
              decoration: ShapeDecoration(
                  color: Colors.red,
                  shadows: const [
                    BoxShadow(
                      color: Colors.red,
                      blurRadius: 25,
                      spreadRadius: -14,
                      offset: Offset(0.0, 15),
                    ),
                  ],
                  shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(40))),
            ),
            const Icon(
              Icons.mouse,
              color: Colors.white,
              size: 30,
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          "hello",
          style: TextStyle(fontFamily: 'SB', fontSize: 12),
        )
      ],
    );
  }
}
