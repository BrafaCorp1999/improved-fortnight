import 'package:flutter/material.dart';
import 'package:wink/core/common/view_models/search_container_view_model.dart';
import 'package:wink/core/utils/constants/colors.dart';
import 'package:wink/core/utils/constants/sizes.dart';
import 'package:wink/core/utils/device/device_utility.dart';
import 'package:wink/core/utils/helpers/helper_functions.dart';

class SearchContainer extends StatelessWidget {
  const SearchContainer({
    super.key,
    required this.searchContainerModel,
  });
  final SearchContainerModel searchContainerModel;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Padding(
      padding: searchContainerModel.padding,
      child: GestureDetector(
        onTap: searchContainerModel.onPressed,
        child: Container(
          width: TDeviceUtils.getScreenWidth(context),
          padding: const EdgeInsets.all(TSizes.md),
          decoration: BoxDecoration(
            color: searchContainerModel.showBackground
                ? dark
                    ? TColors.dark
                    : TColors.light
                : Colors.transparent,
            borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
            border: searchContainerModel.showBorder
                ? Border.all(
                    color: TColors.grey,
                  )
                : null,
          ),
          child: Row(
            children: [
              Icon(searchContainerModel.icon, color: TColors.darkGrey),
              const SizedBox(width: TSizes.spaceBtwItems),
              Text(
                searchContainerModel.title,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//search container model
