import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:mossala_mobile/screen/main/create_service_screen.dart';
import 'package:mossala_mobile/screen/main/main_screen.dart';
import '../core/theme/app_colors.dart';
import 'widgets.dart';

AppBar appBarWidget(String title, BuildContext context, {showAction = true}){
  return AppBar(
    title: headingTextApp(title, context),
    actions: [
      CircleAvatar(
        radius: 15,
        child: Icon(Icons.add, color: AppColors.secondary),
      ),
      IconButton(
        onPressed: () {},
        icon: Icon(EvaIcons.paperPlane, color: AppColors.secondary)),
    ],
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
        Navigator.push(context, MaterialPageRoute(builder: (context) => CreateServiceScreen()));
      },
      icon: CircleAvatar(
        radius: 15,
        child: Icon(EvaIcons.plus, color: AppColors.secondary),
      ),
    ),
    IconButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => MainScreen()));
      },
      icon: Icon(EvaIcons.paperPlane, color: AppColors.secondary)),
  ];
}