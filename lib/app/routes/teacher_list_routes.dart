import 'package:get/get.dart';

import '../modules/teacher_list/teacher_list_binding.dart';
import '../modules/teacher_list/teacher_list_page.dart';

class TeacherListRoutes {
  TeacherListRoutes._();

  static const teacherList = '/teacher-list';

  static final routes = [
    GetPage(
      name: teacherList,
      page: () => const TeacherListPage(),
      binding: TeacherListBinding(),
    ),
  ];
}
