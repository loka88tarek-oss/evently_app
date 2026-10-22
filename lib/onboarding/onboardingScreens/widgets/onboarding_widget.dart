import 'package:evently_app/common/app_text_styles.dart';
import 'package:evently_app/gen/assets.gen.dart';
import 'package:evently_app/models/onboarding_model.dart';
import 'package:evently_app/onboarding/mainOnBoarding/main_onboarding_screen.dart';
import 'package:evently_app/onboarding/onboardingScreens/onboardingScreen.dart';
import 'package:evently_app/widgets/filled_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingWidget extends StatelessWidget {
  const OnboardingWidget({super.key, required this.onboardingModel});
  final OnboardingModel onboardingModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        SizedBox(height: 15),

        Text(
          onboardingModel.title,
          style: AppTextStyles.styleS20W600(
            color: Theme.of(context).highlightColor,
          ),
          textAlign: .start,
        ),
        SizedBox(height: 10),
        Text(
          onboardingModel.description,
          style: AppTextStyles.styleS16W600(
            color: Theme.of(context).hoverColor,
          ),
          textAlign: .start,
        ),
        SizedBox(height: 10),
       
      ],
    );
  }
}
