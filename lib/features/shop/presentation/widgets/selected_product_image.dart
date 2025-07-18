import 'package:flutter/material.dart';
import 'package:wink/core/utils/constants/image_strings.dart';
import 'package:wink/core/utils/constants/sizes.dart';

class SelectedProductImage extends StatelessWidget {
  const SelectedProductImage({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return const SizedBox(
        height: 400,
        child: Padding(
          padding: EdgeInsets.all(TSizes.productImageRadius * 3),
          child: Center(child: Image(image: AssetImage('assets/images/products/vestido-midi.png'))),
        ));
  }
}
