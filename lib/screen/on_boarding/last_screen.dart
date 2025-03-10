import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mossala_mobile/core/theme/app_colors.dart';
import 'package:mossala_mobile/features/auth/presentation/pages/register1.dart';

class LastScreen extends StatelessWidget {
  const LastScreen({super.key});

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
              child: Text("Inscrivez-vous gratuitement",
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              )
            ),
            SizedBox(height: 100),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text('Choisissez votre profil : ',
                style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: AppColors.textLight,
                  ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Register1()));
              },
              child: Card(
                margin: EdgeInsets.symmetric(vertical: 30),
                color: Colors.white,
                elevation: 3,
                shadowColor: AppColors.greyLight,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Row(
                    spacing: 10,
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: AppColors.primary,
                        ),
                        child: Icon(Icons.person, color: Colors.white, size: 40,),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Client',
                              style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  color: AppColors.textLight,
                                  fontWeight: FontWeight.w600
                                ),
                            ),
                            SizedBox(height: 5),
                            Text("J'ai un projet ou service à réalisé",
                              style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  color: AppColors.textLight,
                                ),
                            ),
                          ],
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios, color: const Color(0xFF5B5959), size: 30,),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Center(
                child: Text('Ou ',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: AppColors.textLight,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Register1()));
              },
              child: Card(
                margin: EdgeInsets.symmetric(vertical: 30),
                color: Colors.white,
                elevation: 3,
                shadowColor: AppColors.greyLight,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Row(
                    spacing: 10,
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: AppColors.primary,
                        ),
                        child: Icon(Icons.work, color: Colors.white, size: 40,),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Travailleur indépendant',
                              style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  color: AppColors.textLight,
                                  fontWeight: FontWeight.w600
                                ),
                            ),
                            SizedBox(height: 5),
                            Text("Je cherche des projets ou des marchés",
                              style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  color: AppColors.textLight,
                                ),
                            ),
                          ],
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios, color: const Color(0xFF5B5959), size: 30,),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}