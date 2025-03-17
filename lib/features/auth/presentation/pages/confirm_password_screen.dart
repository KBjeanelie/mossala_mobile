import 'package:flutter/material.dart';
import 'package:mossala_mobile/core/utils/validators.dart';
import 'package:mossala_mobile/features/auth/presentation/pages/otp_screen.dart';
import 'package:mossala_mobile/widgets/widgets.dart';

class ConfirmPasswordScreen extends StatefulWidget {
  const ConfirmPasswordScreen({super.key});

  @override
  State<ConfirmPasswordScreen> createState() => _ConfirmPasswordScreenState();
}

class _ConfirmPasswordScreenState extends State<ConfirmPasswordScreen> {

  final _formKey = GlobalKey<FormState>();
  TextEditingController telControler = TextEditingController();
  TextEditingController passwordControler = TextEditingController();
  TextEditingController confirmPasswordControler = TextEditingController();

  String? validateConfirmPassword(String? value) {
    if (value == null || value!= passwordControler.text) return "Les mots de passe ne correspondent pas";
    return null;
  }

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
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.35),
              normalTextApp("Securisez votre compte avec un mot de passe", context),
              SizedBox(height: 20),
              inputForm("Mot de passe", passwordControler, Validators.validatePassword,type: TextInputType.phone),
              SizedBox(height: 20),
              inputForm("Confirmé mot de passe", confirmPasswordControler, validateConfirmPassword,type: TextInputType.text, obscureText: true),
              SizedBox(height: 20),
              buttonApp(context, submitForm, 'Confirmer'),
            ],
          ),
        ),
      ),
    );
  }
}