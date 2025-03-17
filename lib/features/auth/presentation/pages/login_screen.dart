import 'package:flutter/material.dart';
import 'package:mossala_mobile/core/theme/app_colors.dart';
import 'package:mossala_mobile/core/theme/app_sizes.dart';
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
    if (_formKey.currentState!.validate()) {
      // Form is valid, proceed with submission
      print("Formulaire valide !");
    }
    //Navigator.push(context, MaterialPageRoute(builder: (context) => ConfrimOtpScreen()));
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
                        headingTextApp("Connexion", context),
                        SizedBox(height: 20,),
                        normalTextApp("Numéro de téléphone", context),
                        inputForm("", telControler, Validators.validatePhoneNumber, type: TextInputType.phone),
                        SizedBox(height: 10,),
                        normalTextApp("Mot de passe", context),
                        inputForm("", passwordControler, Validators.validatePassword, obscureText: true, type: TextInputType.visiblePassword),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: smallTextApp("Mot de passe oublié?", context),
                            )
                          ],
                        ),
                        SizedBox(height: 10,),
                        buttonApp(context, submitForm, "Se connecter"),
                      ],
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                normalTextApp("Vous n'avez pas de compte ?", context),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "S'inscrire",
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