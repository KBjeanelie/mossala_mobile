import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:mossala_mobile/features/offers/presentation/pages/main_screen.dart';
import 'package:mossala_mobile/screen/main/menu_screen.dart';
import 'package:mossala_mobile/screen/main/user_projet_screen.dart';
import 'package:mossala_mobile/features/worker/presentation/pages/worker_screen.dart';

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
        currentIndex: _currentIndex,
        iconSize: 25,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            activeIcon: Icon(EvaIcons.home),
            icon: Icon(EvaIcons.homeOutline),
            label: 'Accueil'
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(EvaIcons.people),
            icon: Icon(EvaIcons.peopleOutline),
            label: 'Prestataire'
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(EvaIcons.briefcase),
            icon: Icon(EvaIcons.briefcaseOutline),
            label: 'Mes Projets'
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(EvaIcons.menu2),
            icon: Icon(EvaIcons.menu),
            label: 'Menu'
          )
        ],
      )
    );
  }
}