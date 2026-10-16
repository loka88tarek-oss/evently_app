import 'package:evently_app/common/app_text_styles.dart';
import 'package:evently_app/themes/app_colors.dart';
import 'package:flutter/material.dart';

class SnakeBarHelper {
  static void sucessSnakeBar(BuildContext context, String title) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          title,
          style: AppTextStyles.styleS18W600(color: Colors.white),
        ),
        backgroundColor: Theme.of(context).shadowColor.withValues(alpha: 0.5),
      ),
    );
  }

  static void errorSnakeBar(BuildContext context, String title) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          title,
          style: AppTextStyles.styleS18W600(color: Colors.white),
        ),
        backgroundColor: AppColors.errorColor.withValues(alpha: 0.5),
      ),
    );
  }
}
