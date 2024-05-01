import 'package:get/get.dart';

import '../modules/teacher_profile/teacher_profile_binding.dart';
import '../modules/teacher_profile/teacher_profile_page.dart';

class TeacherProfileRoutes {
  TeacherProfileRoutes._();

  static const teacherProfile = '/teacher-profile';

  static final routes = [
    GetPage(
      name: teacherProfile,
      page: () => const TeacherProfilePage(),
      binding: TeacherProfileBinding(),
    ),
  ];
}
