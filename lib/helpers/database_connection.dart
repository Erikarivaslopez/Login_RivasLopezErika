  import 'package:dio/dio.dart';

void login(String email, password) async {
    print(email);
    print(password);
    try {
      
          
        Response response = await Dio().post("https://xfju58b4kk.execute-api.eu-west-2.amazonaws.com/dev/user/login",
        data: {
          "email": email,
          "password": password
        } );
      
        
        if (response.statusCode == 200 ) {
          // var data = jsonDecode(response.body.toString());
          // print(data);
          print('Success');
          
        }
        else {
          print('Failed');
        }
    } catch (e) {
      print(e.toString());
    }

  }