import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:school_management/app/routes/teacher_profile_routes.dart';

class PieChartUpdateController extends GetxController {
  TextEditingController performanceCompletedController =
      TextEditingController();
  TextEditingController attCompletedController = TextEditingController();

  performanceUpdate() async {
    await EasyLoading.show(status: 'loading...');

    await FirebaseFirestore.instance
        .collection("teacher")
        .doc(Get.parameters['id'])
        .update({
      "performance": {
        "completed": int.parse(performanceCompletedController.text),
        "incomplete": int.parse(
            (100 - int.parse(performanceCompletedController.text)).toString()),
      },
    }).then((value) {
      performanceCompletedController.clear();

      Get.toNamed(TeacherProfileRoutes.teacherProfile,
          arguments: Get.arguments);
      EasyLoading.showSuccess("Updated Successfully");
      Get.snackbar("Success", "Updated Successfully");
      EasyLoading.dismiss();
    }).onError((error, stackTrace) {
      EasyLoading.showError(error.toString());
      Get.snackbar("Error", error.toString());
      EasyLoading.dismiss();
    });
    EasyLoading.dismiss();
  }
}
