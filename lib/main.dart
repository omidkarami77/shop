import 'package:flutter/material.dart';
import 'package:shop/constants/colors.dart';
import 'package:shop/widgets/banner_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
            child: Center(
                child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Container(
                  height: 56,
                  width: 56,
                  decoration: ShapeDecoration(
                      color: Colors.red,
                      shadows: [
                        BoxShadow(
                          color: Colors.red,
                          blurRadius: 60,
                          spreadRadius: -6,
                          offset: Offset(0.0, 15),
                        ),
                      ],
                      shape: ContinuousRectangleBorder(
                          borderRadius: BorderRadius.circular(40))),
                ),
                Icon(
                  Icons.mouse,
                  color: Colors.white,
                  size: 30,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text("hello")
          ],
        ))),
      ),
    );
  }
}
