import 'package:flutter/material.dart';
import 'package:mossala_mobile/widgets/widgets.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: headingTextApp("Notification", context),
      ),
      body: ListView(
        children: [
          CardNotification(text: "Suivez-nous sur Instagram",),
          CardNotification(text: "Suivez-nous sur Facebook",)
        ]
      ),
    );
  }
}

class CardNotification extends StatelessWidget {
  final String text;
  const CardNotification({
    super.key, required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(top: 1),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      child: ListTile(
        onTap: (){},
        title: smallTextApp("Il y a 6 jours", context),
        subtitle: normalTextApp("Suivez-nous sur instgram", context),
      ),
    );
  }
}