import 'package:flutter/material.dart';
import 'package:wink/features/personalization/presentation/view_models/profile_entity_tile_model.dart';
import 'package:wink/features/personalization/presentation/widgets/profile_entity_tile.dart';

class ProfileEntityTileList extends StatelessWidget {
  const ProfileEntityTileList(
      {super.key, required this.profileEntityTileModelList});
  final List<ProfileEntityTileModel> profileEntityTileModelList;
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: profileEntityTileModelList
          .map((profileEntityTileModel) => ProfileEntityTile(
                profileEntityTileModel: profileEntityTileModel,
              ))
          .toList(),
    );
  }
}
