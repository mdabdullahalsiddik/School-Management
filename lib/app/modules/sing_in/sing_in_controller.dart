import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:school_management/app/routes/home_routes.dart';
import 'package:school_management/app/routes/sing_up_routes.dart';

class SingInController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var forky = GlobalKey<FormState>();
  var passwordValidator = true.obs;
  singIn() async {
    if (forky.currentState!.validate()) {
      if (emailController.text.isNotEmpty ||
          passwordController.text.isNotEmpty) {
        try {
          await EasyLoading.show(status: 'loading...');


          await FirebaseAuth.instance
              .signInWithEmailAndPassword(
            email: emailController.text,
            password: passwordController.text,
          )
              .then((value) {
            Get.offAllNamed(HomeRoutes.home);
            EasyLoading.showSuccess('Success');
            EasyLoading.dismiss();
          });
        } catch (e) {
          Get.snackbar("Error", "$e");
          EasyLoading.showError('Error');
          EasyLoading.dismiss();
        }
      } else {
        Get.snackbar("Error", "Please fill all fields");
      }
    } else {
      Get.snackbar("Error", "Please fill all fields");
    }
  }

  setPasswordValidator() {
    passwordValidator.value = !passwordValidator.value;
  }

  singUp() {
    Get.toNamed(SingUpRoutes.singUp);
  }
}
