import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mossala_mobile/core/theme/app_colors.dart';
import 'package:mossala_mobile/screen/main/chats_screen.dart';
import 'package:mossala_mobile/screen/main/main_screen.dart';
import 'package:mossala_mobile/screen/main/menu_screen.dart';
import 'package:mossala_mobile/screen/main/user_projet_screen.dart';
import 'package:mossala_mobile/screen/main/worker_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _currentIndex = 0;
  final List<Widget> screens = [
    MainScreen(),
    WorkerScreen(),
    UserProjetScreen(),
    MenuScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        elevation: 2,
        unselectedItemColor: AppColors.darkBackground,
        selectedItemColor: AppColors.secondary,
        currentIndex: _currentIndex,
        iconSize: 30,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            activeIcon: Icon(EvaIcons.home),
            icon: Icon(EvaIcons.homeOutline),
            label: ''
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(EvaIcons.people),
            icon: Icon(EvaIcons.peopleOutline),
            label: ''
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(EvaIcons.briefcase),
            icon: Icon(EvaIcons.briefcaseOutline),
            label: ''
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(EvaIcons.menu2),
            icon: Icon(EvaIcons.menu2Outline),
            label: ''
          )
        ],
      )
    );
  }
}