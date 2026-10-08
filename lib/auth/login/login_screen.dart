import 'package:evently_app/auth/register/register_screen.dart';
import 'package:evently_app/common/app_text_styles.dart';
import 'package:evently_app/gen/assets.gen.dart';
import 'package:evently_app/widgets/custom_text_form_feild.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const String routeName = "/loginScreen";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> _formState = GlobalKey();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Image.asset(Assets.images.appBarLogo.path)),
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
                  "Login to your account", //TODO:localization
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    color: Theme.of(context).shadowColor,
                  ),
                ),
                SizedBox(height: 10),
                CustomTextFormFeild(
                  hintText: "Enter your email", //TODO:localization
                  prefixIcon: Assets.icons.emailIcon,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Email is required!"; //TODO:localization
                    }
                  },
                ),
                CustomTextFormFeild(
                  hintText: "Enter your password", //TODO:localization
                  prefixIcon: Assets.icons.passwordIcon,
                  isPassword: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "password is required!"; //TODO:localization
                    } else if (value.length < 6) {
                      return "Password must be at least 6 characters!"; //TODO:localization
                    }
                  },
                ),
                Row(
            
                  mainAxisAlignment: .end,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Text(
                        "Forget Password? ",
                        style:
                            AppTextStyles.styleS14W600(
                              color: Theme.of(context).shadowColor,
                            ).copyWith(
                              decoration: TextDecoration.underline,
                              fontStyle: FontStyle.italic,
                              decorationColor: Theme.of(context).shadowColor,
                            ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height * .07),
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: FilledButton(
                    style: FilledButton.styleFrom(
                      backgroundColor: Theme.of(context).shadowColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
            
                    onPressed: () {
                      
                     bool isValid = _formState.currentState!.validate();
                     if(isValid){
                      
                     }
                    },
                    child: Text(
                      "Login",
                      style: AppTextStyles.styleS20W500(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: size.height * .05),
                Row(
            
                  mainAxisAlignment: .center,
                  children: [
                  RichText(text: TextSpan(
                    children: [
                      TextSpan(text: "Don’t have an account ? ",                  style: AppTextStyles.styleS14W400(color: Theme.of(context).hoverColor)),
                      TextSpan(text:"Signup",
                      recognizer: TapGestureRecognizer()..onTap=(){
                        Navigator.of(context).pushNamed(RegisterScreen.routeName);
                      }
                      
                      ,style: AppTextStyles.styleS14W400(color: Theme.of(context).shadowColor).copyWith(decoration: TextDecoration.underline,fontStyle: FontStyle.italic) )
                    ],
                    style: AppTextStyles.styleS14W400(color: Theme.of(context).shadowColor)
                  )
                  )
                  ],
                )
           ,  SizedBox(height: size.height * .05),
           Row(
            
            spacing: 16,
            children: [
              Expanded(child: Divider(color: Theme.of(context).dividerColor,)),
              Text("Or",//TODO loclization
              style: AppTextStyles.styleS16W500(color: Theme.of(context).shadowColor),
              ),
              Expanded(child: Divider(color: Theme.of(context).dividerColor,)),
            ],
           )
             ,
             SizedBox(height: size.height * .05),
             SizedBox(
              width: double.infinity,
              height: 58,
               child: Padding(
                 padding: const EdgeInsets.symmetric(vertical: 8.0),
                 child: OutlinedButton.icon(
                  
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color:Theme.of(context).dividerColor ),
                    backgroundColor: Theme.of(context).splashColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                      
                    )
                  )
                  
                  ,onPressed: (){}, label: Text("Login with Google ",style: AppTextStyles.styleS18W500(color:Theme.of(context).shadowColor ),),icon: Image.asset(Assets.icons.google.path),),
               ),
             )
             
              ],
            ),
          ),
        ),
      ),
    );
  }
}
