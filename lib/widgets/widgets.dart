import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mossala_mobile/core/theme/app_colors.dart';
import 'package:mossala_mobile/core/theme/app_sizes.dart';

Text normalTextApp(String text, BuildContext context, {align = TextAlign.left}) {
  return Text(text, 
    textAlign: align,
    style: Theme.of(context).textTheme.bodyLarge,
  );
}

Text mediumTextApp(String text, BuildContext context, {align = TextAlign.left}) {
  return Text(text, 
    textAlign: align,
    style: Theme.of(context).textTheme.titleMedium,
  );
}

Text headingTextApp(String text, BuildContext context, {align = TextAlign.left}) {
  return Text(text, 
    textAlign: align,
    style: Theme.of(context).textTheme.titleLarge,
  );
}

Text secondaryTextApp(String text, BuildContext context, {align = TextAlign.left}) {
  return Text(text, 
    textAlign: align,
    style: Theme.of(context).textTheme.bodyMedium,
  );
}

Text smallTextApp(String text, BuildContext context, {align = TextAlign.left}) {
  return Text(text, 
    textAlign: align,
    style: Theme.of(context).textTheme.bodySmall,
  );
}
Text tinyTextApp(String text, BuildContext context, {align = TextAlign.left}) {
  return Text(text, 
    textAlign: align,
    style: Theme.of(context).textTheme.labelSmall,
  );
}


TextFormField inputForm(
  String textLabel,
  TextEditingController controler, 
  String? Function(String?)? onValid,
  {
    bool obscureText = false, 
    String symb = '*', 
    TextInputType type = TextInputType.text,
  }
  ){
  return TextFormField(
    controller: controler,
    obscureText: obscureText,
    keyboardType: type,
    cursorWidth: 1,
    validator: onValid,
    decoration: InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.secondary, width: 2)
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.secondary, width: 2)
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
      backgroundColor: WidgetStateProperty.all(AppColors.secondary),
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
    child: Text(text, style: TextStyle(color: AppColors.darkText),),
  );
}

ElevatedButton mainButtonApp(BuildContext context, VoidCallback onPress, String text, {size = 1}) {
  return ElevatedButton(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.all(AppColors.secondary),
      elevation: WidgetStateProperty.all(3),
      minimumSize: WidgetStateProperty.all(
        Size(
          MediaQuery.of(context).size.width * size,
          45
        )
      ),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.borderRadius),
        ),
      ),
    ),
    onPressed: onPress,
    child: Text(
      text, 
      style: GoogleFonts.poppins(
        color: AppColors.darkText,
        fontSize: 18,
        fontWeight: FontWeight.w600
      ),
      textAlign: TextAlign.center,
    ),
  );
}

OutlinedButton mainOutlinedButtonApp(BuildContext context, VoidCallback onPress, String text, {size = 1}) {
  return OutlinedButton(
    style: ButtonStyle(
      side: WidgetStateProperty.all(
        BorderSide(color: AppColors.secondary, width: 3)
      ),
      backgroundColor: WidgetStateProperty.all(const Color.fromARGB(0, 29, 114, 184)),
      elevation: WidgetStateProperty.all(3),
      minimumSize: WidgetStateProperty.all(
        Size(
          MediaQuery.of(context).size.width * size,
          45
        )
      ),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.borderRadius),
        ),
      ),
    ),
    onPressed: onPress,
    child: Text(text,textAlign: TextAlign.center, style: GoogleFonts.poppins(
      color: AppColors.secondary,
      fontSize: 18,
      fontWeight: FontWeight.w600
    ),),
  );
}