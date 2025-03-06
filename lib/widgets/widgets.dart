import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mossala_mobile/core/theme/app_colors.dart';

Text normalTextApp(
    String text, {
      size = 15.0, 
      color = AppColors.textLight, 
      font = FontWeight.normal,
      align = TextAlign.left,
      underline = TextDecoration.none
  }) {
  return Text(text, 
    textAlign: align,
    style: GoogleFonts.poppins(
      fontSize: size,
      color: color,
      fontWeight: font,
      decoration: underline
    ),
  );
}

Text mediumTextApp(String text, {size = 18.0, color = AppColors.textLight, font = FontWeight.normal}) {
  return Text(text, 
    style: GoogleFonts.poppins(
      fontSize: size,
      color: color,
      fontWeight: font
    ),
  );
}

Text headingTextApp(String text, {size = 24.0, color = AppColors.textLight, font = FontWeight.bold}) {
  return Text(text, 
    style: GoogleFonts.poppins(
      fontSize: size,
      color: color,
      fontWeight: font
    ),
  );
}


TextFormField inputForm(
  String textLabel,
  TextEditingController controler, 
  String? Function(String?)? onValid,
  {bool obscureText = false, String symb = '*', TextInputType type = TextInputType.text}
  ){
  return TextFormField(
    controller: controler,
    obscureText: obscureText,
    keyboardType: type,
    cursorColor: AppColors.textDark,
    cursorWidth: 1,
    validator: onValid,
    style: GoogleFonts.poppins(
      color: AppColors.textDark,
      fontSize: 14,
    ),
    decoration: InputDecoration(
      label: normalTextApp(textLabel, color: AppColors.textDark),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.textDark, width: 2)
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.backgroundLight, width: 2)
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: const Color.fromARGB(255, 192, 27, 27), width: 2)
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: const Color.fromARGB(255, 192, 27, 27), width: 2)
      )
    ),
  );
}



ElevatedButton buttonApp(BuildContext context, VoidCallback onPress, String text, {size = 1}) {
  return ElevatedButton(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.all(AppColors.textDark),
      elevation: WidgetStateProperty.all(3),
      minimumSize: WidgetStateProperty.all(
        Size(
          MediaQuery.of(context).size.width * size,
          45
        )
      ),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    ),
    onPressed: onPress,
    child: mediumTextApp(text, font: FontWeight.bold),
  );
}

ElevatedButton mainButtonApp(BuildContext context, VoidCallback onPress, String text, {size = 1}) {
  return ElevatedButton(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.all(AppColors.backgroundLight),
      elevation: WidgetStateProperty.all(3),
      minimumSize: WidgetStateProperty.all(
        Size(
          MediaQuery.of(context).size.width * size,
          45
        )
      ),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    ),
    onPressed: onPress,
    child: mediumTextApp(text, font: FontWeight.bold, color: AppColors.textDark),
  );
}