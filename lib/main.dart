import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login_practica_rivaslopezerika/screens/widget_login.dart';
import 'package:login_practica_rivaslopezerika/screens/widget_signup.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      routes: {
        'home': (context) => WidgetLogin(),
        'WidgetLogin': (context) => WidgetLogin(),
        'WidgetSignUp': (context) => const WidgetSignUp(),
        // 'HomeScreen': (context) => const HomeScreen(),
      },
      debugShowCheckedModeBanner: false,
      initialRoute: 'WidgetLogin',
    );
  }
}
