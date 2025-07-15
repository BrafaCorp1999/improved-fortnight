import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wink/core/utils/constants/sizes.dart';
import 'package:wink/core/utils/constants/text_strings.dart';
import 'package:wink/features/auth/presentation/logic/register/register_cubit.dart';
import 'package:wink/features/auth/presentation/widgets/divider_widget.dart';
import 'package:wink/features/auth/presentation/widgets/sign_in_methods_section.dart';
import 'package:wink/features/auth/presentation/widgets/sign_up_form_section.dart';

const Color babyPinkUltraLight = Color(0xFFF5DDD8); // Más clarito aún
const Color softGold = Color(0xFFFFD700);
const Color lightFrenchBeige = const Color(0xFFD0A583); // Fondo principal
const Color bittersweetShimmer = const Color(0xFFBA4353); // Encabezados y elementos destacados
const Color oliveDrabCamouflage = const Color(0xFF54E34); // Botones principales (marrón)
const Color citron = const Color(0xFFAD9F22); // Color secundario/acentos

const Color crema = const Color.fromARGB(1, 253, 252, 246);
class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: Scaffold(
      backgroundColor: const Color.fromARGB(255, 253, 252, 246),
        appBar: AppBar(),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    TTexts.signUpTitle,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  const SignUpFormSection(),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  //const DividerWidget(text: TTexts.orSignUpWith),
                  //const SizedBox(height: TSizes.spaceBtwSections),
                  //const SignInMethodsSection(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
