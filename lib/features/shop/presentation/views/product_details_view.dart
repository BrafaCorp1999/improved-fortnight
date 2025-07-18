import 'package:flutter/material.dart';
import 'package:wink/core/utils/constants/sizes.dart';
import 'package:wink/features/shop/presentation/widgets/bottom_add_to_cart.dart';
import 'package:wink/features/shop/presentation/widgets/checkout_button.dart';
import 'package:wink/features/shop/presentation/widgets/product_attributes.dart';
import 'package:wink/features/shop/presentation/widgets/product_description_section.dart';
import 'package:wink/features/shop/presentation/widgets/product_image_slider.dart';
import 'package:wink/features/shop/presentation/widgets/product_metadata.dart';
import 'package:wink/features/shop/presentation/widgets/rating_and_share.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        bottomNavigationBar: BottomAddToCart(),
        body: SafeArea(
          child: SingleChildScrollView(
              child: Column(
            children: [
              ProductImageSlider(),
              Padding(
                padding: EdgeInsets.fromLTRB(TSizes.defaultSpace, 0,
                    TSizes.defaultSpace, TSizes.defaultSpace),
                child: Column(
                  children: [
                    RatingAndShare(),
                    ProductMetadata(),
                    //ProductAttributes(),
                    SizedBox(
                      height: TSizes.spaceBtwSections,
                    ),
                    CheckoutButton(),
                    SizedBox(
                      height: TSizes.spaceBtwSections,
                    ),
                    ProductDescriptionAndReviewsSection(),
                    SizedBox(height: TSizes.spaceBtwSections),
                  ],
                ),
              )
            ],
          )),
        ));
  }
}
