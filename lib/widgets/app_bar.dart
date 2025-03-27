import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:mossala_mobile/features/chats/presentation/pages/chats_screen.dart';
import 'package:mossala_mobile/features/offers/presentation/pages/create_service_screen.dart';
import 'package:mossala_mobile/features/profil/presentation/pages/menu/notifications_screen.dart';
import '../core/theme/app_colors.dart';
import 'widgets.dart';

AppBar appBarWidget(String title, BuildContext context, {showAction = true}){
  return AppBar(
    title: headingTextApp(title, context),
    actions: customeAction(context),
  );
}

AppBar appBarSimple(String title,BuildContext context, {showAction = true}){
  return AppBar(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
    ),
    title: headingTextApp(title, context),
  );
}

List<Widget> customeAction(BuildContext context) {
  return [
    IconButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => CreateProjectScreen()));
      },
      icon: CircleAvatar(
        radius: 15,
        child: Icon(EvaIcons.plus, color: AppColors.secondary),
      ),
    ),
    InkWell(
      onTap: () {
        Navigator.push(
          context, 
          MaterialPageRoute(builder: (context) => NotificationsScreen())
        );
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Icon(EvaIcons.bellOutline, color: AppColors.secondary, size: 25),
          Positioned(
            right: 0,
            top: -8,
            child: Container(
              padding: EdgeInsets.all(0),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(50),
              ),
              constraints: BoxConstraints(
                minWidth: 18,
                minHeight: 18,
              ),
              child: Text(
                '1',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    ),

    // InkWell(
    //   onTap: () {
    //     Navigator.push(context, MaterialPageRoute(builder: (context) => ChatsScreen()));
    //   },
    //   child: Icon(EvaIcons.paperPlane, color: AppColors.secondary, size: 25,),
    // ),
    SizedBox(width: 10,)
  ];
}