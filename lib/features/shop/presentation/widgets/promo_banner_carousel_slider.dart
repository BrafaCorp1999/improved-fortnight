import 'package:flutter/material.dart';
import 'package:wink/core/utils/constants/image_strings.dart';
import 'package:wink/core/utils/constants/sizes.dart';
import 'package:wink/core/common/widgets/banner_carousel_slider.dart';

class PromoBannerCarouselSlider extends StatelessWidget {
  const PromoBannerCarouselSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
      child: BannerCarouselSlider(
        images: TImages.promoBannerImages,
      ),
    );
  }
}
