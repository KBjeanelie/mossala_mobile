// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mossala_mobile/core/theme/app_colors.dart';
import 'package:mossala_mobile/core/theme/app_sizes.dart';
import 'package:mossala_mobile/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:mossala_mobile/features/auth/data/models/user_model.dart';
import 'package:mossala_mobile/features/auth/domain/entities/user_entity.dart';
import 'package:mossala_mobile/features/profil/presentation/bloc/profil_bloc.dart';
import 'package:mossala_mobile/features/profil/presentation/bloc/profil_event.dart';
import 'package:mossala_mobile/features/profil/presentation/bloc/profil_state.dart';
import 'package:mossala_mobile/widgets/widgets.dart';

import '../../../../core/utils/validators.dart';

class EditAccountScreen extends StatefulWidget {
  const EditAccountScreen({super.key});

  @override
  State<EditAccountScreen> createState() => _EditAccountScreenState();
}

class _EditAccountScreenState extends State<EditAccountScreen> {
  final AuthLocalDataSource authLocalDataSource = AuthLocalDataSource(secureStorage: FlutterSecureStorage());
  User? currentUser;
  bool isLoading = true;
  TextEditingController nomController = TextEditingController();
  TextEditingController prenomController = TextEditingController();
  TextEditingController nomUtilisateurController = TextEditingController();
  TextEditingController surnomController = TextEditingController();
  TextEditingController genreController = TextEditingController();
  TextEditingController adresseController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController dateNaissanceController = TextEditingController();
  TextEditingController facebookController = TextEditingController();

   @override
  void initState() {
    super.initState();
    _loadUser();
  }

  Future<void> _loadUser() async {
    try {
      final user = await authLocalDataSource.getUser();
      if (user != null) {
        setState(() {
          currentUser = UserModel.fromJson(user);
          nomController.text = currentUser?.lastname ?? '';
          prenomController.text = currentUser?.firstname ?? '';
          nomUtilisateurController.text = currentUser?.username ?? ' ';
          surnomController.text = currentUser?.nickname ?? ' ';
          genreController.text = currentUser?.gender ?? ' ';
          adresseController.text = currentUser?.address ?? ' ';
          emailController.text = currentUser?.email ?? ' ';
          phoneController.text = currentUser?.tel ?? ' ';
          dateNaissanceController.text = currentUser?.dateOfBirth ?? ' ';
          facebookController.text = currentUser?.facebook ?? ' ';
          isLoading = false;
        });
      }
    } catch (e) {
      log("ERROR : $e");
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: normalTextApp("Erreur lors du chargement des informations.", context),
          backgroundColor: AppColors.closed,
        ),
      );
    }
  }

  void _updateUserProfile() {
    final userProfil = UserModel(
      lastname: nomController.text,
      firstname: prenomController.text,
      username: nomUtilisateurController.text,
      nickname: surnomController.text,
      gender: genreController.text,
      address: adresseController.text,
      email: emailController.text,
      tel: phoneController.text,
      dateOfBirth: dateNaissanceController.text,
      facebook: facebookController.text, 
      emailVerified: currentUser!.emailVerified, 
      dateJoined: currentUser!.dateJoined, 
      lastLogin: currentUser!.lastLogin ?? "", 
      isVerified: currentUser!.isVerified, 
      isStaff: currentUser!.isStaff, 
      isSuperuser: currentUser!.isSuperuser, 
      isActive: currentUser!.isActive, 
      id: currentUser!.id,
    );
  
    // Déclencher l'événement dans le bloc
    context.read<ProfilBloc>().add(UserUpdateProfilEvent(userProfil));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: headingTextApp("Modifier mon profil", context),
      ),
      body: BlocConsumer<ProfilBloc, ProfilState>(
        listener: (context, state) {
          if (state is ProfilLoading) {
            // Afficher un indicateur de chargement
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) => Center(child: CircularProgressIndicator()),
            );
          } else if (state is UpdatedUserProfil) {
            // Fermer le dialogue de chargement
            Navigator.of(context, rootNavigator: true).pop();

            // Afficher un message de succès
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Profil mis à jour avec succès !"),
                backgroundColor: Colors.green,
              ),
            );
          } else if (state is ProfilError) {
            // Fermer le dialogue de chargement
            Navigator.of(context, rootNavigator: true).pop();

            // Afficher un message d'erreur
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Erreur : ${state.message}"),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          return ListView(
            padding: EdgeInsets.symmetric(horizontal: 5),
            children: [
              Card(
                child: Padding(
                  padding: AppSizes.spaceHV,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      normalTextApp("Nom", context),
                      inputForm("", nomController, Validators.validateInput, type: TextInputType.name),
                      SizedBox(height: 15),
                      normalTextApp("Prenom", context),
                      inputForm("", prenomController, Validators.validateInput, type: TextInputType.name),
                      SizedBox(height: 15),
                      normalTextApp("Nom utilisateur", context),
                      inputForm("", nomUtilisateurController, Validators.validateInput, type: TextInputType.name),
                      SizedBox(height: 15),
                      // normalTextApp("Surnom", context),
                      // inputForm("", surnomController, Validators.validateInput, type: TextInputType.name),
                      // SizedBox(height: 15),
                      normalTextApp("Genre", context),
                      inputForm("", genreController, Validators.validateInput, type: TextInputType.name),
                      SizedBox(height: 15),
                      normalTextApp("Quartier", context),
                      inputForm("", adresseController, Validators.validateInput, type: TextInputType.text),
                      SizedBox(height: 15),
                      normalTextApp("Email", context),
                      inputForm("", emailController, Validators.validateInput, type: TextInputType.emailAddress),
                      SizedBox(height: 15),
                      normalTextApp("Numéro de téléphone", context),
                      inputForm("", phoneController, Validators.validateInput, type: TextInputType.phone),
                      SizedBox(height: 15),
                      // normalTextApp("Date de naissance", context),
                      // inputForm("", dateNaissanceController, Validators.validateInput, type: TextInputType.text),
                      // SizedBox(height: 15),
                      // normalTextApp("Compte facebook", context),
                      // inputForm("", facebookController, Validators.validateInput, type: TextInputType.text),
                      SizedBox(height: 15),
                      mainButtonApp(context, _updateUserProfile, "Modifier"),
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}