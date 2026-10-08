import 'package:evently_app/auth/login/login_screen.dart';
import 'package:evently_app/common/app_text_styles.dart';
import 'package:evently_app/gen/assets.gen.dart';
import 'package:evently_app/onboarding/mainOnBoarding/widgets/container_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
        child: Column(
          mainAxisAlignment: .start,
          crossAxisAlignment: .start,
          children: [
            Center(
              child: Image.asset(
                Assets.images.beingCreativeOnboarding1.path,
                color: Theme.of(context).cardColor,
              ),
            ),
            SizedBox(height: size.height * .01),
            Text(
              "Personalize Your Experience", //TODO LOCALIZATION

              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: size.height * .01),
            Text(
              "Choose your preferred theme and\n language to get started with a\n comfortable, tailored experience that suits\n your style.", //TODO LOCALIZATION
              style: AppTextStyles.styleS16W400(
                color: Theme.of(context).hoverColor,
              ),
            ),
            SizedBox(height: size.height * .05),
            Row(
              children: [
                Text(
                  "Language", //TODO LOCALIZATION
                  style: AppTextStyles.styleS20W500(
                    color: Theme.of(context).cardColor,
                  ),
                ),
                Spacer(),
                InkWell(
                  onTap: () {
                    
                    setState(() {
                      selectedLang="en";
                    });
                  },
                  child: ContainerWidget(
                    size: size,
                    childClicked: Text(
                      "English", //TODO LOCALIZATION
                      style: AppTextStyles.styleS14W600(
                        color: Colors.white,
                      ),
                    ),
                    isClicked: selectedLang == 'en',
                    childNotClicked: Text(
                      "English", //TODO LOCALIZATION
                      style: AppTextStyles.styleS14W600(
                        color: Theme.of(context).cardColor,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: size.width * .01),
                InkWell(
                  onTap: () {
                   
                    setState(() {
                      selectedLang="ar";
                    });
                  },
                  child: ContainerWidget(
                    size: size,
                    childClicked: Text(
                      "Arabic", //TODO LOCALIZATION
                      style: AppTextStyles.styleS14W600(
                        color: Colors.white,
                      ),
                    ),
                    isClicked: selectedLang=="ar",
                    childNotClicked: Text(
                      "Arabic", //TODO LOCALIZATION
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
                  "Theme", //TODO LOCALIZATION
                  style: AppTextStyles.styleS20W500(
                    color: Theme.of(context).cardColor,
                  ),
                ),
                Spacer(),
                InkWell(
                  onTap: () {
                    
                    setState(() {
                      isDark=false;
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
                    
                    setState(() {
                      isDark=true;
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
                  Navigator.of(context).pushNamed(LoginScreen.routeName);
                },
                child: Text(
                  "Let's start",
                  style: AppTextStyles.styleS20W500(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _langText(String text, bool selected) => Text(
      text,
      style: AppTextStyles.styleS14W600(
        color: selected ? Colors.white : Theme.of(context).cardColor,
      ),
    );

Widget _themeIcon(String asset, bool selected) => SvgPicture.asset(
      asset,
      colorFilter: ColorFilter.mode(
        selected ? Colors.white : Theme.of(context).cardColor,
        BlendMode.srcIn,
      ),
    );
}
