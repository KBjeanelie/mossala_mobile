import 'package:flutter/material.dart';
import 'package:mossala_mobile/core/theme/app_colors.dart';
import 'package:mossala_mobile/core/utils/validators.dart';
import 'package:mossala_mobile/features/auth/presentation/pages/forgetpassword_screen.dart';
import 'package:mossala_mobile/features/auth/presentation/pages/register1.dart';
import 'package:mossala_mobile/widgets/widgets.dart';

import 'otp_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _formKey = GlobalKey<FormState>();
  TextEditingController telControler = TextEditingController();
  TextEditingController passwordControler = TextEditingController();

  void submitForm() {
    // if (_formKey.currentState!.validate()) {
    //   // Form is valid, proceed with submission
    //   print("Formulaire valide !");
    // }
    Navigator.push(context, MaterialPageRoute(builder: (context) => ConfrimOtpScreen()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLogin,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.35),
              mediumTextApp("Connexion", color: AppColors.textDark, font: FontWeight.w600),
              SizedBox(height: 20),
              inputForm("Numéro de téléphone", telControler, Validators.validatePhoneNumber,type: TextInputType.phone),
              SizedBox(height: 20),
              inputForm("Mot de passe", passwordControler, Validators.validatePassword,type: TextInputType.text, obscureText: true),
              SizedBox(height: 20),
              buttonApp(context, submitForm, 'Connexion'),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ForgetPasswordScreen()));
                    },
                    child: normalTextApp(
                      "Mot de passe oublié?", 
                      size: 12.0,
                      color: AppColors.textDark,
                      underline: TextDecoration.underline,
                    ),
                  )
                ],
              ),
              SizedBox(height: 25),
              Row(
                spacing: 5,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  normalTextApp(
                    "Vous n'avez pas de compte ?", 
                    size: 12.0,
                    color: AppColors.textDark,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Register1()));
                    },
                    child: normalTextApp(
                      "S'inscrire", 
                      size: 12.0,
                      color: AppColors.textDark,
                      underline: TextDecoration.underline,
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
}