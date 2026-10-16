import 'package:evently_app/enums/category_enum.dart';
import 'package:evently_app/models/event_model.dart';
import 'package:evently_app/presentation/home/tabs/fav_tab/fav_tab.dart';
import 'package:evently_app/presentation/home/tabs/home_tap/home_tap.dart';
import 'package:evently_app/presentation/home/tabs/profile_tap/profile_tap.dart';
import 'package:evently_app/presentation/home/widgets/event_card.dart';
import 'package:evently_app/presentation/home/widgets/home_header.dart';
import 'package:evently_app/presentation/new_event/new_event_screen.dart';
import 'package:evently_app/themes/app_colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = "/homeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentTabIndex = 0;
  List<Widget> tabs() => [ HomeTap(),  FavTab(),  ProfileTap()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeHeader(),
      body: tabs()[currentTabIndex],
      
      bottomNavigationBar: BottomNavigationBar(
        
        currentIndex: currentTabIndex,
        onTap: (value) {
          currentTabIndex = value;
          setState(() {});
        },
        selectedItemColor: Theme.of(context).shadowColor,
        unselectedItemColor: AppColors.iconTextFeildBorderColor,
        backgroundColor: Theme.of(context).canvasColor,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border_outlined),
            activeIcon: Icon(Icons.favorite),
            label: "Favorite",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            activeIcon: Icon(Icons.person_2),
            label: "profile",
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: ()async{
 var data=  await Navigator.of(context).pushNamed(NewEventScreen.routeName);
 if (data==true) {
   setState(() {
     
   });
 }
      },
      backgroundColor: Theme.of(context).shadowColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40)
      ),
      child: Icon(Icons.add,color: Colors.white,),
      
      ),
    );
  }
}
