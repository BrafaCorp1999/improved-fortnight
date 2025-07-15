import 'package:flutter/material.dart';
import 'package:wink/core/common/view_models/app_bar_view_model.dart';
import 'package:wink/core/common/view_models/brand_card_view_model.dart';
import 'package:wink/core/common/view_models/grid_layout_view_model.dart';
import 'package:wink/core/common/view_models/section_heading_view_model.dart';
import 'package:wink/core/common/widgets/app_bar.dart';
import 'package:wink/core/common/widgets/brand_card.dart';
import 'package:wink/core/common/widgets/section_heading.dart';
import 'package:wink/core/enums/status.dart';
import 'package:wink/core/utils/constants/image_strings.dart';
import 'package:wink/core/utils/constants/sizes.dart';
import 'package:wink/core/utils/constants/text_strings.dart';
import 'package:wink/core/utils/helpers/helper_functions.dart';
import 'package:wink/features/auth/presentation/widgets/grid_layout.dart';
import 'package:wink/features/shop/presentation/views/brand_products_view.dart';

class AllBrandsView extends StatelessWidget {
  const AllBrandsView({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint("TTexts.brandTitles.length: "+TTexts.brandTitles.length.toString());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nuestras tiendas"),
        backgroundColor: Color.fromARGB(100, 158, 143, 47),
       
      ),
      body: SafeArea(
        child: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              SectionHeading(
                sectionHeadingModel: SectionHeadingModel(
                  title: "Todas las tiendas",
                  showActionButton: false,
                ),
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              GridLayout(
                  gridLayoutModel: GridLayoutModel(
                itemCount: 8,
                mainAxisExtent: 80,
                itemBuilder: (context, index) {
                  return BrandCard(
                    brandCardModel: BrandCardModel(
                      onTap: () {

                      index==1 || index == 6  
                      ?  THelperFunctions.navigateToScreen(
                          context,
                          const BrandProductsView(),
                        )
                      : THelperFunctions.showSnackBar(
          context: context,
          message: "Esta tienda está en mantenimiento, por favor inténtelo después.",
          type: SnackBarType.warning
        );

                      },
                      showBorder: true,
                      productCount: TTexts.brandTitles.length,
                      brandName: TTexts.brandTitles[index],
                      image: TImages.brandIcons[index],
                    ),
                  );
                },
              )),
            ],
          ),
        )),
      ),
    );
  }
}
