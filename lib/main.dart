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
        body: SafeArea(child: BannerSlider()),
      ),
    );
  }
}
