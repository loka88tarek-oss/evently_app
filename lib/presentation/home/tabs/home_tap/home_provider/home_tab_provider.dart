import 'package:evently_app/enums/category_enum.dart';
import 'package:evently_app/models/event_model.dart';
import 'package:evently_app/presentation/auth/services/event_service.dart';
import 'package:flutter/material.dart';

class EventsProvider extends ChangeNotifier {
  List<EventModel> events = [];
  bool isLoading = false;
  String? errorMessage;
  CategoryEnum? selectedCategory;


  List<EventModel> eventsFav = [];
  bool isLoadingFav = false;
  String? errorMessageFav;
  Future getEvent() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();
    try {
      events = await EventService.getAllEvents() ?? [];
    } on Exception catch (e) {
      errorMessage = e.toString();
    }
    isLoading = false;
    notifyListeners();
  }

  Future getEventFav() async {
    isLoadingFav = true;
    errorMessageFav = null;
    notifyListeners();
    try {
      eventsFav = await EventService.getAllFav() ?? [];
    } catch (e) {
      errorMessageFav = e.toString();
    }
    isLoadingFav = false;
    notifyListeners();
  }

  void changeCategory(CategoryEnum? category) {
    selectedCategory = category;
    notifyListeners();
  }

  List<EventModel> get filteredEvents {
    if (selectedCategory == null) return events;
    return events.where((e) => e.categoryEnum == selectedCategory).toList();
  }

  void updateEvent(EventModel event) {
    for (var i = 0; i < events.length; i++) {
      if (events[i].id == event.id) {
        events[i] = event;
      }
    }
    for (var i = 0; i < eventsFav.length; i++) {
      if (eventsFav[i].id == event.id) {
        eventsFav[i] = event;
      }
    }
    notifyListeners();
  }
}
