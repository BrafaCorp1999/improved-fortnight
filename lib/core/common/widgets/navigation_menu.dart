import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:wink/core/cubits/navigation_menu_cubit/navigation_menu_cubit.dart';
import 'package:wink/core/utils/constants/colors.dart';
import 'package:wink/core/utils/constants/text_strings.dart';
import 'package:wink/core/utils/helpers/helper_functions.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationMenuCubit, NavigationMenuState>(
      builder: (context, state) {
        final selectedIndex = context.read<NavigationMenuCubit>().selectedIndex;
        final dark = THelperFunctions.isDarkMode(context);
        return Scaffold(
            bottomNavigationBar: NavigationBar(
              elevation: 0,
              height: 80,
              backgroundColor: dark ? TColors.black : Colors.white,
              indicatorColor: dark
                  ? TColors.white.withValues(alpha: 0.1)
                  : TColors.black.withValues(alpha: 0.1),
              selectedIndex: selectedIndex,
              onDestinationSelected: (int index) {
                context.read<NavigationMenuCubit>().changeIndex(index);
              },
              destinations: const [
                //home store wishlist profile
                NavigationDestination(
                  icon: Icon(Iconsax.home),
                  label: TTexts.homeView,
                ),
                NavigationDestination(
                  icon: Icon(Iconsax.shop),
                  label: TTexts.storeView,
                ),
                NavigationDestination(
                  icon: Icon(Iconsax.heart),
                  label: TTexts.wishlistView,
                ),
                NavigationDestination(
                  icon: Icon(Iconsax.user),
                  label: TTexts.profileView,
                ),
              ],
            ),
            body: context.read<NavigationMenuCubit>().getScreen());
      },
    );
  }
}
