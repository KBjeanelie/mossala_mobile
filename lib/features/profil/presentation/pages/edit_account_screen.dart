import 'package:flutter/material.dart';
import 'package:mossala_mobile/core/theme/app_sizes.dart';
import 'package:mossala_mobile/widgets/widgets.dart';

import '../../../../core/utils/validators.dart';

class EditAccountScreen extends StatefulWidget {
  const EditAccountScreen({super.key});

  @override
  State<EditAccountScreen> createState() => _EditAccountScreenState();
}

class _EditAccountScreenState extends State<EditAccountScreen> {
  final TextEditingController controler = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: headingTextApp("Modifier mon profil", context),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 5),
        children: [
          Card(
            child: Padding(
              padding: AppSizes.spaceHV,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  normalTextApp("Nom", context),
                  inputForm("", controler, Validators.validateInput, type: TextInputType.name),
                  SizedBox(height: 15),
                  normalTextApp("Prenom", context),
                  inputForm("", controler, Validators.validateInput, type: TextInputType.name),
                  SizedBox(height: 15),
                  normalTextApp("Prenom", context),
                  inputForm("", controler, Validators.validateInput, type: TextInputType.name),
                  SizedBox(height: 15),
                  normalTextApp("Prenom", context),
                  inputForm("", controler, Validators.validateInput, type: TextInputType.name),
                  SizedBox(height: 15),
                  normalTextApp("Prenom", context),
                  inputForm("", controler, Validators.validateInput, type: TextInputType.name),
                  SizedBox(height: 15),
                  normalTextApp("Prenom", context),
                  inputForm("", controler, Validators.validateInput, type: TextInputType.name),
                  SizedBox(height: 15),
                  normalTextApp("Prenom", context),
                  inputForm("", controler, Validators.validateInput, type: TextInputType.name),
                  SizedBox(height: 15),
                  normalTextApp("Prenom", context),
                  inputForm("", controler, Validators.validateInput, type: TextInputType.name),
                  SizedBox(height: 15),
                  normalTextApp("Prenom", context),
                  inputForm("", controler, Validators.validateInput, type: TextInputType.name),
                  SizedBox(height: 15),
                  normalTextApp("Prenom", context),
                  inputForm("", controler, Validators.validateInput, type: TextInputType.name),
                  SizedBox(height: 15),
                  normalTextApp("Prenom", context),
                  inputForm("", controler, Validators.validateInput, type: TextInputType.name),
                  SizedBox(height: 15),
                  mainButtonApp(context, (){}, "Modifier")
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}