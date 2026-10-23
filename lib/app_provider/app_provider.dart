import 'package:flutter/material.dart';

class  AppProvider extends ChangeNotifier{
  ThemeMode themeMode=ThemeMode.light;
  String local=("en");

  bool get isDark => themeMode == ThemeMode.dark;
  Locale get locale => Locale(local);
  changeTheme(){
    if (themeMode==ThemeMode.dark) {
       themeMode=ThemeMode.light;
    }else{
             themeMode=ThemeMode.dark;
    }
   
    notifyListeners();

  }
  changeLocal(){
  
  if (local=="ar") {
    local=("en"); 
  }  else{
    local=("ar");
  }                                              
  notifyListeners();
  }
}