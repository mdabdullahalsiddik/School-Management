import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:school_management/app/core/widgets/custom_button.dart';
import 'package:school_management/app/core/widgets/custom_text_field.dart';

import 'teacher_add_controller.dart';

class TeacherAddPage extends GetView<TeacherAddController> {
  const TeacherAddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: Text(
            textAlign: TextAlign.center,
            "Teacher Add",
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Colors.white,
                ),
          ),
        ),
        body: GetBuilder<TeacherAddController>(
            init: TeacherAddController(),
            builder: (controller) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 20,
                  ),
                  child: Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Gap(10),
                      Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          controller.pickedImage == null
                              ? CircleAvatar(
                                  radius: 50,
                                  backgroundColor:
                                      Theme.of(context).colorScheme.primary,
                                  //backgroundImage:
                                  // AssetImage("assets/images/profile.png"),
                                )
                              : CircleAvatar(
                                  radius: 50,
                                  backgroundColor:
                                      Theme.of(context).colorScheme.primary,
                                  backgroundImage:
                                      FileImage(controller.pickedImage!),
                                ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                            child: IconButton(
                              onPressed: () {
                                _showDialog(context);
                              },
                              icon: const Icon(Icons.edit),
                            ),
                          ),
                        ],
                      ),
                      const Gap(20),
                      Form(
                        key: controller.forky,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CustomTextFromField(
                              controller: controller.nameController,
                              hintText: "Teacher Full Name",
                              validator: (p0) {
                                if (p0!.isEmpty) {
                                  return "Teacher Full name can't be empty";
                                }
                                return null;
                              },
                            ),
                            const Gap(5),
                            CustomTextFromField(
                              controller: controller.jobTitleController,
                              hintText: "Teacher Job Title",
                              validator: (p0) {
                                if (p0!.isEmpty) {
                                  return "Teacher Job title can't be empty";
                                }
                                return null;
                              },
                            ),
                            const Gap(5),
                            CustomTextFromField(
                              controller: controller.phoneController,
                              hintText: "Teacher Phone Number",
                              validator: (p0) {
                                if (p0!.isEmpty) {
                                  return "Teacher Phone Number can't be empty";
                                }
                                return null;
                              },
                            ),
                            const Gap(5),
                            CustomTextFromField(
                              controller: controller.emailController,
                              hintText: "Teacher Email Address",
                              validator: (p0) {
                                if (p0!.isEmpty) {
                                  return "Teacher Email Address can't be empty";
                                }
                                return null;
                              },
                            ),
                            const Gap(5),
                            Obx(() => CustomTextFromField(
                                  controller: controller.passwordController,
                                  hintText: "Password",
                                  obscureText:
                                      controller.passwordValidator.value,
                                  textInputAction: TextInputAction.done,
                                  suffixIcon: IconButton(
                                    onPressed: () =>
                                        controller.setPasswordValidator(),
                                    icon: Icon(
                                      // ignore: unrelated_type_equality_checks
                                      controller.passwordValidator == true
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    ),
                                  ),
                                  validator: (p0) {
                                    if (p0!.isEmpty) {
                                      return "Password can't be empty";
                                    }
                                    return null;
                                  },
                                )),
                            const Gap(10),
                            CustomButton(
                              text: "Teacher Add",
                              onTap: () => controller.add(),
                            )
                          ],
                        ),
                      ),
                    ],
                  )),
                ),
              );
            }));
  }

  Future<dynamic> _showDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AboutDialog(
          applicationName: "School Management",
          applicationIcon: const Icon(
            Icons.school_outlined,
          ),
          children: [
            InkWell(
                onTap: () {
                  controller.cameraPickImage();
                  Navigator.pop(context);
                },
                child: const ListTile(
                  leading: Icon(
                    Icons.camera_alt,
                  ),
                  title: Text("Camera"),
                )),
            InkWell(
              onTap: () async {
                await controller.galleryPickImage();
                // ignore: use_build_context_synchronously
                Navigator.pop(context);
              },
              child: const ListTile(
                leading: Icon(
                  Icons.image,
                ),
                title: Text("Gallery"),
              ),
            ),
          ],
        );
      },
    );
  }
}
