import 'package:flutter/material.dart';
import 'package:mossala_mobile/widgets/app_bar.dart';

import '../../widgets/cards.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Image(
          image: AssetImage('assets/logo.png'),
          width: 90,
        ),
        actions: customeAction(context),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: List.generate(
            50,
            (index) => CardOfferView(),
          )
        ),
      ),
    );
  }
}