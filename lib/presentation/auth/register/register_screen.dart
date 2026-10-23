import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/presentation/auth/login/login_screen.dart';
import 'package:evently_app/presentation/auth/services/fire_base_services.dart';
import 'package:evently_app/common/app_text_styles.dart';
import 'package:evently_app/gen/assets.gen.dart';
import 'package:evently_app/models/user_model.dart';
import 'package:evently_app/themes/app_colors.dart';
import 'package:evently_app/widgets/custom_text_form_feild.dart';
import 'package:evently_app/widgets/filled_button_widget.dart';
import 'package:evently_app/widgets/snake_bar_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  static const String routeName = "/registerScreen";

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formState = GlobalKey();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
     final l10n = AppLocalizations.of(context)!;
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Image.asset(
            Assets.images.appBarLogo.path,
            color: Theme.of(context).shadowColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formState,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisAlignment: .start,
              crossAxisAlignment: .start,
              children: [
                SizedBox(height: size.height * .02),
                Text(
                l10n.createYourAccount, 
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    color: Theme.of(context).cardColor,
                  ),
                ),
                SizedBox(height: 10),
                CustomTextFormFeild(
                  controller: nameController,
                  hintText: l10n.enterYourName, 
                  prefixIcon: Assets.icons.user,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return l10n.nameRequired; 
                    }
                  },
                ),
                CustomTextFormFeild(
                  controller: emailController,
                  hintText: l10n.enterYourEmail, 
                  prefixIcon: Assets.icons.emailIcon,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return l10n.emailRequired; 
                    }
                  },
                ),
                CustomTextFormFeild(
                  controller: passwordController,
                  hintText: l10n.enterYourPassword, 
                  prefixIcon: Assets.icons.passwordIcon,
                  isPassword: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return l10n.passwordRequired; 
                    } else if (value.length < 6) {
                      return l10n.passwordMinLength; 
                    }
                  },
                ),
                CustomTextFormFeild(
                  controller: rePasswordController,
                  hintText: l10n.confirmYourPassword, 
                  prefixIcon: Assets.icons.passwordIcon,
                  isPassword: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return l10n.passwordRequired; 
                    } else if (value != passwordController.text) {
                      return l10n.passwordsDoNotMatch; 
                    }
                  },
                ),
                SizedBox(height: size.height * .07),

                FilledButtonWidget(
                  isLoading: isLoading,
                  text: l10n.signUp,
                  formState: _formState,
                  onPressed: isLoading
                      ? null
                      : () async {
                          bool isValid = _formState.currentState!.validate();
                          if (isValid) {
                           
                            UserModel user = UserModel(
                              email: emailController.text,
                              password: passwordController.text,
                              name: nameController.text,
                            );
                             setState(() {
                              isLoading = true;
                            });
                            try {
                              await FireBaseServices.register(user);
                              if (context.mounted) {
SnakeBarHelper.sucessSnakeBar(context,l10n.registerSuccess);

                                Navigator.of(context).pop();
                              }
                            } on String catch (e) {
                              if (context.mounted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      e,
                                      style: AppTextStyles.styleS18W600(
                                        color: Colors.white,
                                      ),
                                    ),
                                    backgroundColor: AppColors.errorColor,
                                  ),
                                );
                              }
                            }
                            setState(() {
                              isLoading = false;
                            });
                          }
                        },
                ), 
                
                SizedBox(height: size.height * .05),
                Row(
                  mainAxisAlignment: .center,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: l10n.alreadyHaveAccount,
                            style: AppTextStyles.styleS14W400(
                              color: Theme.of(context).hoverColor,
                            ),
                          ),
                          TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.of(
                                  context,
                                ).pushNamed(LoginScreen.routeName);
                              },
                            text: l10n.login,
                            style:
                                AppTextStyles.styleS14W400(
                                  color: Theme.of(context).shadowColor,
                                ).copyWith(
                                  decoration: TextDecoration.underline,
                                  fontStyle: FontStyle.italic,
                                ),
                          ),
                        ],
                        style: AppTextStyles.styleS14W400(
                          color: Theme.of(context).shadowColor,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height * .05),
                Row(
                  spacing: 16,
                  children: [
                    Expanded(
                      child: Divider(color: Theme.of(context).dividerColor),
                    ),
                    Text(
                      l10n.or, 
                      style: AppTextStyles.styleS16W500(
                        color: Theme.of(context).shadowColor,
                      ),
                    ),
                    Expanded(
                      child: Divider(color: Theme.of(context).dividerColor),
                    ),
                  ],
                ),
                SizedBox(height: size.height * .05),
                SizedBox(
                  width: double.infinity,
                  height: 58,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Theme.of(context).dividerColor),
                        backgroundColor: Theme.of(context).splashColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      onPressed: () {},
                      label: Text(
                        l10n.signUpWithGoogle,
                        style: AppTextStyles.styleS18W500(
                          color: Theme.of(context).shadowColor,
                        ),
                      ),
                      icon: Image.asset(Assets.icons.google.path),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
