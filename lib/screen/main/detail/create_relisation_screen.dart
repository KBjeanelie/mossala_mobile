import 'package:flutter/material.dart';
import 'package:mossala_mobile/core/theme/app_sizes.dart';
import 'package:mossala_mobile/widgets/widgets.dart';

import '../../../core/utils/validators.dart';

class CreateRelisationScreen extends StatefulWidget {
  const CreateRelisationScreen({super.key});

  @override
  State<CreateRelisationScreen> createState() => _CreateRelisationScreenState();
}

class _CreateRelisationScreenState extends State<CreateRelisationScreen> {
  final TextEditingController controler = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: headingTextApp("Ajouter une réalisation", context),
      ),
      body: SingleChildScrollView(
        child: Card(
          margin: EdgeInsets.only(left: 5, right: 5, top: 20),
          child: Padding(
            padding: AppSizes.spaceHV,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                normalTextApp("Titre", context),
                inputForm("", controler, Validators.validateInput, type: TextInputType.name),
                SizedBox(height: 15),
                normalTextApp("Date de réalisation", context),
                inputForm("", controler, Validators.validateInput, type: TextInputType.datetime),
                SizedBox(height: 15),
                normalTextApp("Description", context),
                inputForm("", controler, Validators.validateInput, type: TextInputType.text, length: 255, lines: 4),
                SizedBox(height: 15),
                mainButtonApp(context, (){}, "Modifier")
              ],
            ),
          ),
        ),
      ),
    );
  }
}