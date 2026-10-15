import 'package:evently_app/enums/category_enum.dart';

class EventModel {
  String title;
  String date;
  String description;
  bool isFav;
  String? id;
  CategoryEnum categoryEnum;
  EventModel({
    required this.categoryEnum,
    required this.date,
    this.id,
    required this.isFav,
    required this.title,
    required this.description,
  });
}
