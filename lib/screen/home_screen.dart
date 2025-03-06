import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mossala_mobile/core/theme/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _currentIndex = 0;
  final List<Widget> screens = [
    Center(child: Text('Accueil')),
    Center(child: Text('Rechercher')),
    Center(child: Text('Profil')),
    Center(child: Text('Profil')),
    Center(child: Text('Profil')),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.textDark,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
        ),
        title:Image(
          image: AssetImage('assets/logo.png'),
          width: 90,
        ),
      ),
      body: screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 2,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        unselectedItemColor: AppColors.textLight,
         selectedItemColor: AppColors.primary,
        unselectedLabelStyle: GoogleFonts.poppins(
          color: AppColors.backgroundDark,
          fontSize: 14,
          fontWeight: FontWeight.w600
        ),
        selectedLabelStyle: GoogleFonts.poppins(
          color: AppColors.primary,
          fontSize: 16,
          fontWeight: FontWeight.w600
        ),
        iconSize: 35,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_max),
            label: 'Accueil'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Prestataires'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_repair_service),
            label: 'Projets'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message_sharp),
            label: 'Messages'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Menu'
          )
        ],
      )
    );
  }
}