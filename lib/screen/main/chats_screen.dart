import 'package:flutter/material.dart';
import 'package:mossala_mobile/widgets/app_bar.dart';
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
      appBar: appBarSimple("Discussions", context),
      body: Center(child: normalTextApp(
        "Aucun message trouvé\nCréer une offre pour commencer à recevoir de message", context,
        align: TextAlign.center)),
    );
  }
}