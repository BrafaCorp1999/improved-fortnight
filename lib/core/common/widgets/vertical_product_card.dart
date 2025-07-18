import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:wink/core/common/view_models/brand_title_with_verification_view_model.dart';
import 'package:wink/core/common/view_models/circular_container_view_model.dart';
import 'package:wink/core/common/view_models/circular_icon_view_model.dart';
import 'package:wink/core/common/view_models/product_price_text_view_model.dart';
import 'package:wink/core/common/view_models/product_title_text_view_model.dart';
import 'package:wink/core/common/view_models/rounded_image_view_model.dart';
import 'package:wink/core/common/widgets/add_to_cart_container.dart';
import 'package:wink/core/common/widgets/brand_title_with_verification.dart';
import 'package:wink/core/common/widgets/circular_container.dart';
import 'package:wink/core/common/widgets/circular_icon.dart';
import 'package:wink/core/common/widgets/product_price_text.dart';
import 'package:wink/core/common/widgets/product_title_text.dart';
import 'package:wink/core/common/widgets/rounded_image.dart';
import 'package:wink/core/common/widgets/sale_tag.dart';
import 'package:wink/core/utils/constants/colors.dart';
import 'package:wink/core/utils/constants/shadow_styles.dart';
import 'package:wink/core/utils/constants/sizes.dart';
import 'package:wink/core/utils/helpers/helper_functions.dart';
import 'package:wink/features/shop/domain/entities/product_entity.dart';
import 'package:wink/features/shop/presentation/views/product_details_view.dart';

class VerticalProductCard extends StatelessWidget {
  const VerticalProductCard({super.key, required this.product, required this.index});
  final ProductEntity product;
  final int index;
  @override
  Widget build(BuildContext context) {
    debugPrint("title1: "+product.title[0].toString());
    debugPrint("image1: "+product.images[0].toString());

    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () {
        THelperFunctions.navigateToScreen(context, const ProductDetailsView());
      },
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
            boxShadow: [TShadowStyle.verticalProductCardShadow],
            borderRadius: const BorderRadius.all(
              Radius.circular(TSizes.productImageRadius),
            ),
            color: dark ? TColors.darkerGrey : TColors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircularContainer(
              circularContainerModel: CircularContainerModel(
                  padding: const EdgeInsets.all(TSizes.sm),
                  height: 180,
                  color: dark ? TColors.dark : TColors.light,
                  child: Stack(
                    children: [
                      RoundedImage(
                        roundedImageModel: RoundedImageModel(
                            isNetworkImage: false,
                            backgroundColor:
                                dark ? TColors.dark : TColors.light,
                            image: product.images[index],
                            onTap: () {},
                            applyImageRadius: true),
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     SaleTag(
                      //       discountPercentage: product.discountPercentage,
                      //     ),
                      //     CircularIcon(
                      //       circularIconModel: CircularIconModel(
                      //         height: TSizes.iconLg * 1.2,
                      //         width: TSizes.iconLg * 1.2,
                      //         iconSize: TSizes.iconMd,
                      //         icon: Iconsax.heart5,
                      //         color: Colors.red,
                      //         backgroundColor:
                      //             dark ? TColors.darkerGrey : TColors.white,
                      //         onPressed: () {},
                      //       ),
                      //     ),
                      //   ],
                      // ),
                    ],
                  )),
            ),
            Padding(
                padding: const EdgeInsets.only(left: TSizes.sm),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProductTitleText(
                        productTitleTextModel: ProductTitleTextModel(
                            title: product.title,),
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwItems / 2,
                      ),
                      BrandTitleWithVerification(
                          brandTitleWithVerificationModel:
                              BrandTitleWithVerificationModel(
                        brandName: product.brand,
                      )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: ProductPriceText(
                              productPriceTextModel: ProductPriceTextModel(
                                currencySymbol: "\$",
                                price: product.price.toString(),
                                maxLines: 1,
                                smallSize: true,
                              ),
                            ),
                          ),
                          const AddToCartContainer()
                        ],
                      ),
                    ]))
          ],
        ),
      ),
    );
  }
}
