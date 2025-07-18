import 'package:flutter/material.dart';
import 'package:wink/core/common/view_models/section_heading_view_model.dart';
import 'package:wink/core/common/widgets/section_heading.dart';
import 'package:wink/core/utils/constants/sizes.dart';
import 'package:wink/features/personalization/presentation/view_models/profile_entity_tile_model.dart';
import 'package:wink/features/personalization/presentation/widgets/profile_entity_tile_list.dart';

class PersonalInformationSection extends StatelessWidget {
  const PersonalInformationSection({
    super.key,
    required this.personalInformation,
  });

  final List<ProfileEntityTileModel> personalInformation;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionHeading(
            sectionHeadingModel: SectionHeadingModel(
                title: "Personal Information", showActionButton: false)),
        const SizedBox(
          height: TSizes.spaceBtwItems / 1.5,
        ),
        ProfileEntityTileList(profileEntityTileModelList: personalInformation),
      ],
    );
  }
}
