import 'package:flutter/material.dart';
import 'package:mossala_mobile/core/utils/validators.dart';
import 'package:mossala_mobile/screen/home_screen.dart';

import '../../../../widgets/widgets.dart';

class ConfrimOtpScreen extends StatefulWidget {
  const ConfrimOtpScreen({super.key});

  @override
  State<ConfrimOtpScreen> createState() => _ConfrimOtpScreenState();
}

class _ConfrimOtpScreenState extends State<ConfrimOtpScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController optControler = TextEditingController();

  void submitForm() {
    if (_formKey.currentState!.validate()) {
      // Form is valid, proceed with submission
      print("Formulaire valide !");
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomeScreen()),(route) => false,);
    }
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
              normalTextApp("Entrez le code que vous avez recu sur votre telephone", context,),
              SizedBox(height: 20,),
              inputForm("Code", 
                optControler,
                Validators.validateOTP,
                type: TextInputType.phone
              ),
              SizedBox(height: 20),
              Center(child: buttonApp(context, submitForm, 'Envoyer'))
            ],
          ),
        ),
      ),
    );
  }
}