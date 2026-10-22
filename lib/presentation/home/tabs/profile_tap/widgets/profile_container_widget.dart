import 'package:evently_app/common/app_text_styles.dart';
import 'package:flutter/material.dart';

class ProfileContainerWidget extends StatelessWidget {
  const ProfileContainerWidget({
    super.key,
    required this.text,
    required this.child,
  });
  final String text;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Container(
      width: double.infinity,
      height: size.height * .057,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Theme.of(context).splashColor,
        border: BoxBorder.all(color: Theme.of(context).hintColor),
      ),
      child: Row(
        children: [
          Text(
            text, //TODO:LOCALIZATION
            style: AppTextStyles.styleS16W500(
              color: Theme.of(context).highlightColor,
            ),
          ),
          Spacer(),
          child,
        ],
      ),
    );
  }
}
