import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mossala_mobile/core/theme/app_colors.dart';
import 'package:mossala_mobile/screen/on_boarding/last_screen.dart';

class Screen3 extends StatelessWidget {
  const Screen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 70),
            Center(
              child: Text("Inscrivez-vous en tant que Travailleur Indépendant",
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
                  'assets/freelance.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 30),
            Text(
              'En tant que Prestataire, proposez vos services, trouvez des missions pu marché et travaillez en toute liberté.',
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: AppColors.textLight,
                fontWeight: FontWeight.w500
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            Row(
              children: [
                Icon(Icons.check, color: AppColors.backgroundLogin, size: 35,),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5, top: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Répondez aux appels d'offres",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: AppColors.textLight,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text('Déposez vos devis sur les missions ou demande de service des porteurs de projets',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: AppColors.textLight,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Icon(Icons.check, color: AppColors.backgroundLogin, size: 35,),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5, top: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Trouvez de nouvaux clients facilement",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: AppColors.textLight,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text("Vous pouvez contacter jusqu'à 400 clients par mois depuis votre téléphone grâce à Mosala",
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: AppColors.textLight,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Icon(Icons.check, color: AppColors.backgroundLogin, size: 35,),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5, top: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Discutez avec vos clients",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: AppColors.textLight,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text("Grâce à la messagerie de Mosala, vous pouvez regrouper toutes vos discusions et contacter même vos anciens clients",
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: AppColors.textLight,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),

            SizedBox(height: 30),
            //BOUTON COMMENCER
            Center(
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(AppColors.backgroundLogin),
                  elevation: WidgetStateProperty.all(3),
                  minimumSize: WidgetStateProperty.all(
                    Size(
                      MediaQuery.of(context).size.width * 0.5,
                      MediaQuery.of(context).size.width * 0.12
                    )
                  ),
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LastScreen()));
                },
                child: Text(
                  'Commencer',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
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
              ],
            )
          ],
        ),
      ),
    );
  }
}