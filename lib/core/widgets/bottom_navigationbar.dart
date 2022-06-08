import 'package:flutter/material.dart';
import 'package:toktok/core/utils/color_utils.dart';
import 'package:toktok/features/auth/controllers/auth_controller.dart';
import 'package:toktok/features/home_page/home_screen.dart';
import 'package:toktok/features/home_page/widgets/custom_icon.dart';
import 'package:toktok/features/profile/my_profile_screen.dart';
import 'package:toktok/features/search_screen/search_screen.dart';

import '../../features/add_video/add_video_screen.dart';

class BottomBarNavigation extends StatefulWidget {
  const BottomBarNavigation({Key? key}) : super(key: key);

  @override
  _BottomBarNavigationState createState() => _BottomBarNavigationState();
}

class _BottomBarNavigationState extends State<BottomBarNavigation> {
  int pageIdx = 0;
  List? pages;
  @override

  void initState(){
    pages = [
      HomeScreen(),
      SearchScreen(),
      const AddVideoScreen(),
      ProfileScreen(uid: AuthController.instance.user.uid,)
    ];
    super.initState();
  }
  void _selectedPage(int index) {
    setState(() {
      pageIdx = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages![pageIdx],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectedPage,
        backgroundColor: backgroundColor,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.white,
        currentIndex: pageIdx,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home, size: 30,),
              label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.explore, size: 30,),
              label: "Discover"),
          BottomNavigationBarItem(icon: CustomIcon(),
              label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.message, size: 30,),
              label: "Inbox"),
          BottomNavigationBarItem(icon: Icon(Icons.person, size: 30,),
              label: "Profile"),

        ],),
    );
  }
}
