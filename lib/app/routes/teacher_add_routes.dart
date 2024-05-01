import 'package:get/get.dart';

import '../modules/teacher_add/teacher_add_binding.dart';
import '../modules/teacher_add/teacher_add_page.dart';

class TeacherAddRoutes {
  TeacherAddRoutes._();

  static const teacherAdd = '/teacher-add';

  static final routes = [
    GetPage(
      name: teacherAdd,
      page: () => const TeacherAddPage(),
      binding: TeacherAddBinding(),
    ),
  ];
}
