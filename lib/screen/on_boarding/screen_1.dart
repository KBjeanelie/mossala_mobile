import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mossala_mobile/core/theme/app_colors.dart';

import 'screen_2.dart';

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
                  fontSize: 24,
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              )
            ),
            SizedBox(height: 30),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.7,
                height: MediaQuery.of(context).size.height * 0.4,
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
                    color: AppColors.textLight,
                  ),
                  textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Screen2()));
              },
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                color: AppColors.backgroundLogin,
                ),
                child: Icon(Icons.arrow_forward, color: Colors.white, size: 40,),
              ),
            ),
            SizedBox(height: 35),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.03,
                  height: MediaQuery.of(context).size.height * 0.008,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                  color: AppColors.backgroundLogin,
                  ),
                ),
                SizedBox(width: 5),
                Container(
                  width: MediaQuery.of(context).size.width * 0.020,
                  height: MediaQuery.of(context).size.height * 0.008,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  color: AppColors.greyLight,
                  ),
                ),
                SizedBox(width: 5),
                Container(
                  width: MediaQuery.of(context).size.width * 0.020,
                  height: MediaQuery.of(context).size.height * 0.008,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  color: AppColors.greyLight,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}