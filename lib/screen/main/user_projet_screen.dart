import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/theme/app_colors.dart';
import '../../widgets/widgets.dart';

class UserProjetScreen extends StatelessWidget {
  const UserProjetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.textDark,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
          ),
          title: headingTextApp("Mes Projets", color: AppColors.backgroundLight),
          actions: [
            Container(
              margin: EdgeInsets.only(right: 15),
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: AppColors.backgroundLight,
                borderRadius: BorderRadius.circular(30)
              ),
              child: Center(
                child: Icon(Icons.add, size: 30, color: AppColors.textDark,),
              ),
            )
          ],
          bottom: TabBar(
            dividerHeight: 0.0,
            indicatorColor: AppColors.primary,
            labelStyle: GoogleFonts.poppins(
              fontSize: 16,
              color: AppColors.primary,
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
    return Center(child: normalTextApp("Aucun projet remporté trouvé"));
  }
}

class TabViewTwo extends StatelessWidget {
  const TabViewTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: normalTextApp("Aucun projet créé trouvé"));
  }
}