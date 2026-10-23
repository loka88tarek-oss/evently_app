import 'package:evently_app/app_provider/app_provider.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/onboarding/onboardingScreens/onboardingScreen.dart';
import 'package:evently_app/presentation/auth/login/login_screen.dart';
import 'package:evently_app/common/app_text_styles.dart';
import 'package:evently_app/gen/assets.gen.dart';
import 'package:evently_app/onboarding/mainOnBoarding/widgets/container_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class MainOnboardingScreen extends StatefulWidget {
  const MainOnboardingScreen({super.key});
  static const String routeName = "/mainOnboardingScreen";

  @override
  State<MainOnboardingScreen> createState() => _MainOnboardingScreenState();
}

class _MainOnboardingScreenState extends State<MainOnboardingScreen> {
  String selectedLang = 'en';
  bool isDark = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Image.asset(Assets.images.appBarLogo.path)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ChangeNotifierProvider(
          create: (context) => AppProvider(),
          child: Column(
            mainAxisAlignment: .start,
            crossAxisAlignment: .stretch,
            children: [
              Center(
                child: Image.asset(
                  Assets.images.beingCreativeOnboarding1.path,
                  color: Theme.of(context).cardColor,
                ),
              ),
              SizedBox(height: size.height * .01),
              Text(
                AppLocalizations.of(context)!.personalizeYourExperience, 
          
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(height: size.height * .01),
              Text(
               AppLocalizations.of(context)!.personalizeDescription, 
                style: AppTextStyles.styleS16W400(
                  color: Theme.of(context).hoverColor,
                ),
              ),
              SizedBox(height: size.height * .05),
              Row(
                children: [
                  Text(
                  AppLocalizations.of(context)!.language, 
                    style: AppTextStyles.styleS20W500(
                      color: Theme.of(context).cardColor,
                    ),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      context.read<AppProvider>().changeLocal();
                      setState(() {
                        selectedLang = "en";
                      });
                    },
                    child: ContainerWidget(
                      size: size,
                      childClicked: Text(
                        AppLocalizations.of(context)!.english, 
                        style: AppTextStyles.styleS14W600(color: Colors.white),
                      ),
                      isClicked: selectedLang == 'en',
                      childNotClicked: Text(
                        AppLocalizations.of(context)!.english, 
                        style: AppTextStyles.styleS14W600(
                          color: Theme.of(context).cardColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: size.width * .01),
                  InkWell(
                    onTap: () {
                        context.read<AppProvider>().changeLocal();
                      setState(() {
                        selectedLang = "ar";
                      });
                    },
                    child: ContainerWidget(
                      size: size,
                      childClicked: Text(
                       AppLocalizations.of(context)!.arabic, 
                        style: AppTextStyles.styleS14W600(color: Colors.white),
                      ),
                      isClicked: selectedLang == "ar",
                      childNotClicked: Text(
                       AppLocalizations.of(context)!.arabic, 
                        style: AppTextStyles.styleS14W600(
                          color: Theme.of(context).cardColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
          
              SizedBox(height: size.height * .025),
              Row(
                children: [
                  Text(
                   AppLocalizations.of(context)!.theme, 
                    style: AppTextStyles.styleS20W500(
                      color: Theme.of(context).cardColor,
                    ),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                        context.read<AppProvider>().changeTheme();
                      setState(() {
                        isDark = false;
                      });
                    },
                    child: ContainerWidget(
                      size: size,
                      childClicked: SvgPicture.asset(
                        Assets.icons.sun,
                        colorFilter: ColorFilter.mode(
                          Colors.white,
                          BlendMode.srcIn,
                        ),
                      ),
                      isClicked: !isDark,
                      childNotClicked: SvgPicture.asset(
                        Assets.icons.sun,
                        colorFilter: ColorFilter.mode(
                          Theme.of(context).cardColor,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: size.width * .01),
                  InkWell(
                    onTap: () {
                        context.read<AppProvider>().changeTheme();
                      setState(() {
                        isDark = true;
                      });
                    },
                    child: ContainerWidget(
                      size: size,
                      childClicked: SvgPicture.asset(
                        Assets.icons.moon,
                        colorFilter: ColorFilter.mode(
                          Colors.white,
                          BlendMode.srcIn,
                        ),
                      ),
                      isClicked: isDark,
                      childNotClicked: SvgPicture.asset(
                        Assets.icons.moon,
                        colorFilter: ColorFilter.mode(
                          Theme.of(context).cardColor,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
          
              SizedBox(height: size.height * .03),
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
                    Navigator.of(
                      context,
                    ).popAndPushNamed(Onboardingscreen.routeName);
                  },
                  child: Text(
                    AppLocalizations.of(context)!.letsStart,
                    style: AppTextStyles.styleS20W500(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
