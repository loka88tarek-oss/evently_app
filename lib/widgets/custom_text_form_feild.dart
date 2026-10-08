import 'package:evently_app/common/app_text_styles.dart';
import 'package:evently_app/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomTextFormFeild extends StatefulWidget {
  const CustomTextFormFeild({
    super.key,
    this.hintText,
    required this.prefixIcon,
    this.isPassword = false, this.validator,
  });
  final String? hintText;
  final String prefixIcon;
  final bool isPassword;
  final String? Function(String?)? validator;
  @override
  State<CustomTextFormFeild> createState() => _CustomTextFormFeildState();
}

class _CustomTextFormFeildState extends State<CustomTextFormFeild> {
  late bool isPasswordEnabeled = widget.isPassword;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        onTapOutside: (event) {
          Focus.of(context).unfocus();
        },
        validator:widget.validator ,
        obscureText: isPasswordEnabeled,
        style: AppTextStyles.styleS14W400(color: Theme.of(context).hoverColor),
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SvgPicture.asset(widget.prefixIcon, width: 24, height: 24),
          ),
          suffixIcon: widget.isPassword
              ? InkWell(
                  onTap: () {
                    isPasswordEnabeled = !isPasswordEnabeled;
                    setState(() {});
                  },
                  child: Icon(
                    isPasswordEnabeled
                        ? Icons.visibility_off_outlined
                        : Icons.remove_red_eye_outlined,
                    color: AppColors.iconTextFeildBorderColor,
                  ),
                )
              : null,

          hintText: widget.hintText,
          hintStyle: AppTextStyles.styleS14W400(
            color: Theme.of(context).hoverColor,
          ),
          filled: true,
          fillColor: Theme.of(context).splashColor,
          errorStyle: AppTextStyles.styleS14W400(color: AppColors.errorColor),
          border: _buildTextFormFeild(),
          enabledBorder: _buildTextFormFeild(),
          focusedBorder: _buildTextFormFeild(),
          errorBorder: _buildTextFormFeild(),
          focusedErrorBorder: _buildTextFormFeild(),
        ),
      ),
    );
  }

  InputBorder _buildTextFormFeild({Color? color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color:color?? Theme.of(context).hintColor),
    );
  }
}
