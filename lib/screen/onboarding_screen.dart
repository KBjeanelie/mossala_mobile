import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mossala_mobile/core/theme/app_sizes.dart';
import 'package:mossala_mobile/screen/home_screen.dart';

import '../core/theme/app_colors.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  double progress = 0.33; // Progression initiale (1/4)

  void _nextPage() {
    if (_currentPage < 2) {
      setState(() {
        _currentPage++;
        progress += 0.33;
      });
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      setState(() {
        _currentPage--;
        progress -= 0.25;
      });
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: Column(
        children: [
          Stack(
            children: [
              Container(height: 5, color: Colors.grey[300]),
              Container(
                height: 5,
                width: MediaQuery.of(context).size.width * progress,
                color: AppColors.secondary,
              ),
            ],
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              children: [
                screenOne(context),
                screenTwo(context),
                screenThree(context),
              ],
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 20,
              children: [
                if(_currentPage > 0)
                  OutlinedButton(
                    onPressed: _previousPage,
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(width: 2, color: AppColors.secondary),
                      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    ),
                    child: Text(
                      "Retour",
                      style: TextStyle(color: AppColors.secondary),
                    ),
                  ),
                ElevatedButton(
                  onPressed: _currentPage < 2 ? _nextPage : (){
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomeScreen()),(route) => false,);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.secondary,
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  ),
                  child: Text(
                    _currentPage < 2 ? "Continuer" : "Commencer",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget screenOne(context) {
    return SingleChildScrollView(
      padding: AppSizes.spaceHV,
      child: Column(
        children: [
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
          Center(
            child: Container(
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
    );
  }

  Widget screenTwo(context) {
    return SingleChildScrollView(
      padding: AppSizes.spaceHV,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text("Inscrivez-vous en tant que Client",
              style: GoogleFonts.poppins(
                fontSize: 22,
                color: AppColors.secondary,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            )
          ),
          SizedBox(height: 5),
          Center(
            child: Image.asset(
              'assets/client.jpg',
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Recevez des offres sur-mesure',
            style: GoogleFonts.poppins(
              fontSize: 20,
              color: AppColors.lightText,
              fontWeight: FontWeight.w600
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
                      color: AppColors.secondary,
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
                      color: AppColors.secondary,
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
                          color: AppColors.lightText,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text("Décrivez votre projet ou service rapidement, indiquez votre budget et publiez-le gratuitement.",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: AppColors.lightText,
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
                      color: AppColors.secondary,
                    ),
                    child: Center(
                      child: Text("2",
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: AppColors.darkText
                        ),
                      )
                    ),
                  ),
                  Container(
                    width: 5,
                    height: 70,
                    decoration: BoxDecoration(
                      color: AppColors.secondary,
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
                          color: AppColors.lightText,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text("En moins de 48 h, recevez jusqu'à 40 devis de travailleurs indépendants expérimentés.",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: AppColors.lightText,
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
                      color: AppColors.secondary,
                    ),
                    child: Center(
                      child: Text("3",
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: AppColors.darkText
                        ),
                      )
                    ),
                  ),
                  Container(
                    width: 5,
                    height: 70,
                    decoration: BoxDecoration(
                      color: AppColors.secondary,
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
                          color: AppColors.lightText,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text("Échangez avec les travailleurs indépendants et choisissez celui qui correspond le plus à vos attentes.",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: AppColors.lightText,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          
        ],
      ),
    );
  }

  Widget screenThree(context) {
    return SingleChildScrollView(
      padding: AppSizes.spaceHV,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text("Inscrivez-vous en tant que Travailleur Indépendant",
              style: GoogleFonts.poppins(
                fontSize: 22,
                color: AppColors.secondary,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            )
          ),
          SizedBox(height: 3),
          Center(
            child: Image.asset(
              'assets/freelance.png',
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'En tant que Prestataire, proposez vos services, trouvez des missions pu marché et travaillez en toute liberté.',
            style: GoogleFonts.poppins(
              fontSize: 16,
              color: AppColors.lightText,
              fontWeight: FontWeight.w500
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Icon(Icons.check, color: AppColors.secondary, size: 35,),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5, top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Répondez aux appels d'offres",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: AppColors.lightText,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text('Déposez vos devis sur les missions ou demande de service des porteurs de projets',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: AppColors.lightText,
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
              Icon(Icons.check, color: AppColors.secondary, size: 35,),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5, top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Trouvez de nouvaux clients facilement",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: AppColors.lightText,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text("Vous pouvez contacter jusqu'à 400 clients par mois depuis votre téléphone grâce à Mosala",
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: AppColors.lightText,
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
              Icon(Icons.check, color: AppColors.secondary, size: 35,),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5, top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Discutez avec vos clients",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: AppColors.lightText,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text("Grâce à la messagerie de Mosala, vous pouvez regrouper toutes vos discusions et contacter même vos anciens clients",
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: AppColors.lightText,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}