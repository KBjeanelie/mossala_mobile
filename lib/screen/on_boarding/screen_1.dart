import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mossala_mobile/core/theme/app_colors.dart';


class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(height: 50),
            Center(
              child: Text("Trouvez les meilleurs travailleurs indépendants facilement.",
                style: GoogleFonts.poppins(
                  fontSize: 22,
                  color: AppColors.secondary,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              )
            ),
            SizedBox(height: 30),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.7,
                margin: EdgeInsets.only(top: 20),
                child: Image.asset(
                  'assets/onboarding_img.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 30),
            Center(
              child: Text(
                'Postez vos projets et connectez-vous aux experts en quelques clics.',
                style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: AppColors.lightText,
                  ),
                  textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}