import 'package:evently_app/gen/assets.gen.dart';
import 'package:evently_app/presentation/home/tabs/profile_tap/widgets/profile_container_widget.dart';
import 'package:evently_app/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileTap extends StatefulWidget {
  const ProfileTap({super.key});

  @override
  State<ProfileTap> createState() => _ProfileTapState();
}

class _ProfileTapState extends State<ProfileTap> {
  @override
  Widget build(BuildContext context) {
    bool isDark = false;
    Size size = MediaQuery.sizeOf(context);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: .stretch,
          children: [
            SizedBox(height: size.height * .1),
            Row(
              mainAxisAlignment: .center,
              children: [
                ClipOval(
                  clipBehavior: Clip.antiAlias,
                  child: Center(
                    child: Image.asset(
                      Assets.images.routeProfile.path,
                      fit: BoxFit.cover,
                      width: size.width * .32,
                      height: size.height * .14,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                "John Safwat", //TODO:LOCALIZATION
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: Theme.of(context).highlightColor,
                ),
              ),
            ),
            Center(
              child: Text(
                "johnsafwat.route@gmail.com", //TODO:LOCALIZATION
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  color: Theme.of(context).hoverColor,
                ),
              ),
            ),
            SizedBox(height: size.height * .02),
            ProfileContainerWidget(
              text: "Dark Mode",
              child: Switch(
                padding: EdgeInsets.all(0),
                value: isDark,
                onChanged: (val) {
                  isDark = true;
                  val = isDark;
                  setState(() {});
                },
              ),
            ),
            SizedBox(height: 16),
            ProfileContainerWidget(
              text: "Language",
              child: Icon(
                Icons.keyboard_arrow_right,
                size: 30,
                color: Theme.of(context).shadowColor,
              ),
            ),
            SizedBox(height: 16),
            ProfileContainerWidget(
              text: "Logout",
              child: SvgPicture.asset(
                Assets.icons.logoutIcon,
                colorFilter: ColorFilter.mode(
                  AppColors.errorColor,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
