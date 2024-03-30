import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:school_management/app/routes/sing_in_routes.dart';
import 'package:school_management/app/routes/sing_up_routes.dart';

class SingUpController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var forky = GlobalKey<FormState>();
  var passwordValidator = true.obs;
  singUp() {
    if (forky.currentState!.validate()) {
      if (emailController.text.isNotEmpty ||
          passwordController.text.isNotEmpty) {
        print("login");
      }
    }
  }

  setPasswordValidator() {
    passwordValidator.value = !passwordValidator.value;
  }

  singIn() {
    Get.toNamed(SingInRoutes.singIn);
  }
}
