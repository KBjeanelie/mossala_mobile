import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mossala_mobile/screen/home_screen.dart';
import 'package:mossala_mobile/screen/main/main_screen.dart';
import 'package:mossala_mobile/screen/main/menu_screen.dart';
import 'package:mossala_mobile/screen/on_boarding/screen_1.dart';
import 'core/theme/app_theme.dart';
import 'screen/main/worker_screen.dart';

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
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: Screen1(),
    );
  }
}
