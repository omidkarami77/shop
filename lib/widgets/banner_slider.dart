import 'package:flutter/material.dart';
import 'package:shop/constants/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BannerSlider extends StatelessWidget {
  const BannerSlider({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = PageController(viewportFraction: 0.8);

    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        SizedBox(
          height: 200,
          child: PageView.builder(
            controller: controller,
            itemBuilder: ((context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 12, right: 12),
                child: Container(
                  color: Colors.red,
                  child: Center(
                    child: Text(
                      'Page $index',
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                  ),
                ),
              );
            }),
            itemCount: 3,
          ),
        ),
        Positioned(
          bottom: 10,
          child: SmoothPageIndicator(
            controller: controller,
            count: 3,
            effect: ExpandingDotsEffect(
              expansionFactor: 5,
              dotHeight: 10,
              dotColor: Colors.white,
              activeDotColor: ColorApplication.blueIndicator,
              dotWidth: 10,
            ),
          ),
        ),
      ],
    );
  }
}
