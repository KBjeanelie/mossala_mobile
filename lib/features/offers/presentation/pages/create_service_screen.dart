import 'package:flutter/material.dart';
import 'package:mossala_mobile/core/theme/app_colors.dart';
import 'package:mossala_mobile/core/theme/app_sizes.dart';
import 'package:mossala_mobile/widgets/widgets.dart';

class CreateServiceScreen extends StatefulWidget {
  const CreateServiceScreen({super.key});

  @override
  _CreateServiceScreenState createState() => _CreateServiceScreenState();
}

class _CreateServiceScreenState extends State<CreateServiceScreen> {
  final List<String> classes = ["CP1 A", "CP2 A", "CE1 A", "CE2 A", "CM1 A", "CM2 A"];
  final PageController _pageController = PageController();
  int _currentPage = 0;
  double progress = 0.25; // Progression initiale (1/4)

  void _nextPage() {
    if (_currentPage < 3) {
      setState(() {
        _currentPage++;
        progress += 0.25;
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
          // Barre de progression
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

          // PageView pour gérer les différentes étapes
          Expanded(
            child: PageView(
              controller: _pageController,
              physics: NeverScrollableScrollPhysics(), // Désactive le swipe
              children: [
                // Étape 1
                _buildStep(
                  title: "Quel est votre besoin ?",
                  description: "Décrivez le service que vous voulez obtenir en quelques mots.",
                  child: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          hintText: "Ex : Reparation pompe, changer une porte, etc...",
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                        ),
                      ),
                      SizedBox(height: 20),

                      // Carte avec texte + image
                      Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        elevation: 3,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    normalTextApp(
                                      "Recevez gratuitement des devis en", context
                                    ),
                                    Text(
                                      "seulement 2 minutes sur Mosala",
                                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.working),
                                    ),
                                    SizedBox(height: 5),
                                    Text("1ère plateforme de freelance en France"),
                                  ],
                                ),
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  "assets/user.jpg", // Remplace par ton image
                                  width: 80,
                                  height: 80,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Étape 2
                _buildStep(
                  title: "Détails supplémentaires",
                  description: "Ajoutez des informations utiles sur votre projet.",
                  child: TextField(
                    maxLength: 800,
                    maxLines: 8,
                    minLines: 4,
                    decoration: InputDecoration(
                      hintText: "Ex : Montant que vous avez, délai souhaité...",
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.secondary, width: 2)
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.secondary, width: 2)
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: const Color.fromARGB(255, 192, 27, 27), width: 2)
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: const Color.fromARGB(255, 192, 27, 27), width: 2)
                      )
                    ),
                  ),
                ),

                // Étape 3
                _buildStep(
                  title: "Informations supplementaire",
                  description: "Ajoutez le montant et l'adresse du travail à effectué",
                  child: Column(
                    spacing: 20,
                    children: [
                      TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: "Ex : 15 000F CFA",
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: AppColors.lightBorder, width: 2)
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: AppColors.secondary, width: 2)
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: const Color.fromARGB(255, 192, 27, 27), width: 2)
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: const Color.fromARGB(255, 192, 27, 27), width: 2)
                          )
                        ),
                      ),
                      TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: "Ex : 50 rue Nkouma, Moungali",
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: AppColors.lightBorder, width: 2)
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: AppColors.secondary, width: 2)
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: const Color.fromARGB(255, 192, 27, 27), width: 2)
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: const Color.fromARGB(255, 192, 27, 27), width: 2)
                          )
                        ),
                      ),
                    ],
                  ),
                ),

                _buildStep(
                  title: "Trouver un prestataire",
                  description: "Choisissez le métier/profil que vous recherchez pour la realisation de ce service demandé",
                  child: MultiSelectSearchableDropdown(
                    items: classes,
                    hintText: "Sélectionnez une classe",
                    onSelected: (value) {
                      print("Classe sélectionnée: $value");
                    },
                  ),
                ),
              ],
            ),
          ),

          // Bouton Continuer
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.check_circle, color: AppColors.working),
              SizedBox(width: 5),
              Text("Simple, rapide et gratuit", style: TextStyle(color: AppColors.working)),
            ],
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
                  onPressed: _nextPage,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.secondary,
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  ),
                  child: Text(
                    _currentPage < 3 ? "Continuer" : "Terminer",
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

  // Widget réutilisable pour chaque étape
  Widget _buildStep({required String title, required String description, required Widget child}) {
    return Padding(
      padding: AppSizes.spaceHV,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30),
          headingTextApp(title, context),
          SizedBox(height: 10),
          normalTextApp(description, context),
          SizedBox(height: 10),
          child,
        ],
      ),
    );
  }
}
