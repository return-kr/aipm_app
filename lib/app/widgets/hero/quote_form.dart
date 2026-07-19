import 'package:aipm_app/app/core/constants/app_dimensions.dart';
import 'package:aipm_app/app/core/constants/app_icons.dart';
import 'package:aipm_app/app/core/constants/app_strings.dart';
import 'package:aipm_app/app/core/utils/validators.dart';
import 'package:aipm_app/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../common/app_textfield.dart';
import '../common/custom_card.dart';
import '../common/primary_button.dart';

/// ===============================================================
/// QUOTE FORM
/// ---------------------------------------------------------------
/// Get Quote form section.
/// ===============================================================

class QuoteForm extends GetView<HomeController> {
  const QuoteForm({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Form(
        key: controller.quoteSectionKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              AppStrings.getQuote,
              style: Theme.of(context).textTheme.headlineSmall,
            ),

            const SizedBox(height: AppDimensions.spacing24),

            AppTextField(
              controller: controller.nameController,
              labelText: AppStrings.name,
              hintText: AppStrings.enterName,
              prefixIcon: Icon(AppIcons.person),
              textInputAction: TextInputAction.next,
              validator: Validators.validateRequired,
            ),

            const SizedBox(height: AppDimensions.spacing16),

            AppTextField(
              controller: controller.phoneController,
              labelText: 'AppStrings.phone',
              hintText: AppStrings.enterPhone,
              prefixIcon: Icon(AppIcons.phone),
              keyboardType: TextInputType.phone,
              textInputAction: TextInputAction.next,
              validator: Validators.validatePhone,
            ),

            const SizedBox(height: AppDimensions.spacing16),

            AppTextField(
              controller: controller.fromController,
              labelText: AppStrings.pickupLocation,
              hintText: AppStrings.enterPickupLocation,
              prefixIcon: Icon(AppIcons.location),
              textInputAction: TextInputAction.next,
              validator: Validators.validateRequired,
            ),

            const SizedBox(height: AppDimensions.spacing16),

            AppTextField(
              controller: controller.toController,
              labelText: AppStrings.destinationLocation,
              hintText: AppStrings.enterDestinationLocation,
              prefixIcon: Icon(AppIcons.location),
              textInputAction: TextInputAction.next,
              validator: Validators.validateRequired,
            ),

            const SizedBox(height: AppDimensions.spacing16),

            AppTextField(
              controller: controller.dateController,
              labelText: AppStrings.movingDate,
              hintText: AppStrings.selectMovingDate,
              prefixIcon: Icon(AppIcons.calendar),
              readOnly: true,
              onTap: () {
                controller.pickMovingDate(context);
              },
              validator: Validators.validateRequired,
            ),

            const SizedBox(height: AppDimensions.spacing32),

            Obx(
              () => PrimaryButton(
                text: AppStrings.submit,
                isLoading: controller.isSubmitting.value,
                onPressed: controller.submitQuote,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
