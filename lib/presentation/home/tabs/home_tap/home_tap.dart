import 'dart:math';

import 'package:evently_app/enums/category_enum.dart';
import 'package:evently_app/models/event_model.dart';
import 'package:evently_app/presentation/auth/services/event_service.dart';
import 'package:evently_app/presentation/home/tabs/home_tap/home_provider/home_tab_provider.dart';
import 'package:evently_app/presentation/home/widgets/event_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeTap extends StatelessWidget {
  const HomeTap({super.key});

  @override
  Widget build(BuildContext context) {
    EventsProvider provider = Provider.of<EventsProvider>(context);

    if (provider.isLoading) {
      return Center(child: CircularProgressIndicator());
    }
    if (provider.errorMessage != null) {
      return Center(child: Text(provider.errorMessage.toString()));
    }
    List<EventModel> events = provider.filteredEvents;
    return RefreshIndicator(
      onRefresh: () {
        return Provider.of<EventsProvider>(context, listen: false).getEvent();
      },
      child: ListView.builder(
        itemCount: events.length,
        itemBuilder: (context, index) => EventCard(eventModel: events[index]),
      ),
    );
  }
}
