import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hotel_booking/Controllers/firebase_auth_controller.dart';
import 'package:hotel_booking/Controllers/login_controller.dart';

class SignUpController extends GetxController {
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final TextEditingController retyrepassword = TextEditingController();
  final formkey = GlobalKey<FormState>();
  bool hidepass = true;
  AutovalidateMode validationmode = AutovalidateMode.disabled;

  Future<void> register() async {
    if (checkvalidation()) {
      await Get.find<FirebaseAuthController>().createuser(
          email: emailcontroller.text, password: passwordcontroller.text);
      Get.back();
      Get.delete<LoginController>();
    }
  }

  String? validatename(String name) {
    if (name.isEmpty) {
      return 'Enter your Name';
    }
  }

  String? validateEmail(String email) {
    if (!email.isEmail) {
      return 'Enter valid email';
    }
  }

  String? validatePassword(String password) {
    if (password.length < 6) {
      return 'Password must be of 6 characters';
    }
  }

  bool checkvalidation() {
    if (formkey.currentState!.validate()) {
      return true;
    } else {
      validationmode = AutovalidateMode.onUserInteraction;
      update();
      return false;
    }
  }

  @override
  void dispose() {
    namecontroller.dispose();
    emailcontroller.dispose();
    passwordcontroller.dispose();
    retyrepassword.dispose();
    super.dispose();
  }
}
