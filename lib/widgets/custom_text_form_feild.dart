import 'package:evently_app/common/app_text_styles.dart';
import 'package:evently_app/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomTextFormFeild extends StatefulWidget {
  const CustomTextFormFeild({
    super.key,
    this.hintText,
    this.prefixIcon,
    this.isPassword = false,
    this.validator,
    this.controller, this.title,  this.maxLines=1,
  });
  final int maxLines;
  final String? hintText, title;
  final String? prefixIcon;
  final bool isPassword;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  @override
  State<CustomTextFormFeild> createState() => _CustomTextFormFeildState();
}

class _CustomTextFormFeildState extends State<CustomTextFormFeild> {
  late bool isPasswordEnabeled = widget.isPassword;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        spacing: 5,
        crossAxisAlignment: .start,
        
        children: [
          if(widget.title!=null)
          Text(widget.title!,style: AppTextStyles.styleS16W500(color: Theme.of(context).highlightColor),),
          TextFormField(
            maxLines: widget.maxLines,
            controller: widget.controller,
            onTapOutside: (event) {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            validator: widget.validator,
            obscureText: isPasswordEnabeled,
            style: AppTextStyles.styleS14W400(
              color: Theme.of(context).primaryColor,
            ),
            decoration: InputDecoration(
              prefixIcon:
              widget.prefixIcon!=null?
                Padding(
                padding: const EdgeInsets.all(16.0),
                child: SvgPicture.asset(widget.prefixIcon!, width: 24, height: 24),
              ):null,
              
               
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
        ],
      ),
    );
  }

  InputBorder _buildTextFormFeild({Color? color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: color ?? Theme.of(context).hintColor),
    );
  }
}
