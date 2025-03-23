import 'package:flutter/material.dart';
import 'package:mossala_mobile/core/theme/app_colors.dart';
import 'package:mossala_mobile/core/theme/app_sizes.dart';
import 'package:mossala_mobile/core/utils/validators.dart';
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
    if (_formKey.currentState!.validate()) {
      // Form is valid, proceed with submission
    }
    //Navigator.push(context, MaterialPageRoute(builder: (context) => ConfirmPasswordScreen()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  return Container(
                    padding: AppSizes.spaceHV,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: MediaQuery.of(context).size.height * 0.35),
                        headingTextApp("S'inscrire", context),
                        SizedBox(height: 20,),
                        normalTextApp("Numéro de téléphone", context),
                        inputForm("", telControler, Validators.validatePhoneNumber, type: TextInputType.phone),
                        SizedBox(height: 10,),
                        normalTextApp("Votre quartier", context),
                        inputForm("", quarterControler, Validators.validateQuater, type: TextInputType.text),
                        SizedBox(height: 10,),
                        buttonApp(context, submitForm, "Créer un compte",),
                      ],
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                normalTextApp("Vous avez déjà un compte?", context),
                TextButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginScreen()),(route) => false,);
                  },
                  child: Text(
                    "Se connecter",
                    style: TextStyle(color: AppColors.secondary),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}