import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management/app/core/widgets/custom_text_field.dart';
import 'package:school_management/app/routes/teacher_profile_routes.dart';

import 'pie_chart_update_controller.dart';

class PieChartUpdatePage extends GetView<PieChartUpdateController> {
  const PieChartUpdatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Theme.of(context).colorScheme.primary,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              CustomTextFromField(
                controller: controller.performanceCompletedController,
                hintText: "Performance Completed",
                validator: (p0) {
                  if (p0!.isEmpty) {
                    return "Performance Completed can't be empty";
                  }
                  return null;
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () {
                      controller.performanceUpdate();
                    },
                    child: const Text("Ok"),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.toNamed(
                        TeacherProfileRoutes.teacherProfile,
                        arguments: Get.arguments,
                      );
                    },
                    child: const Text("Cancel"),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
