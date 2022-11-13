import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:shop/constants/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BannerSlider extends StatelessWidget {
  const BannerSlider({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = PageController(viewportFraction: 0.8);

    return Stack(alignment: Alignment.bottomCenter, children: [
      SizedBox(
        height: 200,
        child: PageView.builder(
          controller: controller,
          itemCount: 3,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 12, right: 12),
              child: Container(
                height: 200,
                color: Colors.red,
              ),
            );
          },
        ),
      ),
      Positioned(
        bottom: 10,
        child: SmoothPageIndicator(
            effect: const ExpandingDotsEffect(
                activeDotColor: ColorApp.blueIndicator,
                expansionFactor: 5,
                dotColor: Colors.white,
                dotHeight: 10,
                dotWidth: 10),
            controller: controller,
            count: 3),
      )
    ]);
  }
}
