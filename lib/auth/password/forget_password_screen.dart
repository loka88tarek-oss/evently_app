import 'package:evently_app/auth/login/login_screen.dart';
import 'package:evently_app/common/app_text_styles.dart';
import 'package:evently_app/gen/assets.gen.dart';
import 'package:evently_app/widgets/filled_button_widget.dart';
import 'package:flutter/material.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});
  static const String routeName = "/forgetPasswordScreen";
  @override
  Widget build(BuildContext context) {
      Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
           
            width:32 ,
            height:32 ,
            decoration:BoxDecoration(
               color: Theme.of(context).splashColor,
              border: Border.all(color: Theme.of(context).dividerColor),
              borderRadius: BorderRadius.circular(8),
            ) ,
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios_new_rounded,color: Theme.of(context).cardColor,),
              onPressed: () {
                Navigator.of(context).pushNamed(LoginScreen.routeName);
              },
            ),
          ),
        ),
        title:Center(child: Text("Forget Password",style: AppTextStyles.styleS18W500(),)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [

SizedBox(height: size.height*.07,)
         , Center(
            child: Image.asset(
              Assets.images.forgetPassword.path,
              width: double.infinity,
              height: 300,
            ),
        
          ),
          SizedBox(height:size.height*.07 ,),
          FilledButtonWidget(text: "Reset Password",onPressed: () {
            
          },),
        ],),
      ),
    );
  }
}