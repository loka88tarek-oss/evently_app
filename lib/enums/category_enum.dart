import 'package:evently_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';

enum CategoryEnum {
  birthday(title: "Birthday"),
  sport(title: "Sport"),
  meeting(title: "Meeting"),
  exhibtion(title: "Exhibition"),
  bookClub(title: "Book Club");
  
  final String title;
  
  const CategoryEnum({required this.title});
  String   getImage(bool isDarkMode){
    switch (this) {
      case CategoryEnum.birthday:
        return isDarkMode ? Assets.images.birthdayDark.path : Assets.images.birthday.path  ;
      case CategoryEnum.bookClub:
        return isDarkMode ? Assets.images.bookClubDark.path : Assets.images.bookClub.path  ;
        case CategoryEnum.exhibtion:
        return isDarkMode ? Assets.images.exhibtionDark.path : Assets.images.exhibition.path ;
        case CategoryEnum.meeting:
        return isDarkMode ? Assets.images.meetingDark.path : Assets.images.meeting.path  ;
        case CategoryEnum.sport:
        return isDarkMode ? Assets.images.sportDark.path : Assets.images.sport.path  ;
    }
  }
   IconData  get getIcon{
    switch (this) {
      case CategoryEnum.birthday:
        return Icons.cake_outlined  ;
      case CategoryEnum.bookClub:
        return Icons.menu_book_outlined ;
        case CategoryEnum.exhibtion:
        return Icons.palette_outlined ;
        case CategoryEnum.meeting:
        return Icons.groups_2_outlined;
        case CategoryEnum.sport:
        return Icons.directions_bike_outlined;
    }
  }
String toJson(){
  return title;
}
static CategoryEnum fromJson(String jsonName){
  for (var i = 0; i < CategoryEnum.values.length; i++) {
    if (CategoryEnum.values[i].title==jsonName) {
      return CategoryEnum.values[i];
    }
  }
  return CategoryEnum.birthday;
}
}
