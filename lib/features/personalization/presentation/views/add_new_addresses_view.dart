import 'package:flutter/material.dart';
import 'package:wink/core/common/view_models/app_bar_view_model.dart';
import 'package:wink/core/common/widgets/app_bar.dart';
import 'package:wink/core/utils/constants/sizes.dart';
import 'package:wink/features/personalization/presentation/widgets/new_address_form.dart';

class AddNewAddressesView extends StatelessWidget {
  const AddNewAddressesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBarModel: AppBarModel(
            title: const Text("Add New Address"), hasArrowBack: true),
      ),
      body: const SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(TSizes.defaultSpace),
            child: NewAddressForm(),
          ),
        ),
      ),
    );
  }
}
