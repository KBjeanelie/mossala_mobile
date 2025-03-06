import 'package:flutter/material.dart';
import 'package:mossala_mobile/widgets/app_bar.dart';

import '../../core/theme/app_colors.dart';
import '../../widgets/widgets.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarSimple("Menu"),
      body: Center(child: normalTextApp("menu")),
    );
  }
}