import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mossala_mobile/features/auth/presentation/pages/confirm_password_screen.dart';
import 'package:mossala_mobile/features/auth/presentation/pages/forgetpassword_screen.dart';
import 'package:mossala_mobile/features/auth/presentation/pages/login_screen.dart';
import 'package:mossala_mobile/features/auth/presentation/pages/otp_screen.dart';
import 'package:mossala_mobile/screen/onboarding_screen.dart';
import 'core/theme/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp, // Mode portrait uniquement
  ]).then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mosala',
      scrollBehavior: ScrollBehavior(),
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: ConfrimOtpScreen(),
    );
  }
}
