import 'package:flutter/material.dart';
import 'package:mossala_mobile/widgets/app_bar.dart';

import '../../core/theme/app_colors.dart';
import '../../widgets/widgets.dart';

class UserProjetScreen extends StatefulWidget {
  const UserProjetScreen({super.key});

  @override
  State<UserProjetScreen> createState() => _UserProjetScreenState();
}

class _UserProjetScreenState extends State<UserProjetScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget("Mes Projets"),
      body: Center(child: normalTextApp("Projet")),
    );
  }
}