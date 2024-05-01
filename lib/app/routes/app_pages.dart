import 'home_routes.dart';
import 'splash_routes.dart';
import 'sing_in_routes.dart';
import 'sing_up_routes.dart';
import 'welcome_routes.dart';
import 'teacher_list_routes.dart';
import 'teacher_add_routes.dart';
import 'teacher_profile_routes.dart';
import 'pie_chart_update_routes.dart';

class AppPages {
  AppPages._();

  // ignore: constant_identifier_names
  static const INITIAL = '/';

  static final routes = [
    ...SplashRoutes.routes,
    ...HomeRoutes.routes,
		...SingInRoutes.routes,
		...SingUpRoutes.routes,
		...WelcomeRoutes.routes,
		...TeacherListRoutes.routes,
		...TeacherAddRoutes.routes,
		...TeacherProfileRoutes.routes,
		...PieChartUpdateRoutes.routes,
  ];
}
