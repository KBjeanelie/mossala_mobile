// ignore_for_file: library_private_types_in_public_api

import 'dart:developer';
import 'dart:io';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mossala_mobile/core/theme/app_colors.dart';
import 'package:mossala_mobile/core/theme/app_sizes.dart';
import 'package:mossala_mobile/features/offers/presentation/bloc/offer_bloc.dart';
import 'package:mossala_mobile/features/offers/presentation/bloc/offer_state.dart';
import 'package:mossala_mobile/widgets/widgets.dart';

import '../bloc/offer_event.dart';

class CreateProjectScreen extends StatefulWidget {
  const CreateProjectScreen({super.key});

  @override
  _CreateProjectScreenState createState() => _CreateProjectScreenState();
}

class _CreateProjectScreenState extends State<CreateProjectScreen> {
  //final List<String> classes = ["CP1 A", "CP2 A", "CE1 A", "CE2 A", "CM1 A", "CM2 A"];

  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController amountController = TextEditingController();

  final PageController _pageController = PageController();
  int _currentPage = 0;
  double progress = 0.25;
  final List<XFile> _selectedImages = [];

  final ImagePicker _picker = ImagePicker();

  /// Fonction pour sélectionner des images
  Future<void> _pickImages() async {
    final List<XFile>? images = await _picker.pickMultiImage();
    if (images != null && images.isNotEmpty) {
      setState(() {
        _selectedImages.addAll(images);
      });
    }
  }

  ImageProvider imageProvider(String path) {
    if (path.startsWith('http')) {
      return NetworkImage(path); // Image en ligne
    } else {
      return FileImage(File(path)); // Image locale
    }
  }

  void _nextPage() {
    if (_formKey.currentState!.validate()) {
      if (_currentPage < 4) {
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

  void submitForm() {
    if (_formKey.currentState!.validate()) {
      log("name : ${nameController.text}");
      log("description : ${descriptionController.text}");
      log("address : ${addressController.text}");
      log("amount : ${amountController.text}");
      log("images : ${_selectedImages.map((image) => image.path).join(', ')}");
      // Envoyer les données au serveur
      final offerBloc = BlocProvider.of<OfferBloc>(context);
      offerBloc.add(OfferEventCreate(
        nameController.text,
        descriptionController.text,
        addressController.text,
        double.parse(amountController.text),
        _selectedImages.map((image) => File(image.path)).toList(),
      ));
      context.go('/');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<OfferBloc, OfferState>(
      listener: (context, state) {
        if (state is OfferLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => Center(child: CircularProgressIndicator()),
          );
        } else if (state is OfferCreated) {
          Navigator.of(context).pop();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: normalTextApp("Votre projet à été publier !", context), backgroundColor: AppColors.open),
          );
        } else if (state is OfferError) {
          Navigator.of(context).pop();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: normalTextApp(state.message, context), backgroundColor: Colors.red),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(),
        body: Form(
          key: _formKey,
          child: Column(
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
                    SingleChildScrollView(
                      child: _buildStep(
                        title: "Quel est votre besoin ?",
                        description:
                            "Décrivez le service que vous voulez obtenir en quelques mots.",
                        child: Column(
                          children: [
                            TextFormField(
                              controller: nameController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Ce champ est obligatoire";
                                }
                                if (value.length < 5) {
                                  return "Votre besoin doit avoir au moins 5 caractères";
                                }
                                return null; // Retourne null si tout est bon
                              },
                              decoration: InputDecoration(
                                hintText:
                                    "Ex : Reparation pompe, changer une porte, etc...",
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 12),
                              ),
                            ),
                            SizedBox(height: 20),

                            // Carte avec texte + image
                            Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              elevation: 3,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          normalTextApp(
                                              "Recevez gratuitement des devis en",
                                              context),
                                          Text(
                                            "seulement 2 minutes sur Mosala",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: AppColors.working),
                                          ),
                                          SizedBox(height: 5),
                                          Text(
                                              "1ère plateforme de freelance en France"),
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
                    ),

                    // Étape 2
                    _buildStep(
                      title: "Ajoutez des images",
                      description:
                          "Ajoutez une ou plusieurs images pour illustrer votre projet.",
                      child: Column(
                        children: [
                          ElevatedButton.icon(
                            onPressed: _pickImages,
                            icon: Icon(EvaIcons.camera),
                            label: normalTextApp("Ajouter des images", context),
                          ),
                          SizedBox(height: 10),
                          _selectedImages.isEmpty
                              ? normalTextApp(
                                  "Aucune image sélectionnée", context)
                              : Wrap(
                                  spacing: 10,
                                  children: _selectedImages.map((image) {
                                    return Stack(
                                      alignment: Alignment.topRight,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          child: Image(
                                            image: imageProvider(image.path),
                                            width: 100,
                                            height: 100,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              _selectedImages.remove(image);
                                            });
                                          },
                                          child: CircleAvatar(
                                            backgroundColor: Colors.red,
                                            radius: 12,
                                            child: Icon(Icons.close,
                                                size: 16, color: Colors.white),
                                          ),
                                        ),
                                      ],
                                    );
                                  }).toList(),
                                ),
                        ],
                      ),
                    ),

                    // Étape 3
                    _buildStep(
                      title: "Détails supplémentaires",
                      description:
                          "Ajoutez des informations utiles sur votre projet.",
                      child: TextFormField(
                        controller: descriptionController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Ce champ est obligatoire";
                          }
                          if (value.length < 20) {
                            return "Ce champs doit avoir au moins 20 caractères";
                          }
                          return null; // Retourne null si tout est bon
                        },
                        maxLength: 800,
                        maxLines: 8,
                        minLines: 4,
                        decoration: InputDecoration(
                            hintText:
                                "Ex : Montant que vous avez, délai souhaité...",
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 12),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.secondary, width: 2)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.secondary, width: 2)),
                            focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color:
                                        const Color.fromARGB(255, 192, 27, 27),
                                    width: 2)),
                            errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color:
                                        const Color.fromARGB(255, 192, 27, 27),
                                    width: 2))),
                      ),
                    ),

                    // Étape 4
                    _buildStep(
                      title: "Informations supplementaire",
                      description:
                          "Ajoutez le montant et l'adresse du travail à effectué",
                      child: Column(
                        spacing: 20,
                        children: [
                          TextFormField(
                            controller: amountController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Ce champ est obligatoire";
                              }
                              if (value.length < 3) {
                                return "Montant minimun doit être 100";
                              }
                              return null; // Retourne null si tout est bon
                            },
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                hintText: "Ex : 15 000F CFA",
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 12),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColors.lightBorder,
                                        width: 2)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColors.secondary, width: 2)),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: const Color.fromARGB(
                                            255, 192, 27, 27),
                                        width: 2)),
                                errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: const Color.fromARGB(
                                            255, 192, 27, 27),
                                        width: 2))),
                          ),
                          TextFormField(
                            controller: addressController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Ce champ est obligatoire";
                              }
                              if (value.length < 5) {
                                return "l'adresse concerné doit avoir au moins 5 caractères";
                              }
                              return null; // Retourne null si tout est bon
                            },
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                hintText: "Ex : 50 rue Nkouma, Moungali",
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 12),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColors.lightBorder,
                                        width: 2)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColors.secondary, width: 2)),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: const Color.fromARGB(
                                            255, 192, 27, 27),
                                        width: 2)),
                                errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: const Color.fromARGB(
                                            255, 192, 27, 27),
                                        width: 2))),
                          ),
                        ],
                      ),
                    ),

                    // _buildStep(
                    //   title: "Trouver un prestataire",
                    //   description: "Choisissez le métier/profil que vous recherchez pour la realisation de ce service demandé",
                    //   child: MultiSelectSearchableDropdown(
                    //     items: classes,
                    //     hintText: "Sélectionnez une classe",
                    //     onSelected: (value) {
                    //     },
                    //   ),
                    // ),
                  ],
                ),
              ),

              // Bouton Continuer
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.check_circle, color: AppColors.working),
                  SizedBox(width: 5),
                  Text("Simple, rapide et gratuit",
                      style: TextStyle(color: AppColors.working)),
                ],
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 20,
                  children: [
                    if (_currentPage > 0)
                      OutlinedButton(
                        onPressed: _previousPage,
                        style: OutlinedButton.styleFrom(
                          side:
                              BorderSide(width: 2, color: AppColors.secondary),
                          padding: EdgeInsets.symmetric(
                              horizontal: 50, vertical: 15),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                        ),
                        child: Text(
                          "Retour",
                          style: TextStyle(color: AppColors.secondary),
                        ),
                      ),
                    ElevatedButton(
                      onPressed: _currentPage < 3 ? _nextPage : submitForm,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.secondary,
                        padding:
                            EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
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
        ),
      ),
    );
  }

  // Widget réutilisable pour chaque étape
  Widget _buildStep(
      {required String title,
      required String description,
      required Widget child}) {
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
