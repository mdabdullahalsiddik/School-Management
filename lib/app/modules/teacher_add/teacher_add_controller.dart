import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:school_management/app/routes/teacher_list_routes.dart';

class TeacherAddController extends GetxController {
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
      Get.snackbar("Error", "$e.message");
    }
    update();
  }

  galleryPickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      final tempImage = File(image!.path);
      pickedImage = tempImage;
    } catch (e) {
      Get.snackbar("Error", "$e.message");
    }
    update();
  }

  Future sendImage() async {
    var dataKye = DateTime.now().microsecond;

    var imagePath = await FirebaseStorage.instance
        .ref("admin")
        .child(
          "${emailController.text}_${dataKye.toString()}",
        )
        .putFile(pickedImage!);

    images = await imagePath.ref.getDownloadURL();
    update();
  }

  add() async {
    if (forky.currentState!.validate()) {
      if (emailController.text.isNotEmpty ||
          passwordController.text.isNotEmpty) {
        try {
          await EasyLoading.show(status: 'loading...');


          await FirebaseAuth.instance
              .createUserWithEmailAndPassword(
            email: emailController.text,
            password: passwordController.text,
          )
              .then((value) async {
            try {
              await EasyLoading.showSuccess('loading...');

              await sendImage();
              await FirebaseFirestore.instance
                  .collection("teacher")
                  .doc(FirebaseAuth.instance.currentUser!.email.toString())
                  .set({
                "name": nameController.text,
                "jobTitle": jobTitleController.text,
                "phone": phoneController.text,
                "email": emailController.text,
                "password": passwordController.text,
                "image": images,
                "performance": {
                  "total": 100,
                  "completed": 90,
                  "incomplete": 10
                },
                "attendance": {"total": 100, "present": 100, "absent": 0},
                "uid": FirebaseAuth.instance.currentUser!.uid
              }).then((value) {
                Get.toNamed(TeacherListRoutes.teacherList);

                EasyLoading.dismiss();
                Get.snackbar("Success", "User created successfully");
              });
            } catch (e) {
              Get.snackbar("Error", "$e.message");
              EasyLoading.showError('Error');

              EasyLoading.dismiss();
            }
          });
        } catch (e) {
          Get.snackbar("Error", "$e.message");
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

  teacherList() {
    Get.toNamed(TeacherListRoutes.teacherList);
  }
}
