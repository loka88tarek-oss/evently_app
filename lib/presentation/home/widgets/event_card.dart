import 'package:evently_app/common/app_text_styles.dart';
import 'package:evently_app/models/event_model.dart';
import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  const EventCard({super.key, required this.eventModel});
  final EventModel eventModel;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      margin: EdgeInsets.all(8),
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        border: BoxBorder.all(color: Theme.of(context).dividerColor, width: 1),
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
                borderRadius: BorderRadius.circular(8)
              ),
              child: Text("21 Jan",style: AppTextStyles.styleS16W600(color: Theme.of(context).shadowColor),),
        
            ),
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                border: BoxBorder.all(
                  color: Theme.of(context).dividerColor,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(8)
              ),
              child: Row(
                children: [
                  Text(eventModel.title,style: AppTextStyles.styleS14W500(color: Theme.of(context).highlightColor),),
                  Spacer(),
                  Icon(eventModel.isFav ? Icons.favorite : Icons.favorite_border, color: Theme.of(context).shadowColor,)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
