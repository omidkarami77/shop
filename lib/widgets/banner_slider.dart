import 'package:flutter/material.dart';
import 'package:shop/constants/colors.dart';
import 'package:shop/data/model/banner.dart';
import 'package:shop/widgets/catched_image.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BannerSlider extends StatelessWidget {
  final List<BannerModel> banners;
  const BannerSlider(this.banners, {super.key});

  @override
  Widget build(BuildContext context) {
    var controller = PageController(viewportFraction: 0.8);

    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        SizedBox(
          height: 178,
          child: PageView.builder(
            controller: controller,
            itemBuilder: ((context, index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: CachedImage(
                  radius: 30,
                  imageUrl: banners[index].thumbnail,
                ),
              );
            }),
            itemCount: banners.length,
          ),
        ),
        Positioned(
          bottom: 10,
          child: SmoothPageIndicator(
            controller: controller,
            count: 3,
            effect: ExpandingDotsEffect(
              expansionFactor: 5,
              dotHeight: 6,
              dotColor: Colors.white,
              activeDotColor: ColorApplication.blueIndicator,
              dotWidth: 6,
            ),
          ),
        ),
      ],
    );
  }
}
