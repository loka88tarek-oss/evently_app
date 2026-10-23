import 'dart:math';

import 'package:evently_app/common/app_text_styles.dart';
import 'package:evently_app/gen/assets.gen.dart';
import 'package:evently_app/models/event_model.dart';
import 'package:evently_app/presentation/auth/services/event_service.dart';
import 'package:evently_app/presentation/edit_event/edit_event_screen.dart';
import 'package:evently_app/presentation/home/home_screen.dart';
import 'package:evently_app/presentation/home/tabs/home_tap/home_provider/home_tab_provider.dart';
import 'package:evently_app/themes/app_colors.dart';
import 'package:evently_app/widgets/app_bar_icon_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class EventDetails extends StatelessWidget {
  const EventDetails({super.key});

  static const String routeName = "/eventDetails";

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    Size size = MediaQuery.of(context).size;
    final event = ModalRoute.of(context)!.settings.arguments as EventModel;
    final ImageProvider image = AssetImage(event.categoryEnum.getImage(isDark));
    final title = event.title;
    final date = DateFormat("d MMMM").format(event.dateValue);
    final time = DateFormat("hh:mm a").format(event.dateValue);
    final decription = event.description;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Event details"),
        leading: AppBarIconWidget(
          containerChild: Icon(Icons.arrow_back_ios_new_outlined),
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
          },
        ),
        actions: [
          AppBarIconWidget(
            containerChild: SvgPicture.asset(
              Assets.icons.edit,
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Theme.of(context).shadowColor,
                BlendMode.srcIn,
              ),
            ),
            onPressed: () {
              Navigator.of(
                context,
              ).pushNamed(EditEventScreen.routeName, arguments: event);
            },
          ),

          AppBarIconWidget(
            containerChild: SvgPicture.asset(
              Assets.icons.trash,
              fit: BoxFit.cover,
            ),
            onPressed: () async {
              final confirm = await showDialog<bool>(
                context: context,
                builder: (ctx) {
                  return AlertDialog(
                    title: Text("Do you to delete that event?!"),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(ctx, true),
                        child: Text("delete"),
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
                await EventService.deleteEvent(event);
                if (context.mounted) {
                  Navigator.pop(context);
                }
              }
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () {
          return Provider.of<EventsProvider>(context, listen: false).getEvent();
        },

        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            crossAxisAlignment: .stretch,
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                width: double.infinity,
                height: size.height * .23,
                decoration: BoxDecoration(
                  border: BoxBorder.all(
                    color: Theme.of(context).dividerColor,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(image: image, fit: BoxFit.cover),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      title,
                      style: AppTextStyles.styleS18W500(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.symmetric(vertical: 16),
                      width: double.infinity,
                      height: size.height * .09,
                      decoration: BoxDecoration(
                        color: Theme.of(context).splashColor,
                        border: BoxBorder.all(
                          color: Theme.of(context).dividerColor,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 16),
                              width: 44,
                              height: 44,
                              decoration: BoxDecoration(
                                color: Theme.of(
                                  context,
                                ).scaffoldBackgroundColor,
                                border: BoxBorder.all(
                                  color: Theme.of(context).dividerColor,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Icon(
                                Icons.calendar_month_outlined,
                                color: Theme.of(context).shadowColor,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: .center,
                                children: [
                                  Text(
                                    date,
                                    style: AppTextStyles.styleS16W500(
                                      color: Theme.of(
                                        context,
                                      ).unselectedWidgetColor,
                                    ),
                                  ),
                                  Text(
                                    time,
                                    style: AppTextStyles.styleS16W500(
                                      color: AppColors.iconTextFeildBorderColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Description ",
                      style: AppTextStyles.styleS16W500(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Container(
                        width: double.infinity,
                        height: size.height * .23,
                        decoration: BoxDecoration(
                          color: Theme.of(context).splashColor,
                          border: BoxBorder.all(
                            color: Theme.of(context).dividerColor,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            decription,
                            style: AppTextStyles.styleS16W500(
                              color: Theme.of(context).secondaryHeaderColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
