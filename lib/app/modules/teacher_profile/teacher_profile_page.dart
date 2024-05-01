import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management/app/routes/pie_chart_update_routes.dart';
import 'package:school_management/app/routes/teacher_list_routes.dart';
import 'package:shimmer/shimmer.dart';

import 'teacher_profile_controller.dart';

class TeacherProfilePage extends GetView<TeacherProfileController> {
  const TeacherProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        leading: IconButton(
          onPressed: () {
            Get.toNamed(TeacherListRoutes.teacherList);
          },
          icon: const Icon(Icons.arrow_back_outlined),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 30),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.edit_outlined),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection("teacher").snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Container(
                    height: size.height * .40,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          child: Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(
                              height: size.height * 0.10,
                              width: size.width * 0.35,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.05,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Teacher Name:",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                            ),
                            Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[100]!,
                              child: Text(
                                "",
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                            ),
                            Text(
                              "Teacher Job Title:",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                            ),
                            Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[100]!,
                              child: Text(
                                "",
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                            ),
                            Text(
                              "Teacher Email:",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                            ),
                            Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[100]!,
                              child: Text(
                                "",
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                            ),
                            Text(
                              "Teacher Password:",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                            ),
                            Text(
                              "",
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            Text(
                              "Teacher Phone:",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                            ),
                            Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[100]!,
                              child: Text(
                                "",
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                }
                return Container(
                  height: size.height * .40,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        child: Container(
                          height: size.height * 0.10,
                          width: size.width * 0.35,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(20),
                            ),
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(
                                snapshot.data!.docs[Get.arguments]['image'],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.05,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Teacher Name:",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                          ),
                          Text(
                            snapshot.data!.docs[Get.arguments]['name'],
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          Text(
                            "Teacher Job Title:",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                          ),
                          Text(
                            snapshot.data!.docs[Get.arguments]['jobTitle'],
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          Text(
                            "Teacher Email:",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                          ),
                          Text(
                            snapshot.data!.docs[Get.arguments]['email'],
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          Text(
                            "Teacher Password:",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                          ),
                          Text(
                            snapshot.data!.docs[Get.arguments]['password'],
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          Text(
                            "Teacher Phone:",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                          ),
                          Text(
                            snapshot.data!.docs[Get.arguments]['phone'],
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ],
                      )
                    ],
                  ),
                );
              }),
          SizedBox(
              height: size.height * 0.30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 200,
                    child: StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection("teacher")
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[100]!,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  const Text(
                                    "Attendance",
                                  ),
                                  PieChart(
                                      swapAnimationDuration:
                                          const Duration(milliseconds: 1500),
                                      swapAnimationCurve:
                                          Easing.emphasizedAccelerate,
                                      PieChartData(sections: [
                                        PieChartSectionData(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                            value: 100),
                                        PieChartSectionData(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .error,
                                            value: 100)
                                      ])),
                                ],
                              ),
                            );
                          }
                          return Stack(
                            alignment: Alignment.center,
                            children: [
                              const Text(
                                "Attendance",
                              ),
                              PieChart(
                                  swapAnimationDuration:
                                      const Duration(milliseconds: 1500),
                                  swapAnimationCurve:
                                      Easing.emphasizedAccelerate,
                                  PieChartData(sections: [
                                    PieChartSectionData(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      value: double.parse(snapshot
                                          .data!
                                          .docs[Get.arguments]['attendance']
                                              ["present"]
                                          .toString()),
                                    ),
                                    PieChartSectionData(
                                      color:
                                          Theme.of(context).colorScheme.error,
                                      value: double.parse(snapshot
                                          .data!
                                          .docs[Get.arguments]['attendance']
                                              ["absent"]
                                          .toString()),
                                    )
                                  ])),
                            ],
                          );
                        }),
                  ),
                  SizedBox(
                    width: 200,
                    child: StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection("teacher")
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[100]!,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  const Text(
                                    "Performance",
                                  ),
                                  PieChart(
                                      swapAnimationDuration:
                                          const Duration(milliseconds: 1500),
                                      swapAnimationCurve:
                                          Easing.emphasizedAccelerate,
                                      PieChartData(sections: [
                                        PieChartSectionData(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                            value: 100),
                                        PieChartSectionData(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .error,
                                            value: 100)
                                      ])),
                                ],
                              ),
                            );
                          }
                          return InkWell(
                            onTap: () {
                              Get.toNamed(PieChartUpdateRoutes.pieChartUpdate,
                                  arguments: Get.arguments,
                                  parameters: {
                                    "id": snapshot.data!.docs[Get.arguments].id
                                  });
                            },
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                const Text(
                                  "Performance",
                                ),
                                PieChart(
                                    swapAnimationDuration:
                                        const Duration(milliseconds: 1500),
                                    swapAnimationCurve:
                                        Easing.emphasizedAccelerate,
                                    PieChartData(sections: [
                                      PieChartSectionData(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        value: double.parse(snapshot
                                            .data!
                                            .docs[Get.arguments]["performance"]
                                                ["completed"]
                                            .toString()),
                                      ),
                                      PieChartSectionData(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primaryContainer,
                                        value: double.parse(snapshot
                                            .data!
                                            .docs[Get.arguments]["performance"]
                                                ["incomplete"]
                                            .toString()),
                                      )
                                    ])),
                              ],
                            ),
                          );
                        }),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
