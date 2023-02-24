import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WidgetSignUp extends StatefulWidget {
  const WidgetSignUp({super.key});

  @override
  State<WidgetSignUp> createState() => _WidgetSignUp();
}

class _WidgetSignUp extends State<WidgetSignUp> {
  final TextEditingController textControllerName = TextEditingController();
  final TextEditingController textControllerLastName = TextEditingController();
  final TextEditingController textControllerEmail = TextEditingController();
  final TextEditingController textControllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* appBar: AppBar(
        centerTitle: true,
        title: const Text('Fantasma tristesito club'),
        backgroundColor: const Color.fromARGB(255, 173, 123, 233),
      ),*/
      body: SizedBox(
        width: double.infinity,
        child: Stack(
          children: <Widget>[
            SizedBox(
              //padding: const EdgeInsets.all(10.0),
              child: ListView(
                children: [
                  const Image(
                      width: 410,
                      height: 180,
                      image: AssetImage('lib/assets/images/bonito.jpg'),
                      fit: BoxFit.cover),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text('Create an account',
                        style: GoogleFonts.lato(
                          textStyle: const TextStyle(
                              fontSize: 27, fontWeight: FontWeight.bold),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Your adventure starts here',
                      style: GoogleFonts.lato(
                          textStyle: const TextStyle(
                              fontSize: 15,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.all(18)),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'NAME(S)',
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please, enter your name';
                            }
                            return null;
                          },
                          controller: textControllerName,
                          textCapitalization: TextCapitalization.words,
                          keyboardType: TextInputType.name,
                        ),
                      )),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'LAST NAME',
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please, enter your last name';
                            }
                            return null;
                          },
                          controller: textControllerLastName,
                          textCapitalization: TextCapitalization.words,
                          keyboardType: TextInputType.name,
                        ),
                      )),
                  const Padding(padding: EdgeInsets.all(10)),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'EMAIL',
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please, enter a valid email';
                          }
                          return null;
                        },
                        controller: textControllerEmail,
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.all(6)),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'PASSWORD',
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please add a valid email";
                          }
                          return null;
                        },
                        controller: textControllerPassword,
                        obscureText: true,
                        decoration: const InputDecoration(
                            suffixIcon: Icon(
                          Icons.remove_red_eye_outlined,
                          color: Colors.grey,
                        )),
                      ),
                    ),
                  ),
                  // const Padding(padding: EdgeInsets.all(12)),
                  Padding(
                    padding: const EdgeInsets.all(50.0),
                    child: Column(
                      children: [
                        Column(
                          children: [
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color.fromARGB(
                                        93, 224, 153, 234)),
                                onPressed: () {
                                  if (textControllerName.text != "" &&
                                      textControllerLastName.text != "" &&
                                      textControllerEmail.text != "" &&
                                      textControllerPassword.text != "") {
                                    //-- este
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: const Text(
                                              'New user added succesfully',
                                              style: TextStyle(fontSize: 20),
                                            ),
                                            content: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text(
                                                    'Hello ${textControllerName.text} ${textControllerLastName.text}!'),
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
                                        });
                                    //myFunctionToDatabase(nombre,apellido);
                                  } else {
                                    //--- mensaje de error
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: const Text('Error:('),
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
                                        });
                                  }
                                },
                                child: const Text(
                                  'Sign Up',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                )),
                            Column(
                              children: [
                                Row(children: [
                                  TextButton(
                                      onPressed: () {},
                                      child: TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text(
                                          'Already have an account?',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 170, 170, 170),
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text(
                                      'LogIn',
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 78, 78, 78),
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ]),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
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
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text('Caution'),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: const [
                                      Text('Are you sure?'),
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
                              });
                        },
                        child: null,
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
