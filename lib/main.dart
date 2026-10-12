import 'package:evently_app/auth/login/login_screen.dart';
import 'package:evently_app/auth/password/forget_password_screen.dart';
import 'package:evently_app/auth/register/register_screen.dart';
import 'package:evently_app/firebase_options.dart';
import 'package:evently_app/onboarding/mainOnBoarding/main_onboarding_screen.dart';
import 'package:evently_app/screens/splash_screen.dart';

import 'package:evently_app/themes/app_themes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: ThemeMode.dark, 
      routes: {
        SplashScreen.routeName:(_)=>SplashScreen(),
        LoginScreen.routeName: (_) => LoginScreen(),
        RegisterScreen.routeName: (_) => RegisterScreen(),
        MainOnboardingScreen.routeName: (_) => MainOnboardingScreen(),
      },
      initialRoute:  SplashScreen.routeName,
    );
  }
}
 