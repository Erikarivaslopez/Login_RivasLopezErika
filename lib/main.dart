import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login_practica_rivaslopezerika/screens/widget_login.dart';

// void main() {
//   WidgetsFlutterBinding.ensureInitialized;
//   Firebase.initializeApp();
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(useMaterial3: true),
//       // routes: {
//       //   'home': (context) => const WidgetLogin(),
        
        
//       // },
//       debugShowCheckedModeBanner: false,
//       initialRoute: 'WidgetLogin',
//     );
//   }
// }

void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          //  appBar: AppBar(
          //    title: Text('Change Text Dynamically on Button Click')
          //    ),
            body: WidgetLogin()
            )
          );
  }
}