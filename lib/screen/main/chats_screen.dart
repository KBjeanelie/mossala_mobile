import 'package:flutter/material.dart';
import 'package:mossala_mobile/widgets/app_bar.dart';

import '../../core/theme/app_colors.dart';
import '../../widgets/widgets.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarSimple("Discussions"),
      body: Center(child: normalTextApp("discussion")),
    );
  }
}