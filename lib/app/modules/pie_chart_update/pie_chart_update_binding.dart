import 'package:get/get.dart';

import 'pie_chart_update_controller.dart';

class PieChartUpdateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PieChartUpdateController>(
      () => PieChartUpdateController(),
    );
  }
}
