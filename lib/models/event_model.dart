import 'package:evently_app/enums/category_enum.dart';
import 'package:firebase_auth/firebase_auth.dart';

class EventModel {
  String title;
  int date;
  String description;
  List<String>? favorites;
  String? id;
  CategoryEnum categoryEnum;
  EventModel({
    required this.categoryEnum,
    required this.date,
    this.id,
    this.favorites,
    required this.title,
    required this.description,
  });
  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "description": description,
      "favorites": favorites,
      "id": id,
      "date": date,
      "categoryEnum": categoryEnum.toJson(),
    };
  }

  Map<String, dynamic> updateFav() {
    return {"favorites": favorites};
  }

  bool get isFav =>
      (favorites ?? []).contains(FirebaseAuth.instance.currentUser?.uid);
  DateTime get dateValue => DateTime.fromMicrosecondsSinceEpoch(date);
  static EventModel fromJson(Map<String, dynamic> json) {
    return EventModel(
      categoryEnum: CategoryEnum.fromJson(json['categoryEnum']??''),
      date: json['date']??0,
      favorites:List<String>.from( json['favorites']??[]),
      title: json['title']??'',
      description: json['description']??'',
      id: json['id']??'',
    );
  }
}
