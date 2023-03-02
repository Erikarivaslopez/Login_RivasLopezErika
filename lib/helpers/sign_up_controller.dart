import 'package:get/get.dart';

class SignUpController extends GetxController {
  String email = "";
  String password = "";

  handleEmail(String newEmail) {
    email = newEmail;
    update();
  }

  handlePassword(String newPassword) {
    email = newPassword;
    update();
  }

  handleSignUp(String newSignUp) {
    email = newSignUp;
    update();
  }
}
