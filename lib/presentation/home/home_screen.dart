import 'package:evently_app/enums/category_enum.dart';
import 'package:evently_app/models/event_model.dart';
import 'package:evently_app/presentation/home/tabs/fav_tab/fav_tab.dart';
import 'package:evently_app/presentation/home/tabs/home_tap/home_tap.dart';
import 'package:evently_app/presentation/home/tabs/profile_tap/profile_tap.dart';
import 'package:evently_app/presentation/home/widgets/event_card.dart';
import 'package:evently_app/presentation/home/widgets/home_header.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = "/homeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentTabIndex=0;
  List<Widget> tabs = [
    const HomeTap(),
    const FavTab(),
    const ProfileTap(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeHeader(),
      body:tabs[currentTabIndex],
    
    );
  }
}
