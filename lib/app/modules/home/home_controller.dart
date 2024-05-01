import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:school_management/app/routes/sing_in_routes.dart';
import 'package:school_management/app/routes/teacher_list_routes.dart';

class HomeController extends GetxController {
  RxList<dynamic> bannerItem = [].obs;

  singOut() {
    try {
      FirebaseAuth.instance.signOut().then((value) async {
        await EasyLoading.show(status: "Signing out");
        await Get.offAllNamed(SingInRoutes.singIn);
        Get.snackbar(
          "Success",
          "Sign out successfully",
        );
        EasyLoading.showSuccess("Sign out successfully");

        EasyLoading.dismiss();
      });
    } catch (e) {
      EasyLoading.showError(e.toString());
      EasyLoading.dismiss();
      Get.snackbar("Error", "$e.toString()");
    }
  }

  teacherList() {
    Get.toNamed(TeacherListRoutes.teacherList);
  }
}
