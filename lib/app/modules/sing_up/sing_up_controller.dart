import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:school_management/app/routes/sing_in_routes.dart';

class SingUpController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController jobTitleController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  var forky = GlobalKey<FormState>();
  var passwordValidator = true.obs;
  File? pickedImage;
  String? images;
  cameraPickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      final tempImage = File(image!.path);
      pickedImage = tempImage;
    } catch (e) {
      Get.snackbar("Error", "$e");
    }
  }

  galleryPickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      final tempImage = File(image!.path);
      pickedImage = tempImage;
    } catch (e) {
      Get.snackbar("Error", "$e");
    }
    update();
  }
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
