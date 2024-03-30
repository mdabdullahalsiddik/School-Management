import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:school_management/app/routes/sing_up_routes.dart';

class SingInController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var forky = GlobalKey<FormState>();
  var passwordValidator = true.obs;
  singIn() {
    if (forky.currentState!.validate()) {
      if (emailController.text.isNotEmpty ||
          passwordController.text.isNotEmpty) {
        print("login");
      }
    }
  }

  setPasswordValidator() {
    print(passwordValidator);
    passwordValidator.value = !passwordValidator.value;
    print(passwordValidator);
  }

  singUp() {
    print("singUp");

    Get.toNamed(SingUpRoutes.singUp);
    print("singUp");
  }
}
