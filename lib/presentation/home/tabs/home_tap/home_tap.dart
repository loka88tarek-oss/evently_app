import 'package:evently_app/enums/category_enum.dart';
import 'package:evently_app/models/event_model.dart';
import 'package:evently_app/presentation/home/widgets/event_card.dart';
import 'package:flutter/material.dart';

class HomeTap extends StatelessWidget {
  const HomeTap({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
        children: [
          EventCard(
            eventModel: EventModel(
              categoryEnum: CategoryEnum.bookClub,
              date: "12 jan",
              description: "kjkbhjhgvhjb",
              title: "ghfh",
              isFav: false,
            ),
          ),
           EventCard(
            eventModel: EventModel(
              categoryEnum: CategoryEnum.bookClub,
              date: "12 jan",
              description: "kjkbhjhgvhjb",
              title: "ghfh",
              isFav: false,
            ),
          ),
        ],
      );
  }
}