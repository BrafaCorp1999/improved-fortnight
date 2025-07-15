import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wink/core/common/view_models/grid_layout_view_model.dart';
import 'package:wink/core/common/view_models/section_heading_view_model.dart';
import 'package:wink/core/common/widgets/section_heading.dart' show SectionHeading;
import 'package:wink/core/common/widgets/vertical_product_card.dart';
import 'package:wink/core/cubits/banner_carousel_slider_cubit_cubit/banner_carousel_slider_cubit.dart';
import 'package:wink/core/utils/constants/colors.dart';
import 'package:wink/core/utils/helpers/helper_functions.dart';
import 'package:wink/core/utils/service_locator/service_locator.dart';
import 'package:wink/features/auth/presentation/widgets/grid_layout.dart';
import 'package:wink/features/shop/presentation/controller/shop_cubit.dart';
import 'package:wink/features/shop/presentation/views/all_products_view.dart';
import 'package:wink/features/shop/presentation/widgets/home_header_section.dart';
import 'package:wink/features/shop/presentation/widgets/promo_banner_carousel_slider.dart';

// Aquí importa tus paquetes reales del proyecto para banners, productos, etc.

const Color babyPinkUltraLight = Color(0xFFFFF0F1); // Más clarito aún
const Color softGold = Color(0xFFFFD700);

class NewHomeView extends StatelessWidget {
  const NewHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: babyPinkUltraLight,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- Header y banners originales ---
              const HomeHeaderSection(),
              const SizedBox(height: 16),
              BlocProvider(
                create: (context) => BannerCarouselSliderCubit(),
                child: const PromoBannerCarouselSlider(),
              ),
              const SizedBox(height: 24),

              // --- Sección accesos rápidos ---
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "Accesos rápidos",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Grid con accesos rápidos (sin scroll interno para evitar overflow)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 3,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  children: [
                    QuickAccessButton(
                      icon: Icons.question_mark,
                      label: "¿Qué me pongo?",
                      onPressed: (){nextPage();},
                    ),
                    QuickAccessButton(
                      icon: Icons.auto_awesome,
                      label: "AI Stylist",
                      onPressed: (){nextPage();},
                    ),
                    QuickAccessButton(
                      icon: Icons.favorite_border,
                      label: "Favoritos",
                      onPressed: (){nextPage();},
                    ),
                    QuickAccessButton(
                      icon: Icons.store,
                      label: "Tiendas",
                      onPressed: (){nextPage();},
                    ),
                    QuickAccessButton(
                      icon: Icons.search,
                      label: "Buscar prenda",
                      onPressed: (){nextPage();},
                    ),
                    QuickAccessButton(
                      icon: Icons.checkroom,
                      label: "Mi Armario",
                      onPressed: (){nextPage();},
                    ),
                    QuickAccessButton(
                      icon: Icons.add_photo_alternate,
                      label: "Publicar outfit",
                      onPressed: (){nextPage();},
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              // --- Productos originales ---
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SectionHeading(
                  sectionHeadingModel: SectionHeadingModel(
                    title: "Top Rated Products",
                    showActionButton: true,
                    textColor: TColors.primary,
                    actionButtonOnPressed: () {
                      THelperFunctions.navigateToScreen(
                        context,
                        BlocProvider(
                          create: (context) => getIt<ShopCubit>()
                            ..getSortedProducts(sortBy: 'rating', sortType: "desc"),
                          child: const AllProductsView(),
                        ),
                      );
                    },
                    actionButtonTitle: "View All",
                  ),
                ),
              ),
              const SizedBox(height: 16),
              BlocBuilder<ShopCubit, ShopState>(
                builder: (context, state) {
                  if (state is ShopError) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(state.error.message),
                    );
                  }
                  if (state is ShopSortedProductsLoaded) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: GridLayout(
                        gridLayoutModel: GridLayoutModel(
                          itemCount: state.productsList.length,
                          itemBuilder: (context, index) {
                            return VerticalProductCard(
                            index: index,
                              product: state.productsList[index],
                            );
                          },
                          mainAxisExtent: 288,
                        ),
                      ),
                    );
                  }
                  return const NewHomeView();
                },
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
  
  void nextPage() {}
}

class QuickAccessButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  const QuickAccessButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    // Ajusta tamaño y texto para evitar overflow
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(20),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: softGold, width: 2),
              boxShadow: [
                BoxShadow(
                  color: softGold.withOpacity(0.3),
                  blurRadius: 8,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            padding: const EdgeInsets.all(18), // un poco menos padding
            child: Icon(icon, size: 28, color: softGold), // ícono un poco más pequeño
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: const TextStyle(
              fontSize: 12, // tamaño un poco menor
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );

  }

}
