import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:school_management/app/routes/teacher_list_routes.dart';

class TeacherProfileController extends GetxController {
  TextEditingController performanceCompletedController =
      TextEditingController();
  TextEditingController attCompletedController = TextEditingController();

  performanceUpdate() async {
    await EasyLoading.show(status: 'loading...');

    await FirebaseFirestore.instance
        .collection("teacher")
        .doc(Get.arguments)
        .update({
      "performance": {
        "completed": int.parse(performanceCompletedController.text),
        "incomplete": int.parse(
            (100 - int.parse(performanceCompletedController.text)).toString()),
      },
    }).then((value) {
      Get.toNamed(TeacherListRoutes.teacherList);
      EasyLoading.showSuccess("Updated Successfully");
      Get.snackbar("Success", "Updated Successfully");
    }).onError((error, stackTrace) {
      EasyLoading.showError(error.toString());
      Get.snackbar("Error", error.toString());
    });
  }
}
