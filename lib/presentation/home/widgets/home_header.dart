import 'package:evently_app/app_provider/app_provider.dart';
import 'package:evently_app/common/app_text_styles.dart';
import 'package:evently_app/enums/category_enum.dart';
import 'package:evently_app/gen/assets.gen.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/presentation/home/widgets/category_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:evently_app/presentation/home/tabs/home_tap/home_provider/home_tab_provider.dart';

class HomeHeader extends StatefulWidget implements PreferredSizeWidget {
  const HomeHeader({super.key});

  @override
  State<HomeHeader> createState() => _HomeHeaderState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(AppBar().preferredSize.width, 119);
}

class _HomeHeaderState extends State<HomeHeader> {
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final eventsProvider = context.watch<EventsProvider>();
    ThemeData theme = Theme.of(context);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: .stretch,
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: .start,
                  spacing: 5,
                  children: [
                    Text(
                      l10n.welcomeBack,
                      style: theme.textTheme.labelSmall!.copyWith(
                        color: theme.hoverColor,
                      ),
                    ),
                    Text(
                      FirebaseAuth.instance.currentUser?.displayName ?? '',
                      style: theme.textTheme.titleSmall!.copyWith(
                        color: theme.highlightColor,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Row(
                  spacing: 4,
                  children: [
                    IconButton(
                      onPressed: () {
                        context.read<AppProvider>().changeTheme();
                      },
                      icon: SvgPicture.asset(
                        Theme.of(context).colorScheme.brightness ==
                                Brightness.light
                            ? Assets.icons.moon
                            : Assets.icons.sun,
                        colorFilter: ColorFilter.mode(
                          theme.shadowColor,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),

                    SizedBox(
                      width: 40,
                      height: 38,
                      child: FilledButton(
                        onPressed: () {
                          context.read<AppProvider>().changeLocal();
                        },
                        style: FilledButton.styleFrom(
                          padding: EdgeInsets.zero,
                          backgroundColor: theme.shadowColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          context.watch<AppProvider>().local,
                          style: AppTextStyles.styleS14W400(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView(
                scrollDirection: .horizontal,
                children: [
                  CategoryCard(
                    onSelect: (p0) => eventsProvider.changeCategory(null),
                    isSelected: eventsProvider.selectedCategory == null,
                    categoryEnum: null,
                    isAll: true,
                  ),
                  ...CategoryEnum.values.map(
                    (e) => CategoryCard(
                      onSelect: (p0) => eventsProvider.changeCategory(p0),
                      categoryEnum: e,
                      isSelected: eventsProvider.selectedCategory == e,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
