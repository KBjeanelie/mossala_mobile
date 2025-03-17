import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mossala_mobile/core/theme/app_sizes.dart';
import 'package:mossala_mobile/features/auth/presentation/pages/login_screen.dart';
import 'package:mossala_mobile/widgets/widgets.dart';

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
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginScreen()),(route) => false,);
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
                'assets/onboarding_img.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 30),
          Center(
            child: normalTextApp("Postez vos projets et connectez-vous aux experts en quelques clics.", context)
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
            child: Image.asset(
              'assets/client.png',
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 20),
          mediumTextApp("Recevez des offres sur-mesure", context),
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
                      normalTextApp("Publiez gratuitement votre projet ou sevice en 2 min", context),
                      SizedBox(height: 5),
                      smallTextApp("Décrivez votre projet ou service rapidement, indiquez votre budget et publiez-le gratuitement.", context),
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
                      normalTextApp("Recevez des propositions immédiatement", context),
                      SizedBox(height: 5),
                      smallTextApp("Recevez des propositions de travailleurs indépendants qualifiés en quelques minutes.", context),
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
                      normalTextApp("Choisissez le meilleur travailleur indépendant", context),
                      SizedBox(height: 5),
                      smallTextApp("Comparez les offres reçues et choisissez le travailleur indépendant qui vous convient le mieux.", context),
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
            child: Text("Inscrivez-vous gratuitement et commencez à travailler.",
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
          mediumTextApp("Pourquoi s'inscrire sur Mosala ?", context),
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
                      normalTextApp("Déposez vos devis gratuitement", context),
                      SizedBox(height: 5),
                      smallTextApp("Déposez vos devis gratuitement et recevez des propositions de projets en quelques minutes", context),
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
                      normalTextApp("Contactez vos clients", context),
                      SizedBox(height: 5),
                      smallTextApp("Contactez vos clients et discutez avec eux en toute sécurité grâce à la messagerie de Mosala", context),
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
                      normalTextApp("Recevez des paiements sécurisés", context),
                      SizedBox(height: 5),
                      smallTextApp("Recevez des paiements sécurisés pour vos projets et services grâce à notre système de paiement sécurisé", context),
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