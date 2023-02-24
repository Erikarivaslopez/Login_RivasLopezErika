import 'package:flutter/material.dart';
import 'package:login_practica_rivaslopezerika/screens/widget_login.dart';
import 'package:login_practica_rivaslopezerika/screens/widget_signup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      routes: {
        'home': (context) => const WidgetLogin(),
        'WidgetLogin': (context) => const WidgetLogin(),
        'WidgetSignUp': (context) => WidgetSignUp(),
      },
      debugShowCheckedModeBanner: false,
      initialRoute: 'WidgetLogin',
    );
  }
}
