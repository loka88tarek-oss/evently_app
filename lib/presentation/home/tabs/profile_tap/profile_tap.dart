import 'package:evently_app/app_provider/app_provider.dart';
import 'package:evently_app/gen/assets.gen.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/presentation/auth/login/login_screen.dart';
import 'package:evently_app/presentation/auth/services/fire_base_services.dart';
import 'package:evently_app/presentation/home/tabs/home_tap/home_provider/home_tab_provider.dart';
import 'package:evently_app/presentation/home/tabs/profile_tap/widgets/profile_container_widget.dart';
import 'package:evently_app/themes/app_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class ProfileTap extends StatefulWidget {
  const ProfileTap({super.key});

  @override
  State<ProfileTap> createState() => _ProfileTapState();
}

class _ProfileTapState extends State<ProfileTap> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final l10n = AppLocalizations.of(context)!;
    bool isDark = false;
    Size size = MediaQuery.sizeOf(context);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ChangeNotifierProvider(
          create: (context) => AppProvider(),
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
                  user?.displayName ?? '', //TODO:LOCALIZATION
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: Theme.of(context).highlightColor,
                  ),
                ),
              ),
              Center(
                child: Text(
                  user?.email ?? '',
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    color: Theme.of(context).hoverColor,
                  ),
                ),
              ),
              SizedBox(height: size.height * .02),
              ProfileContainerWidget(
                text: l10n.darkMode,
                child: Switch(
                  value: context.watch<AppProvider>().isDark,
                  onChanged: (value) =>
                      context.read<AppProvider>().changeTheme(),
                  thumbColor: const WidgetStatePropertyAll(Colors.white),
                  trackColor: WidgetStateProperty.resolveWith((states) {
                    if (states.contains(WidgetState.selected)) {
                      return const Color(0xFF4A7BE8);
                    }
                    return const Color(0xFFE6E6EA);
                  }),
                  trackOutlineColor: const WidgetStatePropertyAll(
                    Colors.transparent,
                  ),
                  splashRadius: 20,
                  padding: EdgeInsets.zero,
                ),
              ),
              SizedBox(height: 16),
              ProfileContainerWidget(
                text: l10n.language,
                child: InkWell(
                  onTap: () {
                    final provider = context.read<AppProvider>();
                    provider.changeLocal();
                  },
                  child: Icon(
                    Icons.keyboard_arrow_right,
                    size: 30,
                    color: Theme.of(context).shadowColor,
                  ),
                ),
              ),
              SizedBox(height: 16),
              ProfileContainerWidget(
                text: l10n.logout,
                child: InkWell(
                  onTap: () async {
                    final confirm = await showDialog<bool>(
                      context: context,
                      builder: (ctx) {
                        return AlertDialog(
                          title: Text("Do you want to Logout?!"),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(ctx, true),
                              child: Text("Yes"),
                            ),
                            TextButton(
                              onPressed: () => Navigator.pop(ctx, false),
                              child: Text("cancle"),
                            ),
                          ],
                        );
                      },
                    );

                    if (confirm == true) {
                      await FireBaseServices.logOut();
                      if (!context.mounted) return;
                      context.read<EventsProvider>();
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        LoginScreen.routeName, // use your login route name
                        (route) => false,
                      );
                    }
                  },
                  child: SvgPicture.asset(
                    Assets.icons.logoutIcon,
                    colorFilter: ColorFilter.mode(
                      AppColors.errorColor,
                      BlendMode.srcIn,
                    ),
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
