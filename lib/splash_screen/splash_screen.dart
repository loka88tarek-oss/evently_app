import 'dart:async';

import 'package:evently_app/presentation/auth/login/login_screen.dart';
import 'package:evently_app/common/app_text_styles.dart';
import 'package:evently_app/gen/assets.gen.dart';
import 'package:evently_app/onboarding/mainOnBoarding/main_onboarding_screen.dart';
import 'package:evently_app/presentation/home/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
static const String routeName = "/splashScreen";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      isLoggedIn()? Navigator.pushReplacementNamed(context, HomeScreen.routeName):
      Navigator.pushReplacementNamed(context, MainOnboardingScreen.routeName);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).splashColor
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: .stretch,
            mainAxisAlignment: .center,
            children: [
            Spacer(),
              Image.asset(Assets.images.splashLogo.path,color: Theme.of(context).shadowColor,),
              Spacer(),
              Image.asset(Assets.images.routeLogo.path,width: 70,
              height: 28,
              color: Theme.of(context).shadowColor,),
           
              Row(
                mainAxisAlignment: .center,
                
                children: [
                  Text("Supervised by Mohamed Nabil",style: AppTextStyles.styleS14W400(color:Theme.of(context).primaryColor),),
                ],
              )
            ],
          ),
        ),
      ),
    );
    
  }
  bool isLoggedIn(){
   return FirebaseAuth.instance.currentUser != null ;
  }
}