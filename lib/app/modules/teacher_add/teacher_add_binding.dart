import 'package:get/get.dart';

import 'teacher_add_controller.dart';

class TeacherAddBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TeacherAddController>(
      () => TeacherAddController(),
    );
  }
}
