import 'package:flutter/material.dart';
import 'package:mossala_mobile/widgets/cards.dart';
import 'package:mossala_mobile/widgets/widgets.dart';

class ProjetRemporteScreen extends StatelessWidget {
  const ProjetRemporteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: headingTextApp("Mes projets remporté", context),
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