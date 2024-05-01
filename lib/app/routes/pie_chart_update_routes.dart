import 'package:get/get.dart';

import '../modules/pie_chart_update/pie_chart_update_binding.dart';
import '../modules/pie_chart_update/pie_chart_update_page.dart';

class PieChartUpdateRoutes {
  PieChartUpdateRoutes._();

  static const pieChartUpdate = '/pie-chart-update';

  static final routes = [
    GetPage(
      name: pieChartUpdate,
      page: () => const PieChartUpdatePage(),
      binding: PieChartUpdateBinding(),
    ),
  ];
}
