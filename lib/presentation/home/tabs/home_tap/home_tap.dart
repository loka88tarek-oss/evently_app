import 'dart:math';

import 'package:evently_app/enums/category_enum.dart';
import 'package:evently_app/models/event_model.dart';
import 'package:evently_app/presentation/auth/services/event_service.dart';
import 'package:evently_app/presentation/home/widgets/event_card.dart';
import 'package:flutter/material.dart';

class HomeTap extends StatelessWidget {
  const HomeTap({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: EventService.getAllEvents()
    , builder: (context,snapshot){
if (snapshot.connectionState==ConnectionState.waiting) {
  return Center(child: CircularProgressIndicator(),);
}
if (snapshot.hasError) {
  return Center(child: Text(snapshot.error.toString()),);
}
List<EventModel> events=snapshot.data??[];
return ListView.builder(itemCount: events.length,itemBuilder: (context,index)=>EventCard(eventModel: events[index]));

    });
      
  }
}