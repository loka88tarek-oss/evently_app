import 'package:evently_app/common/app_text_styles.dart';
import 'package:flutter/material.dart';

class FilledButtonWidget extends StatelessWidget {
  const FilledButtonWidget({
    super.key,
     GlobalKey<FormState>? formState, required this.text,required this.onPressed,
  }) : _formState = formState;

  final GlobalKey<FormState>? _formState;
  final String text;
final  void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: FilledButton(
        style: FilledButton.styleFrom(
          backgroundColor: Theme.of(context).shadowColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
                
        onPressed: onPressed,
        child: Text(
          text,
          style: AppTextStyles.styleS20W500(color: Colors.white),
        ),
      ),
    );
  }
}
