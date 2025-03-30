import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mossala_mobile/core/theme/app_colors.dart';
import 'package:mossala_mobile/widgets/app_bar.dart';
import 'package:mossala_mobile/widgets/widgets.dart';


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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
            20,
            (index) => CardItemChats(onPressed: (){},),
          ),
        ),
      ),
    );
  }
}

class CardItemChats extends StatelessWidget {
  final VoidCallback onPressed;
  const CardItemChats({
    super.key, required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 2),
      elevation: 0.5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 25,
          backgroundImage: AssetImage("assets/user.jpg"),
        ),
        title: mediumTextApp("Elijah Walter", context),
        subtitle: normalTextApp("Bonjour, en quoi je peux vous...", context),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          spacing: 5,
          children: [
            Text("12:30", style: GoogleFonts.poppins(color: AppColors.secondary, fontSize: 12)),
            CircleAvatar(
              radius: 12,
              backgroundColor: AppColors.secondary,
              child: Text("1", style: GoogleFonts.poppins(color: AppColors.darkText, fontSize: 12),),
            )
          ],
        ),
        onTap: onPressed,
      ),
    );
  }
}