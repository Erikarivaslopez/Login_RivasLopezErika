import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:signupin_test/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_practica_rivaslopezerika/models/user_model.dart';
import 'package:login_practica_rivaslopezerika/screens/home_screen.dart';

//import '../presentation/screens/home_screen.dart';

class UpdateController extends GetxController {
  String email = '';
  String name = '';
  String password = '';

  handlePassword(String newPassword) {
    password = newPassword;
    update();
  }

  handleEmail(String newEmail) {
    email = newEmail;
    update();
  }

  handleName(String newName) {
    name = newName;
    update();
  }

  handleEmailUpdate(Usuario usr) async {
    print('hola');
    print(password);
    print(email);
    if (email == '') {
      return;
    }
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: usr.email.toLowerCase(), password: password);

      if (credential.user != null) {
        Usuario? usuario = await getUser(credential.user!.uid);
        if (usuario != null) {
          print(
              "we are changing old email: ${usr.email} for new email: ${email}");
          updateEmail(credential.user!.uid, usr);
        }
      }
      // Get.to(() => const HomeScreen());
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

  handleNameUpdate(Usuario usr) async {
    if (name == '') {
      return;
    }
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: usr.email.toLowerCase(), password: password);

      if (credential.user != null) {
        Usuario? usuario = await getUser(credential.user!.uid);
        if (usuario != null) {
          print("we are changing old name=${usr.name} for new name= ${name}");
          updateName(credential.user!.uid, usr);
        }
      }
      // Get.to(() => const HomeScreen());
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

  handleCancel() {
    print("not updating");
  }

  Future<Usuario?> getUser(String id) async {
    Usuario usuario;
    final db = FirebaseFirestore.instance;
    final docRef = db.collection("Usuario").doc(id);
    usuario = await docRef.get().then(
      (DocumentSnapshot<Map<String, dynamic>> doc) {
        return Usuario.fromFirestore(doc);
        // ...
      },
      onError: (e) => print("Error getting document: $e"),
    );
    return usuario;
  }

  Future<bool> updateName(String id, Usuario usr) async {
    Map<String, String> data = {
      "email": usr.email,
      "name": name,
    };
    final db = FirebaseFirestore.instance;
    final docRef = db.collection("Usuario").doc(id);
    docRef.update(data);

    return true;
  }

  Future<bool> updateEmail(String id, Usuario usr) async {
    Map<String, String> data = {
      "email": email,
      "name": usr.name,
    };
    final db = FirebaseFirestore.instance;
    final docRef = db.collection("Usuario").doc(id);
    docRef.update(data);

    return true;
  }
}
