import 'package:flutter/material.dart';
import 'package:mossala_mobile/widgets/widgets.dart';

import '../../../widgets/cards.dart';

class ProjetCreerScreen extends StatelessWidget {
  const ProjetCreerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: headingTextApp("Mes projets créés", context),
      ),
      body: ListView(
        children: List.generate(
          5,
          (index) => CardOfferView(),
        ),
      ),
    );
  }
}