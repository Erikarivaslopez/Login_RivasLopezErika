import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:signupin_test/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_practica_rivaslopezerika/models/user_model.dart';
import 'package:login_practica_rivaslopezerika/screens/home_screen.dart';

//import '../presentation/screens/home_screen.dart';

class SignUpController extends GetxController {
  String email = '';
  String password = '';
  String name = '';

  handleEmail(String newEmail) {
    email = newEmail;
    update();
  }

  handlePassword(String newPassword) {
    password = newPassword;
    update();
  }

  handleName(String newName) {
    name = newName;
    update();
  }

  handleSignUp() async {
    if (email == '' || password == '' || name == '') {
      return;
    }
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (credential.user != null) {
        final user = saveUserInDB(credential.user!.uid);
        Get.offAll(() => HomeScreen(
              usuario: user,
            ));
      }
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Error', e.code,
          backgroundColor: Colors.blue[100],
          duration: const Duration(seconds: 5));
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  Usuario saveUserInDB(
    String id,
  ) {
    final user = Usuario(name: name, email: email);
    final db = FirebaseFirestore.instance;
    db
        .collection("Usuarios")
        .doc(id)
        .set(user.toFirestore())
        .onError((e, _) => print("Error writing document: $e"));

    return user;
  }
}
