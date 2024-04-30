import 'home_routes.dart';
import 'splash_routes.dart';
import 'sing_in_routes.dart';
import 'sing_up_routes.dart';
import 'welcome_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = '/';

  static final routes = [
    ...SplashRoutes.routes,
    ...HomeRoutes.routes,
		...SingInRoutes.routes,
		...SingUpRoutes.routes,
		...WelcomeRoutes.routes,
  ];
}
