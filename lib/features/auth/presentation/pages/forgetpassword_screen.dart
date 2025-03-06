import 'package:flutter/material.dart';
import 'package:mossala_mobile/core/theme/app_colors.dart';
import 'package:mossala_mobile/core/utils/validators.dart';
import 'package:mossala_mobile/features/auth/presentation/pages/confirm_password_screen.dart';
import 'package:mossala_mobile/widgets/widgets.dart';


class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController telControler = TextEditingController();

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
              normalTextApp("Entrez votre numero pour pouvoir changer votre mot de passe", color: AppColors.textDark,),
              SizedBox(height: 20),
              inputForm("Numéro de téléphone", telControler, Validators.validatePhoneNumber,type: TextInputType.phone),
              SizedBox(height: 20),
              buttonApp(context, submitForm, 'Envoyer le code'),
            ],
          ),
        ),
      ),
    );
  }
}