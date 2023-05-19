import 'package:flutter/material.dart';
import '../helpers/database_connection.dart';

class WidgetLogin extends StatefulWidget {
  const WidgetLogin({super.key});

  @override
  State<WidgetLogin> createState() => _WidgetLogin();
}

class _WidgetLogin extends State<WidgetLogin> {
  final TextEditingController textControllerEmailR = TextEditingController();
  final TextEditingController textControllerPasswordR = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: const Icon(Icons.arrow_back),),
      body: Stack(
        children: <Widget>[
         
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: ListView(
                children: [
                  const Align( alignment: Alignment.topCenter,
              child: Image(
                  width: 200,
                  height: 100,
                  image: AssetImage('lib/assets/images/header.png'),
                  fit: BoxFit.contain),
            ),
                  const Padding(padding: EdgeInsets.all(10)),
                  const Center(
                    child: SizedBox( width: 300, height: 100,
                      child: Text('Crear una nueva cuenta', textAlign: TextAlign.center,
                          style:  TextStyle(fontSize: 30, fontWeight: FontWeight.bold,))),
                  ),
                  const Padding(padding: EdgeInsets.all(2)),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: TextFormField( 
                      decoration: const InputDecoration(
                        filled: true, fillColor: Color.fromARGB(255, 240, 235, 235),
                        enabledBorder:OutlineInputBorder(
                        borderSide: BorderSide(color: Color.fromARGB(255, 237, 236, 236)),
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                        hintText: "Email", hintStyle: TextStyle(color: Colors.grey),
                        prefixIcon: Icon(Icons.email, color: Colors.grey, size: 20,)),
                        controller: textControllerEmailR,
                        keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  const Padding(padding: EdgeInsets.all(6)),
                  
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: TextFormField(
                       decoration: const InputDecoration(hintText: "Password", hintStyle: TextStyle(color: Colors.grey),
                       filled: true, fillColor: Color.fromARGB(255, 237, 236, 236),
                        enabledBorder:OutlineInputBorder(
                        borderSide: BorderSide(color: Color.fromARGB(255, 237, 236, 236)),
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                      prefixIcon: Icon(Icons.lock, color: Colors.grey, size: 20,),
                      suffixIcon: Icon(Icons.remove_red_eye, color: Colors.grey,)),
                      controller: textControllerPasswordR,
                      obscureText: true,
                    ),
                  ),
                  Row( mainAxisAlignment: MainAxisAlignment.center,
                    children: [ 
                    
                      Checkbox(value: false, 
                      side: const BorderSide(color: Colors.green, width: 2, ),shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                      onChanged:(value) {
                      },),
                      const Text('Acuérdate de mi', style: TextStyle(fontWeight: FontWeight.bold),),
                  ],),
                  const Padding(padding: EdgeInsets.all(10)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox( width: 350, height: 50,
                        child: ElevatedButton( 
                            style: ElevatedButton.styleFrom( 
                              elevation: 5,  shadowColor: Colors.green,
                                backgroundColor:
                                    Colors.green),
                                    onPressed: () {
                                      login(textControllerEmailR.text.toString(), textControllerPasswordR.text.toString());
                                    },
                            child: const Text(
                              'Ingresar',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 17),
                            )),
                      ),
                    ],
                  ),
                  
                 Padding(
                   padding: const EdgeInsets.all(40),
                   child: Stack(children: <Widget> [const Divider(color: Color.fromARGB(255, 241, 241, 241),), Center(
                     child: Container( decoration: const BoxDecoration(color: Colors.white),
                      child: const Text("o continuar con")),
                   ),]),
                 ),
                  Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [ 
                      SizedBox( width: 60, height: 40,
                        child: ElevatedButton(onPressed: () {},
                        style: ButtonStyle(foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor:const MaterialStatePropertyAll(Colors.white), 
                           alignment: Alignment.center,
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              
                            )
                          )), child: const Icon(Icons.facebook, color: Colors.blueAccent,),),
                      ),
                    SizedBox( width: 60, height: 40,
                        child: ElevatedButton(onPressed: () {},
                        style: ButtonStyle(foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor:const MaterialStatePropertyAll(Colors.white), 
                           alignment: Alignment.center,
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),)
                          )), child: const Image( height: 20, width: 20,
                                      // height: 10, width: 10,
                                      image: AssetImage('lib/assets/images/google.png'),
                                      fit: BoxFit.contain),),
                    ),
                    SizedBox( width: 60, height: 40,
                        child: ElevatedButton(onPressed: () {},
                        style: ButtonStyle(foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor:const MaterialStatePropertyAll(Colors.white), 
                           alignment: Alignment.center,
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),)
                          )),child: const Icon(Icons.apple, color: Colors.black,),),
                    ),
                  ],),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [ 
                      const Text('¿No tienes una cuenta?', style: TextStyle(fontSize: 10)),
                      TextButton(onPressed: () {}, child: const Text('Registrate', style: TextStyle(fontSize: 10, color: Colors.green),))
                    ],),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
  

}
