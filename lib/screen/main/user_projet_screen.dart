import 'package:flutter/material.dart';

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
      appBar: AppBar(
        backgroundColor: AppColors.textDark,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
        ),
        title: headingTextApp("Projet"),
      ),
      body: Center(child: normalTextApp("Projet")),
    );
  }
}