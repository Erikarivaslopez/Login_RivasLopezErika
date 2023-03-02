//import 'package:curso_firebase_maps/config/theme/colors.dart';
//import 'package:curso_firebase_maps/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:login_practica_rivaslopezerika/models/user_model.dart';

class HomeScreen extends StatelessWidget {
  final Usuario usuario;
  const HomeScreen({super.key, required this.usuario});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.delete),
      ),
      appBar: AppBar(
        title: const Text(
          'Perfil',
          style: TextStyle(color: Colors.white),
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
            const SizedBox(
              height: 48,
            ),
            CustomListtile(
                title: 'Nombre',
                subtitle: usuario.name,
                icon: Icons.account_circle_rounded),
            CustomListtile(
                title: 'Email', subtitle: usuario.email, icon: Icons.email)
          ],
        ),
      ),
    );
  }
}

class CustomListtile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  const CustomListtile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
        trailing: IconButton(
          icon: const Icon(Icons.edit),
          onPressed: () {
            showDialog(
                context: context,
                builder: (_) => AlertDialog(
                      title: const Text('Editar'),
                      content: const TextField(),
                      actions: [
                        TextButton(onPressed: () {}, child: const Text('ok')),
                        TextButton(
                            onPressed: () {}, child: const Text('cancelar')),
                      ],
                    ));
          },
        ),
        title: Text(title),
        subtitle: Text(subtitle),
        leading: Icon(icon));
  }
}
