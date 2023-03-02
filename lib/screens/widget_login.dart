import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_practica_rivaslopezerika/controllers/sign_in_controller.dart';
import 'package:login_practica_rivaslopezerika/screens/custom_textformfield.dart';
import 'package:login_practica_rivaslopezerika/screens/widget_signup.dart';

class WidgetLogin extends StatelessWidget {
  final controller = Get.put(SignInController());
  WidgetLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        width: double.infinity,
        child: Stack(
          children: <Widget>[
            const Image(
                width: 410,
                height: 180,
                image: AssetImage('lib/assets/images/bonito.jpg'),
                fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: ListView(
                  children: [
                    const Padding(padding: EdgeInsets.all(80)),
                    Text('Welcome again!',
                        style: GoogleFonts.lobster(
                          textStyle: const TextStyle(fontSize: 30),
                        )),
                    const Padding(padding: EdgeInsets.all(2)),
                    Text(
                      'Sign in to continue',
                      style: GoogleFonts.lato(
                          textStyle: const TextStyle(
                              fontSize: 15,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold)),
                    ),
                    const Padding(padding: EdgeInsets.all(20)),
                    const Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Text(
                        'EMAIL',
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: CustomTextFormField(
                        hintText: '',
                        keyboardType: TextInputType.emailAddress,
                        onChanged: controller.handleEmail,
                        //controller: textControllerEmailR,

                        decoration: const InputDecoration(
                            suffixIcon: Icon(
                          Icons.remove_red_eye_outlined,
                          color: Colors.grey,
                        )),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(6)),
                    const Padding(
                      padding: EdgeInsets.all(2.0),
                      child: Text(
                        'PASSWORD',
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: CustomTextFormField(
                        keyboardType: TextInputType.text,
                        onChanged: controller.handlePassword,
                        hintText: '',
                        //controller: textControllerPasswordR,
                        obscureText: true,
                        decoration: const InputDecoration(
                            suffixIcon: Icon(
                          Icons.remove_red_eye_outlined,
                          color: Colors.grey,
                        )),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(20)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(93, 224, 153, 234)),
                            onPressed: () {
                              controller.handleSignIn();
                              /*showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: const Text('Error:(as'),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: const [
                                          Text(
                                              'Please, fill the required data'),
                                        ],
                                      ),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text('Exit'))
                                      ],
                                    );
                                  });*/
                            },
                            child: const Text(
                              'Log In',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 17),
                            )),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(0),
                      child: TextButton(
                          onPressed: (() {
                            Navigator.pop(context);
                          }),
                          child: const Text(
                            'Forgot password?',
                            style: TextStyle(color: Colors.grey),
                          )),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 244, 244, 244)),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const WidgetSignUp()));
                            },
                            child: const Text(
                              'Sign Up',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
