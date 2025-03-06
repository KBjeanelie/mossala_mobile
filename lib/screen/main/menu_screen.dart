import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../widgets/widgets.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.textDark,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
        ),
        title: headingTextApp("Menu"),
      ),
      body: Center(child: normalTextApp("menu")),
    );
  }
}