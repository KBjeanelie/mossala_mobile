import 'package:flutter/material.dart';

import '../core/theme/app_colors.dart';
import 'widgets.dart';

AppBar appBarWidget(String title, {showAction = true}){
  return AppBar(
    backgroundColor: AppColors.textDark,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
    ),
    title: headingTextApp(title, color: AppColors.backgroundLight),
    actions: [
      Container(
        margin: EdgeInsets.only(right: 15),
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: AppColors.backgroundLight,
          borderRadius: BorderRadius.circular(30)
        ),
        child: Center(
          child: Icon(Icons.add, size: 30, color: AppColors.textDark,),
        ),
      )
    ],
  );
}

AppBar appBarSimple(String title, {showAction = true}){
  return AppBar(
    backgroundColor: AppColors.textDark,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
    ),
    title: headingTextApp(title, color: AppColors.backgroundLight),
  );
}