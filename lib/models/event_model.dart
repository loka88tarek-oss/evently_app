import 'package:evently_app/enums/category_enum.dart';

class EventModel {
  String title;
  int date;
  String description;
  bool isFav;
  String? id;
  CategoryEnum categoryEnum;
  EventModel({
    required this.categoryEnum,
    required this.date,
    this.id,
    this.isFav = false,
    required this.title,
    required this.description,
  });
  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "description": description,
      "isFav": isFav,
      "id": id,
      "date": date,
      "categoryEnum": categoryEnum.toJson(),
    };
  }
DateTime get dateValue=>DateTime.fromMicrosecondsSinceEpoch(date);
  static EventModel fromJson(Map<String, dynamic> json) {
    return EventModel(
      categoryEnum: CategoryEnum.fromJson(json['categoryEnum']),
      date: json['date'],
      isFav: json['isFav'],
      title: json['title'],
      description: json['description'],
      id: json['id']
    );
  }
}
