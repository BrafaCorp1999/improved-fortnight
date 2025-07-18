import 'package:flutter/material.dart';
import 'package:wink/core/common/view_models/horizontal_small_list_view_item_view_model.dart';
import 'package:wink/core/common/widgets/horizontal_small_list_view.dart';
import 'package:wink/core/utils/constants/image_strings.dart';
import 'package:wink/core/utils/constants/text_strings.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const List<String> categoriesTitles = TTexts.categories;
    const List<String> categoriesImages = TImages.categoryIcons;

    final List<HorizontalSmallListViewItemModel> items = List.generate(
        categoriesImages.length,
        (index) => HorizontalSmallListViewItemModel(
              title: categoriesTitles[index],
              image: categoriesImages[index],
            ));

    return SizedBox(
      height: 100,
      child: HorizontalSmallListView(items: items),
    );
  }
}
