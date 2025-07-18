import 'package:flutter/material.dart';
import 'package:wink/core/common/view_models/circular_icon_view_model.dart';
import 'package:wink/core/utils/constants/colors.dart';
import 'package:wink/core/utils/helpers/helper_functions.dart';

class CircularIcon extends StatelessWidget {
  const CircularIcon({
    super.key,
    required this.circularIconModel,
  });
  final CircularIconModel circularIconModel;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
        height: circularIconModel.height,
        width: circularIconModel.width,
        decoration: BoxDecoration(
          color: circularIconModel.backgroundColor ??
              (dark
                  ? TColors.black.withValues(alpha: .9)
                  : TColors.white.withValues(alpha: .9)),
          borderRadius: const BorderRadius.all(
            Radius.circular(100),
          ),
        ),
        child: IconButton(
          onPressed: circularIconModel.onPressed,
          icon: Icon(
            circularIconModel.icon,
            size: circularIconModel.iconSize,
            color: circularIconModel.color,
          ),
        ));
  }
}

//circular icon model
