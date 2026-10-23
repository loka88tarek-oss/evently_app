import 'package:evently_app/common/app_text_styles.dart';
import 'package:evently_app/models/event_model.dart';
import 'package:evently_app/presentation/auth/services/event_service.dart';
import 'package:evently_app/presentation/event_details/event_details.dart';
import 'package:evently_app/presentation/home/tabs/home_tap/home_provider/home_tab_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class EventCard extends StatelessWidget {
  const EventCard({super.key, required this.eventModel});
  final EventModel eventModel;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        Navigator.of(
          context,
        ).pushNamed(EventDetails.routeName, arguments: eventModel);
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        width: double.infinity,
        height: size.height * .23,
        decoration: BoxDecoration(
          border: BoxBorder.all(
            color: Theme.of(context).dividerColor,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
            image: AssetImage(eventModel.categoryEnum.getImage(isDark)),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: .spaceBetween,
            crossAxisAlignment: .start,
            children: [
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  border: BoxBorder.all(
                    color: Theme.of(context).dividerColor,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  "${eventModel.dateValue.day} ${DateFormat("MMM").format(eventModel.dateValue)}",
                  style: AppTextStyles.styleS16W600(
                    color: Theme.of(context).shadowColor,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  border: BoxBorder.all(
                    color: Theme.of(context).dividerColor,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Text(
                      eventModel.title,
                      style: AppTextStyles.styleS14W500(
                        color: Theme.of(context).highlightColor,
                      ),
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () async {
                        if (eventModel.isFav) {
                          (eventModel.favorites ?? []).remove(
                            FirebaseAuth.instance.currentUser?.uid,
                          );
                        } else {
                          eventModel.favorites = [
                            ...eventModel.favorites ?? [],
                            FirebaseAuth.instance.currentUser?.uid ?? '',
                          ];
                        }
                        Provider.of<EventsProvider>(
                          context,
                          listen: false,
                        ).updateEvent(eventModel);
                        await EventService.updateFav(eventModel);
                      },
                      icon: Icon(
                        eventModel.isFav
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: Theme.of(context).shadowColor,
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
