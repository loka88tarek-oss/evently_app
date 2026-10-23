import 'package:evently_app/enums/category_enum.dart';
import 'package:evently_app/models/event_model.dart';
import 'package:flutter/material.dart';

class NewEventProvider extends ChangeNotifier {
  DateTime? eventSelectedDate;
  TimeOfDay? eventSelectedTime;
   CategoryEnum selectedCategory = CategoryEnum.birthday;
   bool isLoading = false;
   void changeLoading(bool loading){
    isLoading=loading;
    notifyListeners();
   }
  void changeDate(DateTime date){
   eventSelectedDate=date;
   notifyListeners();
  } 
void changeTime(TimeOfDay time){
   eventSelectedTime=time;
   notifyListeners();
  } 
  void changeCategory(CategoryEnum category){
   selectedCategory=category;
   notifyListeners();
  }

  int getFormattedDate(){
    if (eventSelectedDate==null||eventSelectedTime==null) {
      return 0;
    }
    DateTime date=DateTime(
      eventSelectedDate!.year,
 eventSelectedDate!.month, eventSelectedDate!.day, eventSelectedTime!.hour, eventSelectedTime!.minute,
    );
    return date.microsecondsSinceEpoch;
  }
}