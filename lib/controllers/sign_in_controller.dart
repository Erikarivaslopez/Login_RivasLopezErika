import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_practica_rivaslopezerika/models/user_model.dart';
import 'package:login_practica_rivaslopezerika/screens/home_screen.dart';

class SignInController extends GetxController {
  String email = '';
  String password = '';

  handleEmail(String newEmail) {
    email = newEmail;
    update();
  }

  handlePassword(String newPassword) {
    password = newPassword;
    update();
  }

  handleSignIn() async {
    if (email == '' || password == '') {
      return;
    }
    try {
      print("get to trycatch");
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.toLowerCase(), password: password);
      print("credential thing....");
      if (credential.user != null) {
        Usuario? usuario = await getUser(credential.user!.uid);
        if (usuario != null) {
          Get.offAll(() => HomeScreen(usuario: usuario));
          print('ola');
        } else {
          print('adio');
        }
      }
      // Get.to(() => const HomeScreen());
    } on FirebaseAuthException catch (e) {
      print('Algo salio mal');
      Get.dialog(AlertDialog(
        //backgroundColor: ColorsApp.primaryColor.withOpacity(0.75),
        title: const Text(
          'Error',
          style: TextStyle(color: Colors.white),
        ),
        content: Text(e.code, style: const TextStyle(color: Colors.white)),
      ));
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  Future<Usuario?> getUser(String id) async {
    Usuario usuario;
    final db = FirebaseFirestore.instance;
    final docRef = db.collection("Usuarios").doc(id);
    usuario = await docRef.get().then(
      (DocumentSnapshot<Map<String, dynamic>> doc) {
        return Usuario.fromFirestore(doc);
        // ...
      },
      onError: (e) => print("Error getting document: $e"),
    );
    return usuario;
  }
}
