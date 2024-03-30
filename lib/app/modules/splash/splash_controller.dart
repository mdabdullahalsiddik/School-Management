import 'package:get/get.dart';
import 'package:school_management/app/routes/sing_in_routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    time();
    super.onInit();
  }

  void time() async {
    Future.delayed(const Duration(seconds: 5)).then(
      (value) => Get.toNamed(
        SingInRoutes.singIn,
      ),
    );
  }
}
