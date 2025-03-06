import 'package:flutter/material.dart';
import 'package:mossala_mobile/widgets/widgets.dart';

import '../../core/theme/app_colors.dart';

class WorkerScreen extends StatefulWidget {
  const WorkerScreen({super.key});

  @override
  State<WorkerScreen> createState() => _WorkerScreenState();
}

class _WorkerScreenState extends State<WorkerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.textDark,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
        ),
        title: headingTextApp("Prestataires"),
      ),
      body: Center(child: normalTextApp("Accueil")),
    );
  }
}