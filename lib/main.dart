import 'package:evently_app/onboarding/onboarding_screens/onboarding1.dart';
import 'package:evently_app/presentation/auth/login/login_screen.dart';
import 'package:evently_app/presentation/auth/password/forget_password_screen.dart';
import 'package:evently_app/presentation/auth/register/register_screen.dart';
import 'package:evently_app/firebase_options.dart';
import 'package:evently_app/onboarding/mainOnBoarding/main_onboarding_screen.dart';
import 'package:evently_app/presentation/home/home_screen.dart';
import 'package:evently_app/presentation/new_event/new_event_screen.dart';
import 'package:evently_app/splash_screen/splash_screen.dart';

import 'package:evently_app/themes/app_themes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
      themeMode: ThemeMode.light,
      routes: {
        SplashScreen.routeName: (_) => SplashScreen(),
        LoginScreen.routeName: (_) => LoginScreen(),
        RegisterScreen.routeName: (_) => RegisterScreen(),
        MainOnboardingScreen.routeName: (_) => MainOnboardingScreen(),
        ForgetPasswordScreen.routeName: (_) => ForgetPasswordScreen(),
        HomeScreen.routeName: (_) => HomeScreen(),
        NewEventScreen.routeName: (_) => NewEventScreen(),
        OnboardingScreen.routeName: (_) => OnboardingScreen(),
      },
      initialRoute: SplashScreen.routeName,
    );
  }
}
