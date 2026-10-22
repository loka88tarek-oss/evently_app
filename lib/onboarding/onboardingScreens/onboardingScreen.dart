import 'package:evently_app/common/app_text_styles.dart';
import 'package:evently_app/gen/assets.gen.dart';
import 'package:evently_app/onboarding/mainOnBoarding/main_onboarding_screen.dart';
import 'package:evently_app/onboarding/onboardingScreens/widgets/onboarding_widget.dart';
import 'package:evently_app/presentation/auth/login/login_screen.dart';
import 'package:evently_app/widgets/filled_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboardingscreen extends StatefulWidget {
  const Onboardingscreen({super.key});
  static const String routeName = "/onboardingscreen";

  @override
  State<Onboardingscreen> createState() => _OnboardingscreenState();
}

class _OnboardingscreenState extends State<Onboardingscreen> {
  final PageController _controller = PageController();
  int currentIndex = 0;
  final List<String> images = [
    Assets.images.onboarding1.path,
    Assets.images.onboaarding2.path,
    Assets.images.onboarding3.path,
  ];
  final List<OnboardingModel> pages = const [
    OnboardingModel(
      title: 'Find Events That Inspire You',
      description:
          "Dive into a world of events crafted to fit your unique interests. Whether you're into live music, art workshops, professional networking, or simply discovering new experiences, we have something for everyone. Our curated recommendations will help you explore, connect, and make the most of every opportunity around you.",
    ),
    OnboardingModel(
      title: 'Effortless Event Planning',
      description:
          "Take the hassle out of organizing events with our all-in-one planning tools. From setting up invites and managing RSVPs to scheduling reminders and coordinating details, we’ve got you covered. Plan with ease and focus on what matters – creating an unforgettable experience for you and your guests.",
    ),
    OnboardingModel(
      title: 'Connect with Friends & Share Moments',
      description:
          "Make every event memorable by sharing the experience with others. Our platform lets you invite friends, keep everyone in the loop, and celebrate moments together. Capture and share the excitement with your network, so you can relive the highlights and cherish the memories.",
    ),
  ];

  bool get isLast => currentIndex == pages.length - 1;

  void _next() {
    if (isLast) {
      _finish();
    } else {
      _controller.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  void _back() {
    _controller.previousPage(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  void _finish() {
    Navigator.pushReplacementNamed(context, LoginScreen.routeName);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        leading: currentIndex > 0
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: Theme.of(context).splashColor,
                    border: Border.all(color: Theme.of(context).dividerColor),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: Theme.of(context).cardColor,
                    ),
                    onPressed: _back,
                  ),
                ),
              )
            : null,
        title: Center(
          child: Image.asset(
            Assets.images.appBarLogo.path,
            color: Theme.of(context).shadowColor,
          ),
        ),
        actions: [
          if (!isLast)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: _finish,
                child: Container(
                  width: 64,
                  height: 32,
                  decoration: BoxDecoration(
                    color: Theme.of(context).splashColor,
                    border: Border.all(color: Theme.of(context).dividerColor),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      "Skip",
                      style: Theme.of(context).textTheme.headlineSmall!
                          .copyWith(
                            color: Theme.of(context).cardColor,
                            fontSize: 14,
                          ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Column(
          crossAxisAlignment: .stretch,
          children: [
            SizedBox(
              height: size.height * .52,

              width: double.infinity,

              child: Image.asset(
                images[currentIndex],
                fit: BoxFit.cover,
                color: Theme.of(context).cardColor,
              ),
            ),
            Row(
              children: [
                Spacer(),
                SmoothPageIndicator(
                  controller: _controller,

                  count: pages.length,
                  effect: ExpandingDotsEffect(
                    dotHeight: 8,
                    dotWidth: 8,
                    dotColor: Theme.of(context).disabledColor,
                    activeDotColor: Theme.of(context).shadowColor,
                  ),
                ),
                Spacer(),
              ],
            ),
            Expanded(
              child: PageView.builder(
                controller: _controller,
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                    setState(() {});
                  });
                },
                itemCount: pages.length,
                itemBuilder: (context, index) {
                  return OnboardingWidget(onboardingModel: pages[index]);
                },
              ),
            ),
            SizedBox(height: 16),
            FilledButtonWidget(
              text: isLast ? "Get started" : "Next",
              onPressed: _next,
              isLoading: false,
            ),
          ],
        ),
      ),
    );
  }
}

class OnboardingModel {
  final String title;
  final String description;

  const OnboardingModel({required this.title, required this.description});
}
