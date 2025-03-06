import 'package:flutter/material.dart';
import 'package:mossala_mobile/core/theme/app_colors.dart';
import 'package:mossala_mobile/core/utils/validators.dart';
import 'package:mossala_mobile/features/auth/presentation/pages/confirm_password_screen.dart';
import 'package:mossala_mobile/features/auth/presentation/pages/login_screen.dart';
import 'package:mossala_mobile/widgets/widgets.dart';

class Register1 extends StatefulWidget {
  const Register1({super.key});

  @override
  State<Register1> createState() => _Register1State();
}

class _Register1State extends State<Register1> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController telControler = TextEditingController();
  TextEditingController quarterControler = TextEditingController();

  void submitForm() {
    // if (_formKey.currentState!.validate()) {
    //   // Form is valid, proceed with submission
    //   print("Formulaire valide !");
    // }
    Navigator.push(context, MaterialPageRoute(builder: (context) => ConfirmPasswordScreen()));
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
              mediumTextApp("Inscription", color: AppColors.textDark, font: FontWeight.w600),
              SizedBox(height: 20),
              inputForm("Numéro de téléphone", telControler, Validators.validatePhoneNumber,type: TextInputType.phone),
              SizedBox(height: 20),
              inputForm("Quartier", quarterControler, Validators.validateQuater, type: TextInputType.text, obscureText: true),
              SizedBox(height: 20),
              buttonApp(context, submitForm, "S'inscrire"),
              SizedBox(height: 30),
              Row(
                spacing: 5,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  normalTextApp(
                    "Vous avez déjà un compte?", 
                    size: 12.0,
                    color: AppColors.textDark,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                    },
                    child: normalTextApp(
                      "Se conecter", 
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