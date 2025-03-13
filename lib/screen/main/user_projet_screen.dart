import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/theme/app_colors.dart';
import '../../widgets/app_bar.dart';
import '../../widgets/cards.dart';
import '../../widgets/widgets.dart';

class UserProjetScreen extends StatelessWidget {
  const UserProjetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: headingTextApp("Mes Projets",context),
          actions: customeAction(context),
          bottom: TabBar(
            dividerHeight: 0.0,
            indicatorColor: AppColors.secondary,
            labelStyle: GoogleFonts.poppins(
              fontSize: 16,
              color: AppColors.secondary,
              fontWeight: FontWeight.w600
            ),
            tabs: [
              Tab(text: "Projets remportés",),
              Tab(text: "Projets créés",)
            ],
          ),
        ),
        body: TabBarView(
          children: [
            TabViewOne(),
            TabViewTwo()
          ],
        ),
      ),
    );
  }
}


class TabViewOne extends StatelessWidget {
  const TabViewOne({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CardOfferView(),
          CardOfferView(),
          CardOfferView(),
          CardOfferView(),
          CardOfferView(),
          CardOfferView(),
          CardOfferView(),
        ],
      ),
    );
  }
}

class TabViewTwo extends StatelessWidget {
  const TabViewTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CardOfferView(),
          CardOfferView(),
          CardOfferView(),
          CardOfferView(),
        ],
      ),
    );
  }
}