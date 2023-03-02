//import 'package:curso_firebase_maps/config/theme/colors.dart';
//import 'package:curso_firebase_maps/presentation/screens/sign_in_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_practica_rivaslopezerika/screens/widget_login.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'uwu',
      theme: ThemeData(
          useMaterial3: true,
          //colorSchemeSeed: ColorsApp.primaryColor,
          appBarTheme: const AppBarTheme(
            centerTitle: true,
            iconTheme: IconThemeData(color: Colors.white),
            //backgroundColor: ColorsApp.primaryColor
          )),
      home: WidgetLogin(),
    );
  }
}
