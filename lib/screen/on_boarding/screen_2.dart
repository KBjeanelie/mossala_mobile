import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mossala_mobile/screen/on_boarding/screen_3.dart';

import '../../core/theme/app_colors.dart';

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 100),
            Center(
              child: Text("Inscrivez-vous en tant que Client",
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
                width: MediaQuery.of(context).size.width * 0.4,
                height: MediaQuery.of(context).size.height * 0.2,
                margin: EdgeInsets.only(top: 20),
                child: Image.asset(
                  'assets/client.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 30),
            Text(
              'Recevez des offres sur-mesure',
              style: GoogleFonts.poppins(
                fontSize: 20,
                color: AppColors.textLight,
                fontWeight: FontWeight.w700
              ),
            ),
            SizedBox(height: 30),
            //<===============  PREMIER BLOCK ECRITURE
            Row(
              children: [
                Column(
                  children: [
                    Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: AppColors.primary,
                      ),
                      child: Center(
                        child: Text("1",
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white
                          ),
                        )
                      ),
                    ),
                    Container(
                      width: 5,
                      height: 70,
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                      ),
                    )
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Publiez gratuitement votre projet ou sevice en 2 min",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: AppColors.textLight,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text("Décrivez votre projet ou service rapidement, indiquez votre budget et publiez-le gratuitement.",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: AppColors.textLight,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            ///END
            ///
            //<==================== DEUXIEME BLOCK ECRITURE
            Row(
              children: [
                Column(
                  children: [
                    Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: AppColors.primaryLight,
                      ),
                      child: Center(
                        child: Text("2",
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: AppColors.backgroundLogin
                          ),
                        )
                      ),
                    ),
                    Container(
                      width: 5,
                      height: 70,
                      decoration: BoxDecoration(
                        color: AppColors.primaryLight,
                      ),
                    )
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Recevez des propositions immédiatement",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: AppColors.textLight,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text("En moins de 48 h, recevez jusqu'à 40 devis de travailleurs indépendants expérimentés.",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: AppColors.textLight,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            ///END
            ///
            ///<================ TROIXIÈME BLOCK
            Row(
              children: [
                Column(
                  children: [
                    Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: AppColors.primaryLight,
                      ),
                      child: Center(
                        child: Text("3",
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: AppColors.backgroundLogin
                          ),
                        )
                      ),
                    ),
                    Container(
                      width: 5,
                      height: 70,
                      decoration: BoxDecoration(
                        color: AppColors.primaryLight,
                      ),
                    )
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Choisissez votre travailleur indépendant",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: AppColors.textLight,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text("Échangez avec les travailleurs indépendants et choisissez celui qui correspond le plus à vos attentes.",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: AppColors.textLight,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 35),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Screen3()));
              },
              child: Center(
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
            ),
            SizedBox(height: 35),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
              ],
            )
          ],
        ),
      ),
    );
  }
}