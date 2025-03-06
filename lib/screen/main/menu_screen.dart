import 'package:flutter/material.dart';
import 'package:mossala_mobile/widgets/app_bar.dart';


class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarSimple("Menu"),
    );
  }
}