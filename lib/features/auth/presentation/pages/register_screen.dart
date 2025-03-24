import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mossala_mobile/core/theme/app_colors.dart';
import 'package:mossala_mobile/core/theme/app_sizes.dart';
import 'package:mossala_mobile/core/utils/validators.dart';
import 'package:mossala_mobile/widgets/widgets.dart';

import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController firstnameController = TextEditingController();
  TextEditingController telControler = TextEditingController();
  TextEditingController addressControler = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmePasswordController = TextEditingController();

  final PageController _pageController = PageController();
  int _currentPage = 0;
  void _nextPage() {
    if (_formKey.currentState!.validate()) {
      if (_currentPage < 2) {
        setState(() {
          _currentPage++;
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
      final authBloc = BlocProvider.of<AuthBloc>(context);
      authBloc.add(RegisterEvent(
        lastnameController.text,
        firstnameController.text,
        telControler.text,
        addressControler.text,
        passwordController.text,
      ));
      
    }
  }

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthLoading) {
          // Afficher un indicateur de chargement
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => Center(child: CircularProgressIndicator()),
          );
        } else if (state is AuthAuthenticated) {
          Navigator.of(context).pop();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: normalTextApp("Compte crée !", context), backgroundColor: AppColors.open),
          );
          context.go('/');
        } else if (state is AuthError) {
          Navigator.of(context).pop();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: normalTextApp(state.message, context), backgroundColor: Colors.red),
          );
        }
      },
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: PageView(
                  controller: _pageController,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    // Étape 1
                    SingleChildScrollView(
                      child: _buildStep(
                        title: "Information général", 
                        description: "Saisissez votre nom et prénom afin d'augmenter votre visibilité", 
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            normalTextApp("Nom", context),
                            inputForm("", lastnameController, Validators.validateName, type: TextInputType.name),
                            SizedBox(height: 10,),
                            normalTextApp("Prénom", context),
                            inputForm("", firstnameController, Validators.validateFirstName, type: TextInputType.name),
                          ],
                        ),
                      ),
                    ),
                    // Étape 2
                    SingleChildScrollView(
                      child: _buildStep(
                        title: "Vos coordonnées", 
                        description: "Ajoutez votre numéro de téléphone et votre quartier pour recevoir plus d'appels", 
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            normalTextApp("Numéro de téléphone", context),
                            inputForm("", telControler, Validators.validatePhoneNumber, type: TextInputType.phone),
                            SizedBox(height: 10,),
                            normalTextApp("Adresse", context),
                            inputForm("", addressControler, Validators.validateInput, type: TextInputType.streetAddress),
                          ],
                        ),
                      ),
                    ),
                    // Étape 3
                    SingleChildScrollView(
                      child: _buildStep(
                        title: "Sécurisez votre compte", 
                        description: "Entrez un mot de passe solide et nous protégerons vos informations personnelles", 
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            normalTextApp("Nouveau mot de passe", context),
                            inputForm("", passwordController, Validators.validatePassword, type: TextInputType.visiblePassword, obscureText: true),
                            SizedBox(height: 10,),
                            normalTextApp("Confirmer mot de passe", context),
                            inputForm("", confirmePasswordController, (value) => Validators.validateConfirmPassword(value, passwordController.text), type: TextInputType.visiblePassword, obscureText: true),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (_currentPage > 0)
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
                    SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: _currentPage < 2 ? _nextPage : submitForm,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.secondary,
                        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      ),
                      child: Text(
                        _currentPage < 2 ? "Continuer" : "Terminer",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  normalTextApp("Vous avez déjà un compte?", context),
                  TextButton(
                    onPressed: () => context.go('/login'),
                    child: Text(
                      "Se connecter",
                      style: TextStyle(color: AppColors.secondary),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStep({required String title, required String description, required Widget child}) {
    return Padding(
      padding: AppSizes.spaceHV,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.35),
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