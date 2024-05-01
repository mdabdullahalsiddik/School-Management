import 'package:get/get.dart';
import 'package:school_management/app/routes/teacher_add_routes.dart';
import 'package:school_management/app/routes/teacher_profile_routes.dart';

class TeacherListController extends GetxController {
  
  teacherAdd() {
    Get.toNamed(TeacherAddRoutes.teacherAdd);
  }

  teacherProfile(int id) {
    Get.toNamed(TeacherProfileRoutes.teacherProfile, arguments: id);
  }
}
