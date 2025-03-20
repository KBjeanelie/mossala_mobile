import 'package:flutter/material.dart';
import 'package:mossala_mobile/core/theme/app_sizes.dart';
import 'package:mossala_mobile/widgets/widgets.dart';

class AboutAppScreen extends StatelessWidget {
  const AboutAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: headingTextApp("À propos", context),
      ),
      body: Column(
        children: [
          SizedBox(height: 120),
          Center(child: Image.asset("assets/logo.png")),
          Padding(
            padding: AppSizes.spaceHV,
            child: normalTextApp("Application mobile pour la mise en relation des travailleur indépendant avec les particulier.\n\nVersion 1.0.0", context, align: TextAlign.center),
          )
        ],
      ),
    );
  }
}