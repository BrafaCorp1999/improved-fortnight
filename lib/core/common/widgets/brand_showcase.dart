import 'package:flutter/material.dart';
import 'package:wink/core/common/view_models/brand_card_view_model.dart';
import 'package:wink/core/common/view_models/brand_showcase_view_model.dart';
import 'package:wink/core/common/view_models/circular_container_view_model.dart';
import 'package:wink/core/utils/constants/colors.dart';
import 'package:wink/core/utils/constants/sizes.dart';
import 'package:wink/core/utils/helpers/helper_functions.dart';
import 'package:wink/core/common/widgets/brand_card.dart';
import 'package:wink/core/common/widgets/circular_container.dart';

class BrandShowcase extends StatelessWidget {
  const BrandShowcase(
    this.brandShowcaseModel, {
    super.key,
  });

  final BrandShowcaseModel brandShowcaseModel;

  @override
  Widget build(BuildContext context) {
    final brandIcon = brandShowcaseModel.brandCardModel.image;
    final brandTitle = brandShowcaseModel.brandCardModel.brandName;
    final products = brandShowcaseModel.topThreeProductsOfBrand;
    return Column(
      children: [
        CircularContainer(
            circularContainerModel: CircularContainerModel(
                color: Colors.transparent,
                borderColor: TColors.darkGrey,
                padding: const EdgeInsets.all(TSizes.md),
                margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
                showBorder: true,
                child: Column(
                  children: [
                    BrandCard(
                      brandCardModel: BrandCardModel(
                          showBorder: false,
                          productCount: 4,
                          image: brandIcon,
                          brandName: brandTitle),
                    ),
                    Row(
                      children: products
                          .map((product) =>
                              brandTopProductsWidget(context, product))
                          .toList(),
                    ),
                  ],
                )))
      ],
    );
  }

  Expanded brandTopProductsWidget(BuildContext context, String product) {
    final dark = THelperFunctions.isDarkMode(context);
    return Expanded(
      child: CircularContainer(
        circularContainerModel: CircularContainerModel(
            padding: const EdgeInsets.all(TSizes.md),
            margin: const EdgeInsets.only(right: TSizes.sm),
            height: 100,
            color: dark ? TColors.darkerGrey : TColors.light,
            child: Image(
              image: AssetImage(
                product,
              ),
              fit: BoxFit.contain,
            )),
      ),
    );
  }
}
