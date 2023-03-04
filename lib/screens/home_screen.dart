//import 'package:curso_firebase_maps/config/theme/colors.dart';
//import 'package:curso_firebase_maps/models/usuario.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:login_practica_rivaslopezerika/models/user_model.dart';
import 'package:login_practica_rivaslopezerika/controllers/edit_user_controller.dart';

class HomeScreen extends StatelessWidget {
  final controller = Get.put(UpdateController());
  final Usuario usuario;
  HomeScreen({super.key, required this.usuario});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (_) => AlertDialog(
                    title: const Text('Are you sure?'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormField(
                          keyboardType: TextInputType.text,
                          onChanged: controller.handlePassword,
                          decoration: const InputDecoration(
                              hintText: 'To continue, type your password',
                              hintStyle:
                                  TextStyle(color: Colors.grey, fontSize: 14)),
                        ),
                        const Text(
                          'Once you agree, your account will be deleted permanently',
                          style: TextStyle(color: Colors.red),
                        )
                      ],
                    ),
                    actions: [
                      TextButton(
                          onPressed: () {
                            //controller.handleNameUpdate(usr);
                            controller.handleDelete(usuario);
                          },
                          child: const Text('I agree')),
                      TextButton(
                          onPressed: () {
                            controller.handleCancel();
                          },
                          child: const Text('Cancel')),
                    ],
                  ));
        },
        child: const Icon(
          Icons.delete,
          color: Color.fromARGB(255, 103, 102, 102),
        ),
      ),
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 75,
              //backgroundColor: ColorsApp.primaryColor,
              child: CircleAvatar(
                radius: 73,
                backgroundImage: NetworkImage(
                    'https://firebasestorage.googleapis.com/v0/b/brial-wellness.appspot.com/o/imagenesAuxiliares%2FnuevoPerfil.png?alt=media&token=42fc4205-c677-483c-a486-7d392acaaca4'),
              ),
            ),
            SizedBox(
              height: 48,
              child: Text('Hi ${usuario.name}.'),
            ),
            CustomListtile(
                title: 'Name',
                subtitle: usuario.name,
                usr: usuario,
                icon: Icons.account_circle_rounded),
            CustomDos(
                title: 'Email',
                subtitle: usuario.email,
                usr: usuario,
                icon: Icons.email)
          ],
        ),
      ),
    );
  }
}

class CustomListtile extends StatelessWidget {
  final controller = Get.put(UpdateController());
  final Usuario usr;
  final String title;
  final String subtitle;
  final IconData icon;
  CustomListtile(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.icon,
      required this.usr});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        trailing: IconButton(
          icon: const Icon(Icons.edit),
          onPressed: () {
            showDialog(
                context: context,
                builder: (_) => AlertDialog(
                      title: const Text('Edit name'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextFormField(
                            keyboardType: TextInputType.text,
                            onChanged: controller.handleName,
                            decoration: const InputDecoration(
                                hintText: 'New name',
                                suffixIcon: Icon(
                                  Icons.edit,
                                  color: Colors.grey,
                                )),
                          ),
                          TextFormField(
                            keyboardType: TextInputType.text,
                            onChanged: controller.handlePassword,
                            decoration: const InputDecoration(
                                hintText: 'Enter password to continue',
                                suffixIcon: Icon(
                                  Icons.edit,
                                  color: Colors.grey,
                                )),
                          ),
                        ],
                      ),
                      actions: [
                        TextButton(
                            onPressed: () {
                              controller.handleNameUpdate(usr);
                            },
                            child: const Text('OK')),
                        TextButton(
                            onPressed: () {
                              controller.handleCancel();
                            },
                            child: const Text('Cancel')),
                      ],
                    ));
          },
        ),
        title: Text(title),
        subtitle: Text(subtitle),
        leading: Icon(icon));
  }
}

class CustomDos extends StatelessWidget {
  final controller = Get.put(UpdateController());
  final Usuario usr;
  final String title;
  final String subtitle;
  final IconData icon;
  CustomDos(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.icon,
      required this.usr});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        trailing: IconButton(
          icon: const Icon(Icons.edit),
          onPressed: () {
            showDialog(
                context: context,
                builder: (_) => AlertDialog(
                      title: const Text('Edit email'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextFormField(
                            keyboardType: TextInputType.text,
                            onChanged: controller.handleEmail,
                            decoration: const InputDecoration(
                                hintText: 'New email',
                                suffixIcon: Icon(
                                  Icons.edit,
                                  color: Colors.grey,
                                )),
                          ),
                          TextFormField(
                            keyboardType: TextInputType.text,
                            onChanged: controller.handlePassword,
                            decoration: const InputDecoration(
                                hintText: 'Enter password to continue',
                                suffixIcon: Icon(
                                  Icons.edit,
                                  color: Colors.grey,
                                )),
                          ),
                        ],
                      ),
                      actions: [
                        TextButton(
                            onPressed: () {
                              controller.handleEmailUpdate(usr);
                            },
                            child: const Text('OK')),
                        TextButton(
                            onPressed: () {
                              controller.handleCancel();
                            },
                            child: const Text('Cancel')),
                      ],
                    ));
          },
        ),
        title: Text(title),
        subtitle: Text(subtitle),
        leading: Icon(icon));
  }
}
