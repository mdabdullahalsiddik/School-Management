import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import 'teacher_list_controller.dart';

class TeacherListPage extends GetView<TeacherListController> {
  const TeacherListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: const Text('Teachers', style: TextStyle(color: Colors.white)),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 30),
              child: IconButton(
                  onPressed: () {
                    controller.teacherAdd();
                  },
                  icon: const Icon(
                    Icons.person_add_outlined,
                    color: Colors.white,
                  )),
            )
          ]),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("teacher").snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Column(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: InkWell(
                          child: ListView.separated(
                              separatorBuilder: (context, index) {
                                return const Gap(10);
                              },
                              shrinkWrap: true,
                              itemCount: 10,
                              itemBuilder: (context, index) {
                                return Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                      side: BorderSide(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                      )),
                                  child: const ListTile(
                                    leading: Icon(
                                      Icons.people_alt_outlined,
                                    ),
                                    title: Text(""),
                                    subtitle: Text(""),
                                  ),
                                );
                              }),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
            return Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
                    child: ListView.separated(
                        separatorBuilder: (context, index) {
                          return const Gap(10);
                        },
                        shrinkWrap: true,
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              controller.teacherProfile(
                                index,
                              );
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  side: BorderSide(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  )),
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundColor:
                                      Theme.of(context).colorScheme.primary,
                                  backgroundImage: NetworkImage(
                                    snapshot.data!.docs[index]['image'],
                                  ),
                                ),
                                title: Text(snapshot.data!.docs[index]['name']
                                    .toString()),
                                subtitle: Text(snapshot
                                    .data!.docs[0]['jobTitle']
                                    .toString()),
                              ),
                            ),
                          );
                        }),
                  ),
                ),
              ],
            );
          }),
    );
  }
}
